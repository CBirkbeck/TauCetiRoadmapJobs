# Review of PurityForFlatCohomology (pull request #1840 at 0306f55)

**Verdict:** needs changes

This is a full re-review of `TauCetiRoadmap/PurityForFlatCohomology/`: `README.md` (3049 lines) and `Suggested.lean` (452 lines, 41 declarations). The gate fails on `statement-hygiene=3`. There are nine findings, and one blocks:

- **R01 (P2).** A headline that the docstring calls not statable is statable at the pins.
- **R02–R09 (P3).** Duplication of pinned Tau Ceti carriers, an API catalogue in `Suggested.lean`, the gate hits, an ownership record, missing citations, missing contract sections, locators and one Check.

## R01 (P2) — Corollary 7.2.3 is statable at the pins, but the README and the docstring say `𝒪(1)` is missing

**Location.**
- `Suggested.lean` lines 79–83: "its twisting line bundle `𝒪(1)` and that bundle's class in `TauCeti.AlgebraicGeometry.LineBundleClass` are not."
- `README.md` line 328: "The twisting sheaf `𝒪(1)` on `Proj` is not at the pin."
- §7.8 (lines 2054–2064) states the theorem with no Lean name.

**Claim.** The pinned Tau Ceti has all three carriers:
- `𝒪(1)` on `Proj` of a polynomial quotient;
- its invertibility;
- its class in `LineBundleClass`.

So [CS24] Corollary 7.2.3 is a statable headline that is absent from `Suggested.lean`. The library claim on README line 328 is false.

**Witness.**
- `TauCeti/AlgebraicGeometry/ProjectiveSpectrum/TwistingSheaf/LocalTriviality.lean:212`, `Proj.isInvertible_twistingSheaf_of_iSup_eq_top`.
- `TensorProduct.lean:257`, `lineBundleClass_twistingSheaf_eq_zpow`, which forms `LineBundleClass.mk ⟨twistingSheaf 𝒜 1, …⟩`.
- `ProjectiveSpectrum/PolynomialQuotient.lean:61`, `HomogeneousIdeal.iSup_basicOpen_eq_top`.

**Repair.**
1. Add the following to `Suggested.lean`, under the Layer 7 section comment.
2. Add the imports `TauCeti.AlgebraicGeometry.ProjectiveSpectrum.TwistingSheaf.LocalTriviality`, `TauCeti.AlgebraicGeometry.ProjectiveSpectrum.PolynomialQuotient` and `TauCeti.RingTheory.GradedAlgebra.HomogeneousLocalization.Dehomogenization`.
3. Delete the docstring item at lines 79–83.
4. In README line 328, replace the sentence with the four Tau Ceti declarations above and add them to the Tau Ceti contract.
5. Name `picard_globalCompleteIntersection` in §7.8 and add those declarations to its *Needs:*.

```lean
attribute [local instance] MvPolynomial.gradedAlgebra in
/-- The class of `𝒪(1)` on `Proj (k[X₀, …, Xₙ] ⧸ I)`. README §7.8. -/
def classTwistingSheafOne {k : Type} [Field k] {n : ℕ}
    (I : HomogeneousIdeal (MvPolynomial.homogeneousSubmodule (Fin (n + 1)) k)) :
    TauCeti.AlgebraicGeometry.LineBundleClass (Proj I.quotientGrading) :=
  TauCeti.AlgebraicGeometry.LineBundleClass.mk
    ⟨Proj.twistingSheaf I.quotientGrading 1,
      Proj.isInvertible_twistingSheaf_of_iSup_eq_top
        (fun j ↦ Ideal.Quotient.mk I.toIdeal (MvPolynomial.X j)) I.mk_X_mem_quotientGrading
        I.iSup_basicOpen_eq_top 1⟩

attribute [local instance] MvPolynomial.gradedAlgebra in
/-- **Picard groups of global complete intersections** (Česnavičius–Scholze, Corollary 7.2.3). -/
theorem picard_globalCompleteIntersection {k : Type} [Field k] {n : ℕ}
    (I : HomogeneousIdeal (MvPolynomial.homogeneousSubmodule (Fin (n + 1)) k))
    (fs : List (MvPolynomial (Fin (n + 1)) k)) (hhom : ∀ f ∈ fs, ∃ d, 0 < d ∧ f.IsHomogeneous d)
    (hreg : RingTheory.Sequence.IsWeaklyRegular (MvPolynomial (Fin (n + 1)) k) fs)
    (hI : I.toIdeal = Ideal.ofList fs) (hdim : fs.length + 2 ≤ n) :
    (∀ (x : TauCeti.AlgebraicGeometry.LineBundleClass (Proj I.quotientGrading)) (m : ℕ), 0 < m →
      x ^ m ∈ Subgroup.zpowers (classTwistingSheafOne I) →
        x ∈ Subgroup.zpowers (classTwistingSheafOne I)) ∧
    (fs.length + 3 ≤ n → ∀ x, x ∈ Subgroup.zpowers (classTwistingSheafOne I)) := by
  sorry
```

**Tested.**
- A scratch copy of `Suggested.lean` with this repair and those of R02 and R03 elaborates with `lake env lean`: exit 0, 8 `sorry` warnings, no other message.
- The field is in `Type` because the cover index of `isInvertible_twistingSheaf_of_iSup_eq_top` lives in the ring's universe. A `ULift` index would avoid this, but it is flagged by statement-hygiene in a signature.
- Refuting instances of the theorem: the quadric surface `xw − yz` (`n = 3`, one equation) has `Pic = ℤ²` and `[𝒪(1)] = (1, 1)`, so the quotient is `ℤ` and torsion-free. The plane cubic (`n = 2`, one equation) is excluded by `hdim`.

## R02 (P3) — `puncturedSpectrum`, `finiteEtalePullback` and §1.8's API restate Tau Ceti, and the docstring's reason for omitting the `π_1` clauses is false

**Location.**
- `Suggested.lean` lines 101–107 (`puncturedSpectrum`) and 148–157 (`finiteEtalePullback`), used in the four headlines at lines 163–232.
- The docstring at lines 84–85: "finite étale schemes over a connected scheme are not given the structure of a Galois category with a fibre functor".
- `README.md` §1.8, lines 1009–1018: the definition and three API targets.
- §0.1 and Scope lines 88–92 compare only with LocalPurity §1.1.

**Claim.** The pins already provide the punctured spectrum of a local ring, finite étale pullback with its identity, composition and coproduct laws, and the Galois category. The roadmap must cite these and state its headlines on them, not on parallel carriers. The `π_1` clauses of [CS24] Theorem 3.3.1 are statable. CS24 line 1429 says they follow from the functor statements, so the docstring should say that instead.

**Witness.**
- `TauCeti/AlgebraicGeometry/FiniteEtale/PuncturedSpectrum.lean:56–58`: `TauCeti.IsLocalRing.restrictPunctured R := FiniteEtaleScheme.pullback (puncturedSpectrum R).ι`.
- `FiniteEtale/Fiber.lean:51, 78, 96, 179` (`pullback`, `pullbackId`, `pullbackComp`, `pullbackCompFiberIso`).
- `Exactness.lean:56`.
- `Galois/Category.lean:106`.

**Repair.**
1. Delete `puncturedSpectrum` and `finiteEtalePullback` from `Suggested.lean`.
2. In `zariskiNagata_*` write `TauCeti.IsLocalRing.restrictPunctured R` and `ConnectedSpace (TauCeti.IsLocalRing.puncturedSpectrum R)`.
3. In `localPicard_*` write `LineBundleClass (TauCeti.IsLocalRing.puncturedSpectrum R)`.
4. Import `TauCeti.AlgebraicGeometry.FiniteEtale.PuncturedSpectrum`.
5. Replace the docstring item at lines 84–85 with: "the `π_1` clauses of Theorem 3.3.1 follow from the stated functor clauses through Tau Ceti's `GaloisCategory (FiniteEtaleScheme S)` (SGA 1 V 6.9–6.10) and are not restated".
6. In §1.8, cite `TauCeti.FiniteEtaleScheme.pullback`, `pullbackId`, `pullbackComp`, the `PreservesFiniteCoproducts` instance and `TauCeti.IsLocalRing.restrictPunctured`/`PurityHolds` instead of defining `finiteEtalePullback`.
7. In §0.1, keep the semilocal carrier as a README target and compare it with `TauCeti.IsLocalRing.puncturedSpectrum`. Its quasi-compactness bullet is `TauCeti.IsLocalRing.isCompact_puncturedSpectrum_of_fg_maximalIdeal` in the local case.
8. List all of these in the Tau Ceti contract.

**Tested.**
- The restated headlines elaborate in a scratch file (3 `sorry` warnings).
- `restrictPunctured_faithful_iff` (`PuncturedSpectrum.lean:92`) already gives the `Faithful` conjunct when `dim R > 0`. Keeping that conjunct is optional.

## R03 (P3) — `Suggested.lean` catalogues 29 declarations of SGA 3 VIII–X that are neither headlines nor needed to state one

**Location.** `Suggested.lean` lines 234–448:
- the definitions `diagonalizableGroup`, `diagonalizableGroupMap`, `IsDiagonalizable`, `IsMultiplicativeType` and `IsTorus`;
- 24 theorems, from `isCommMonObj_diagonalizableGroup` to `exists_largestSubtorus`;
- the imports at lines 4–7;
- the docstring at lines 18–19 and 28–35.

**Claim.** The acceptance test may carry only headline theorems and the simple definitions they need. The roadmap's own docstring (lines 67–70) says that purity for groups of multiplicative type, the only headline these objects serve, is not statable. README lines 53–59 present the block as supporting theory, so it is an API catalogue.

**Witness.**
- Docstring lines 67–70: "the groups are defined below (§7.12c), but the statements need the fppf and étale cohomology of a group over a scheme with restriction maps".
- No headline at lines 159–232 uses any declaration from lines 234–448.

**Repair.**
1. Delete lines 234–448, the imports at lines 4–7 and the docstring text at lines 18–19 (", and diagonalizable groups, … (§§7.12a, 7.12c)") and 28–35.
2. Keep every statement in README §§7.12a–7.12e.
3. In README lines 53–59 and in the API bullets of §§7.12a–7.12e (lines 2195–2464), turn the backticked names of these declarations into prose, since the gate checks backticked names.

**Tested.** The repaired copy described under R01 has none of these declarations and elaborates.

## R04 (P3) — gate `statement-hygiene`: three flagged theorems, plus one the scanner misses

**Location.** `Suggested.lean`:
- line 264, `diagonalizableGroup_spec_iso`;
- line 271, `diagonalizableGroup_pullback_iso`;
- line 279, `diagonalizableGroup_points_equiv`;
- lines 296–300, `diagonalizableGroupHom_equiv_locallyConstant`, which concludes `∃ e : (… ⟶ …) ≃ LocallyConstant S (N →* M), …`.

**Claim.** The rule forbids a conclusion `Nonempty (A ≅ B)` or `∃ e : A ≃ B, …` unless the theorem is named `nonempty_*` or `exists_*`. The points statement also loses the README's naturality in `T` (README line 2207).

**Witness.**
- `gate.md`: `statement-hygiene=3 … FAIL`, at lines 265, 273 and 281.
- For `M = ℤ`, any abstract group isomorphism `Hom_S(T, 𝔾_m) ≃* Γ(T, 𝒪_T)^×` satisfies line 281, natural or not.

**Repair.** R03 deletes all four. Any of them that is kept must be renamed `nonempty_*`/`exists_*`, or must state the canonical real-bodied map together with `IsIso` (or, for the points, naturality in `T`).

**Tested.** The repaired copy contains none of the four, so the `statement-hygiene` count drops to 0.

## R05 (P3) — GroupSchemesOverABase plans §§7.12a–7.12e as its own and names this roadmap as its consumer, and the Scope does not record this

**Location.** `README.md` lines 162–175 ("Owned here and to be imported by later roadmaps") and the Downstream consumers section, lines 2937–2948.

**Claim.** One object currently has two owners, and each roadmap hands it to the other. The board excludes GroupSchemesOverABase as a supplier of this roadmap, and `ORDER.txt` does not list it. So this roadmap is the owner, and the record belongs here, as it already does for EtaleDualityAndPerverseSheavesPartII.

**Witness.**
- GroupSchemesOverABase (#1522), README line 1280: "PurityForFlatCohomology consumes 1.3, 1.4, 2.1–2.3 and 2.7 (diagonalizable groups, groups of multiplicative type and tori over a base…)".
- Its `Suggested.lean` line 161: `def IsMultiplicativeType`.

**Repair.**
1. Add a bullet under lines 171–174: "Diagonalizable groups, groups of multiplicative type and tori over a base, with character sheaves, subgroups, quotients and largest subtori (§§7.12a–7.12e): to be imported by GroupSchemesOverABase (its §§1.1–1.5, 2.1–2.3, 2.7)."
2. Change "Two roadmaps later in the merge order" (line 162) to "Three roadmaps".
3. Add the same line under Downstream consumers.

The duplicate itself is removed in #1522.

## R06 (P3) — §7.12b re-derives affine results that Tau Ceti already proves, without citing them

**Location.** `README.md` lines 2260–2262, the route of `isPullback_diagonalizableGroupMap_quotient`: "over `Spec A`, the tensor product `A[M] ⊗_{A[N]} A` … is `A[M/φ(N)]`". Also the API bullet at lines 2287–2288 (torsor, degree, étale locus).

**Claim.** The affine kernel computation, its degree, its étale criterion and the isogeny statement are all at the pin. The contract cites other Tau Ceti diagonalizable-group results (lines 297–322) but not these.

**Witness.**
- `TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Kernel.lean:78`, `kernelCoordinateIso` ("the kernel of `D(N) → D(M)` has coordinate Hopf algebra `R[N / range p]`").
- `Kernel.lean:115`, `finrank_kernelCoordinate`.
- `Etale.lean:39`, `:50`.
- `Scheme/Isogeny.lean:41`.

**Repair.**
1. Add `TauCeti.DiagonalizableGroup.kernelCoordinateIso`, `finrank_kernelCoordinate`, `etale_kernelCoordinate_of_isUnit_card`, `etale_kernelCoordinate_iff_isUnit_card` and `isCentralIsogeny_groupSchemeMap_of_injective_of_finite_quotient` to the Tau Ceti contract and to §7.12b's *Needs:*.
2. Make the route read "over `Spec A` this is Tau Ceti `kernelCoordinateIso`; base change along `S → Spec ℤ` gives it over `S`".

**Tested.** All five names resolve with `#check` at the pin.

## R07 (P3) — the SchemeAndStackFoundations contract and Scope omit §§0.3, 0.21, 4.7 and 4.8, which the *Needs:* lines use

**Location.**
- §1.4 *Needs:* (line 904, "§§0.21, 2.15");
- §1.7 *Needs:* (line 991, "§§4.7–4.8");
- §7.8 *Needs:* (line 2063, "§§0.3, 3.4");
- the Layer 1 and Layer 7 Dependencies (lines 1081, 2578);
- the Scope list (lines 98–99) and the contract (lines 359–381), which list none of these sections.

**Claim.** The contract must name every section consumed.

**Witness.** SchemeAndStackFoundations on main has all four sections:
- §0.3 "Proj, base change and the relative Proj" (line 552);
- §0.21 "…excellent rings and schemes" (line 1395);
- §4.7 (line 5340);
- §4.8 (line 5384).

**Repair.** Add to Scope lines 98–99 and to the contract: "§0.3 Proj and the relative Proj; §0.21 excellent rings and schemes; §4.7 the formal spectrum; §4.8 formal completion and coherent formal modules".

## R08 (P3) — locators into texts that do not contain the statement

**Location.**
- §7.12a line 2184 ("SGA 3 VIII, 1.1; [C19] §2; [CS24] §7.2, p. 91"), §7.12c line 2320, §7.12d line 2392 ("SGA 3 X, §5; [C19] §2") and §7.13 line 2480.
- §7.6 Check 3, line 2029: "`Pic(U_S)_tors` is infinite ([CS24] Remark 7.2.4)".

**Claim.**
- C19 §2 treats restriction of scalars along finite flat maps. It defines neither `D_S(M)`, nor groups of multiplicative type, nor the character sheaf.
- CS24 Remark 7.2.4 concerns `Pic(E)` of an elliptic curve. The claim about `Pic(U_S)` of the cone is made in Remark 7.2.6.

**Witness.**
- C19 lines 105–110: §2, "Passage to a finite flat cover", with Lemma 2.1 and Propositions 2.2–2.3 on `Res_{S′/S}`. "character" occurs nowhere in C19.
- CS24 line 3762 (Remark 7.2.4) against line 3782 (Remark 7.2.6, "#(Pic(U_S)_tors) = ∞").

**Repair.**
1. Drop "[C19] §2" at lines 2184, 2320, 2392 and 2480. SGA 3 is the source.
2. At line 2480, if a C19 locator is wanted, cite "[C19] proof of Theorem 6.1, p. 13", which uses SGA 3 X 4.5 (C19 line 504).
3. At line 2029, write "([CS24] Remark 7.2.6, p. 90)".

## R09 (P3) — §7.9 Check 3 misstates parts (a) and (b)

**Location.** `README.md` line 2092: "For `X = Spec K` a field both parts say `H^i(K, 𝔾_m)` is torsion for `i ≥ 1`."

**Claim.**
- Part (a) concerns `i ≥ 2`.
- Part (b) concerns `H²` only.
- `H^1(K, 𝔾_m) = 0` follows from Hilbert 90, not from either part.

**Witness.** §7.9 at lines 2078–2080, "for every `i ≥ 2`" and "`H²_ét(X, 𝔾_m) → H²_ét(K, 𝔾_m)` is injective". For `X = Spec K`, the map in (b) is the identity.

**Repair.** "For `X = Spec K` a field, (a) says `H^i(K, 𝔾_m)` is torsion for `i ≥ 2` and (b) is the identity on `H²(K, 𝔾_m)`; `H^1(K, 𝔾_m) = 0` is Hilbert 90."

## Previous findings (PRREVIEW~3, head 8cbde9b)

- **R01 (P1, Boutot) — repaired.** The sharpness target is gone. Its examples are now §7.12 Checks (lines 2158–2170), with Boutot cited only for the source's own argument: "whose argument uses the finite generation of `Pic` … [Bou78] V, Corollaire 4.9". No route uses [Bou78]. The Checks that cited the old §7.13 now cite "§7.12, Checks" (lines 2118, 2613, 2716).
- **R02 (P2, re-planning GroupSchemesOverABase) — superseded.** The requested repair, citing GroupSchemesOverABase, is now barred: this review's brief lists GroupSchemesOverABase among roadmaps that are never suppliers. Commit 0306f55 owns the material here (§§7.12a–7.12e), which is the right direction. What remains is the ownership record (R05) and the Lean catalogue (R03).
- **R03 (P3, statement-hygiene) — not repaired.** The three theorems are still there (lines 264, 271, 279). `points_equiv` now uses `≃*`, so multiplicativity is stated, but it is still `Nonempty` and still has no naturality. This is R04.
- **PRREVIEW~1 R01/R03 and ~2 R01 — still repaired.** The declared gaps are at lines 428, 502 and 521, and the §3.3 locator "[CS24] §5.1.11, p. 52" is at line 1234.

## Verified sound

**Gate, dependency check, build and diff.**
- The rerun of `gate … --base origin/main` matches `gate.md`: every check is 0 except `statement-hygiene=3`, with the same three lines (R04). The rerun prints no `build` field; the `lake env lean` run below covers elaboration, and `gate.md` records `build=0`.
- `gate --depcheck … --movable` prints `depcheck: 244 roadmaps, 2464 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `lake env lean` on `Suggested.lean` exits 0 with exactly 31 `declaration uses sorry` warnings and no other message.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/PurityForFlatCohomology'` is empty.
- No process words, PR numbers, LaTeX, `lemma`, `set_option`, `#eval` or `True` placeholders.
- The pins in the README (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`) match `lake-manifest.json`.

**Signatures and probe.**
- I appended `#check @…` for all 41 declarations and elaborated the file once (exit 0). The file has no section `variable`s.
- Each elaborated type matches its README statement. For example, `etale_diagonalizableGroup_iff` carries `[Nonempty S]`, `diagonalizableGroupMap_bijective` carries `[ConnectedSpace S]`, and `localPicard_torsion_eq_one` carries `IsNoetherianRing`, `IsCompleteIntersection` and `3 ≤ ringKrullDim R`.
- One-tactic probe: I replaced every `sorry` by `first | rfl | infer_instance | simp | decide | exact ⟨Iso.refl _⟩ | aesop`. The result was 31 errors and 0 closures.

**Headline theorems.**
- The README lists seven headlines, all stated: `zariskiNagata_full_faithful_connected`, `zariskiNagata_isEquivalence`, `localPicard_torsion_eq_one`, `localPicard_subsingleton`, `frobeniusSemilinear_exists_fixed_basis`, `free_of_endomorphisms_iso_pi` and `isRegularLocalRing_uniqueFactorizationMonoid`.
- Docstring claims checked at the pin and found correct:
  - Tau Ceti has no Azumaya Brauer group of a scheme: `TauCeti/Algebra/BrauerGroup/Basic.lean` covers fields only.
  - There are no torsors under finite flat groups over a scheme: `Fppf/Quotient/Torsor.lean` only proves a pullback square.
  - There are no animated rings.
- Docstring claims checked and found false: R01 (`𝒪(1)` on `Proj`) and R02 (the Galois category).
- Neither Mathlib nor Tau Ceti has a complete-intersection predicate, a virtual dimension, the general factoriality of regular local rings (Tau Ceti's is `ringKrullDim R ≤ 2`, `UniqueFactorization.lean:59`), Katz's theorem or Auslander's criterion.

**Sources: the seeded sample.** Page numbers come from the cache's page markers (CS24 arXiv v3, C19 arXiv v4). No README locator is flagged as unverified.

| Target | Checked against |
|---|---|
| 0.2 | CS24 §1.4 (lines 296–322, pp. 8–9), Lemma 7.1.1 (line 3623, p. 86); BC22 Lemma 2.3.2 (line 1126, p. 27). The spectral sequence is as stated. |
| 0.5 | CS24 Lemma 7.2.7 (lines 3796–3827, pp. 90–91). Hypotheses (a) and (b) and the route (Koszul colimit, EGA IV 5.10.5) match. |
| 1.5 | CS24 Lemma 3.2.3 (lines 1356–1380, p. 33): bijective for `i < dim R − 1`, injective at `dim R − 1`; route via ILO14 XV 1.2.4 and XVII 0.2. |
| 3.2 | CS24 Proposition 5.2.4 (line 2256, p. 54), §5.2.5 (line 2279, p. 55), Theorem 5.2.6 (line 2318, p. 56). |
| 3.4 | CS24 Theorem 5.3.5 (line 2444, p. 59), Corollary 5.3.7 (line 2537, p. 61), Corollary 5.3.8 (lines 2560–2575, pp. 61–62). The route matches the proof (lines 2542–2556). |
| 5.5 | CS24 Proposition 4.2.9 (line 1768, p. 43). Its "perfectoid ℤ_p-algebras" is the README's "perfectoid rings", since integral perfectoid rings are p-adically complete. |
| 5.9 | CS24 Theorem 6.1.1 and (6.1.1.1) (lines 3430–3433, p. 82); (1.1.6) (line 141, p. 4). |
| 6.1 | CS24 Lemma 6.2.2 (lines 3480–3490, p. 83). |
| 6.3 | CS24 Theorem 6.2.4 (line 3540, p. 84), proof (lines 3549–3554, p. 85); Theorem 1.3.1 (line 288, p. 8). |
| 7.6 | CS24 Theorem 7.2.1 (lines 3707–3726, pp. 88–89), Theorem 1.1.3 (line 92, p. 3). The Check 3 locator is R08. |
| 7.12d | SGA 3 X §5 is uncertified (below). The [C19] §2 locator fails (R08). |
| 7.15 | CS24 Theorem 7.2.9 (lines 3871–3878, p. 92), footnote 28 (line 3882), proof (lines 3887–3893, p. 93). |
| 8.7 | C19 Theorem 1.1 (lines 30–32, p. 1), Theorem 6.1 (line 493, p. 13). |
| 8.12 | C19 Remark 6.3, (6.3.3) (lines 543–550, p. 14); CTS87 Lemma 2.4 (line 605, p. 164). |
| 8.15 | C19 Remark 6.4 (lines 551–554, p. 14); Poo17 Proposition 6.8.1 (line 8099, p. 196), Warning 6.8.2 (line 8125, p. 197). |

Also checked:
- Kat73 Proposition 4.1.1 (line 2310, pp. 142–145).
- CS24 Theorem 7.1.2 (line 3632), whose regular clause as printed is "≥ d − 1". The README's `max(d − 1, 1)` is justified (Source issues).
- CTS87 §0.5 (p. 155), Definition 1.2 (p. 157) and Theorem 2.2 (p. 161), for §8.11.

**Supplier citations resolved** (sections found as headings at main or at the supplier's open head):
- **SchemeAndStackFoundations (main):** §§0.3, 0.4, 0.6, 0.9, 0.12–0.14, 0.17, 0.21, 0.24, 1.1, 1.15, 1.18, 2.1–2.3, 2.7, 2.9–2.11, 2.15, 2.22, 3.4, 4.7, 4.8.
- **LocalPurity (main):** §§1.1, 1.3, 2.1, 2.2. `FEt.pullback` is in its `Suggested.lean` line 76.
- **ModularCurves (main):** 0B (line 281), 0E (387), 4D (1166, with `ringKrullDim_adicCompletion`).
- **EtaleCohomologyFoundations (main):** F.0.2 (with `VanishingCycles.finiteEtaleGaloisCategory`), F.0.4, F.5.
- **Other roadmaps on main:** DerivedModuleAlgebra §§0.K.1, 0.4, 0.25, 1.5, 1.7; EnhancedDerivedSheaves E5:animation.1–4; PerfectoidSpaces §§P1.16–P1.18, P1.24, P1.25, P3.7, P7.16a, P7.17 and the targets *semiperfectoid-andre-cover*, *regular-cohen-presentations*, *regular-finite-flat-residue-tower*, *regular-finite-flat-perfectoid-tower*; PurityOfBranchLocus §0.3 `auslander_buchsbaum`.
- **Open heads:**
  - DerivedDeRhamCohomology (#868): §§0.19, 0.21, 1.10, with the three `DerivedDeRham.*` names;
  - DeformationAndDerivedPatchingAlgebra (#1034): §3.4 and §6.9 `localCI_parafactorial`;
  - PrismaticCohomologyPartIII (#1070): §6.0 `perfectDieudonneComparison`, `pContinuity`, `excision`;
  - LefschetzPencilsAndVanishingCycles (#873): §0.10;
  - PerfectoidQuotients (#1042): §§0.1, 0.2, 0.6 and its four names;
  - PrismaticCohomology (#1057): §2.0;
  - PrismaticCohomologyPartII (#1065): Layer 4;
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory (#879): §§R07.1.40, R07.1.41, R07.2.8;
  - ArithmeticGaloisDuality (#858): §R02.2.4, which contains the Witt sequence for any perfect residue field;
  - MotivesAndAlgebraicCycles (#1313): §0.5b.
- **PerfectoidQuotientsPartII (board package):** §§Q5.2, Q5.4, Q6.3–Q6.7, Q7.1, Q7.3, Q10.1. The resolver's "no roadmap" lead is a false positive.

**Library declarations opened at the pins.**
- **Mathlib:** `Scheme.fppfTopology` (`Sites/Fpqc.lean:54`), `fppfPrecoverage` (:41), `fpqcPrecoverage` (:61), `etalePrecoverage` (`Sites/Etale.lean:32`), `smallEtaleTopology` (:50), `cohomologyPresheafFunctor` (`SheafCohomology/Basic.lean:70`, with `HasSheafify J AddCommGrpCat.{v}` as the docstring says), `hopfSpec` (`Group/Affine.lean:177`), `specULiftZIsTerminal` (`Limits.lean:50`), `IsRegularRing.isRegularLocalRing_localization` (`RegularLocalRing/Defs.lean:94`), `Order.krullDim_eq_bot` (`KrullDimension.lean:609`), `localCohomology` (`LocalCohomology.lean:173`), `functorToContAction` (`Galois/Equivalence.lean:40`), `GrothendieckTopology.over` (`Sites/Over.lean:231`), `Submodule.spanFinrank` (`SpanRank.lean:66`).
- **Tau Ceti:** every name in the contract resolved with `#check` (31 names). `MonoidAlgebra.faithfullyFlat_mapDomainRingHom_of_injective` is at `Algebra/MonoidAlgebra/FaithfullyFlat.lean:31`, and `schemeFunctor_full`/`_faithful` carry `[ConnectedSpace (PrimeSpectrum R)]`/`[Nontrivial R]` as stated.

**Declared gaps.** `design/plan.json` and the README (lines 428, 502, 521) carry the same three slugs. Each is minimal:
- DerivedDeRhamCohomology §0.21 (line 412) states Avramov's criterion but not additivity;
- PrismaticCohomologyPartII has no Dieudonné equivalence over perfectoids;
- PerfectoidQuotientsPartII §Q10.1 builds the towers but does not compute their tilt.

**Ownership against open work.**
- **EtaleDualityAndPerverseSheavesPartII (#1743, `ORDER.txt` line 386).** It still claims local Lefschetz (its §7.3, README line 1570) with this roadmap's §1.6 as consumer. This roadmap is at line 221 and records #1743 as importer (lines 171–172), so the fix belongs in #1743. Its citation "§1.6" matches the current numbering.
- **SchemeAndStackFoundationsPartII (line 258).** It is recorded as the importer of Layer 3 and §7.10.
- **ReductiveGroups (main).** It covers diagonalizable groups over a field only (line 435).
- **LocalPurity revisions (#1807, #1808, #1854).** None mentions virtual dimension or the semilocal spectrum.
- **Overlaps.** None reported, and I found no dropped id.

**Adversarial table** (sampled targets, headlines, targets of findings).

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §0.2 supports | DVR `R` with `𝔾_m`; `𝔸¹`, `Z = {0}`, `𝔾_a` | `H^0_𝔪 = ker(R^× → K^×) = 0`, `H^1_𝔪 = K^×/R^× = ℤ` (`Pic R = 0`); `H^0_Z = 0` against `𝔾_a(Z) = k` | holds | none |
| §0.5 Hartogs | `𝔸²`, `Z = {0}`; `Z = V(x)`; line with doubled origin | `Γ = k[x,y]`; `Γ = k[x^{±1},y] ≠ k[x,y]`; two sections agree off the origin and differ at it | hypotheses needed | none |
| §1.5 local Lefschetz | DVR, `f` a uniformizer; `k⟦x,y⟧`, `f = x` | degree 0: `0 ↪ ℤ/ℓ`, injective only; degrees ≤ 1 both `0`, degree 2: `0 → ℤ/ℓ(−1)` not onto | range sharp | none |
| §3.2 animated supports | `A = k ⊕ k[1]`, `Z = ∅`; `A = 𝔽_p ⊕ 𝔽_p[1]`, `μ_p` | `fib(id) = 0` against classical `k[1]`; `π_0 μ_p(A) ⊇ coker(0 on π_1A) = 𝔽_p ≠ 0 = μ_p(𝔽_p)` | consistent with §3.3 | none |
| §3.4 Cor. 5.3.7/5.3.8 | `𝔽_p(s)`; `ℤ_p`; `ℤ` against `ℤ_p`, `p` odd | `H²(μ_p) = Br[p] ≠ 0`, `H^{≥3} = 0`; `H^{≥2}(ℤ_p, μ_{p^n}) = 0`; `H^1(ℤ, μ_p) = 0` but `ℤ_p^×/ℤ_p^{×p} = ℤ/p` | perfectness and henselianity needed | none |
| §5.5 products | `I = {*}`; `I = ∅`; `μ_{p^n}` | identity; `0 = 0` over the zero ring; `∏ A_inf(A_i)/p^n` on both sides with `V = ξφ^{-1}` | holds | none |
| §5.9 key formula | `A = 𝔽̄_p`, `ξ = p`, `ℤ/p`, `Z = Spec A` | `[A → A]` via `φ^{-1} − 1`: `H^0 = 𝔽_p`, `H^1 = 0`, matching étale cohomology | holds | none |
| §6.1 completion | `ℤ_p[x]`, `a = p`, sequence `x`; `ℚ_p/ℤ_p` | `ℤ_p⟨x⟩/(x) = ℤ_p`; classical completion `0` against derived `ℤ_p[1]`; `ℤ_p → 0 → 0` not exact | bounded torsion needed | none |
| §6.3 étale purity | `𝔽_p⟦x,y,z,t⟧/(x²,y²,xz−yt)`; `k⟦x,y⟧/(x,y)²` | `vdim = 4 − 3 = 1`, `H^0_𝔪(ℤ/p) = 0`; `vdim = 2 − 3 = −1`, `U = ∅`, `H^0_𝔪 = ℤ/p`, nothing claimed | holds | none |
| §7.6 / `localPicard_torsion_eq_one` | node `xy−zw`; `A_1`; Veronese cone `n = 3` | `Pic(U) = ℤ`, torsion-free; dimension 2, excluded, `Pic(U) = ℤ/2`; `vdim = 6 − 6 = 0 < 3`, not a complete intersection, `Pic(U) ⊇ ℤ/2`, excluded | hypotheses needed | R08 (Check locator) |
| `localPicard_subsingleton` | field; DVR; `k⟦x,y,z⟧` | `U = ∅`, one class; `U = Spec K`, `Pic = 0`; factorial, `Pic(U) ⊂ Cl(R) = 0` | holds | carrier R02 |
| §7.12d character sheaf | circle torus over `ℝ`; `μ_p/𝔽_p` | `X^* = ℤ_sign`, sections `0` over `ℝ` and `ℤ` over `ℂ`, so not constant and not diagonalizable; `X^* = ℤ/p` constant while `μ_p(reduced) = 1` | holds | R08 |
| §7.15 higher degrees | node, `𝔾_m`, `d = 3`; regular dimension 2, `d = 3` | `H^1(R) = 0 ≠ ℤ = H^1(U)`; the node is not geometrically factorial, so excluded; `Pic(U) = 0 = Pic(R)` | factoriality needed | none |
| §8.7 Brauer purity | `𝔸²_ℂ`, `Z = {0}`; coordinate axes | `Br′(𝔸² ∖ 0) = 0 = Br′(𝔸²)`; residue of `(x, y)_n` along `x = 0` is the Kummer class of `y ≠ 0` | codimension 2 needed | none |
| §8.12 norm-one torus | `ℙ¹_ℝ` | `H^1(ℝ, T) = ℝ^×/N(ℂ^×) = ℤ/2`; fibres at `t > 0` and `t < 0` differ; torsors over `𝔸¹_ℝ` are constant (CTS87 2.4) | class exists | none |
| §8.15 residue sequence | `ℤ_p`; `ℝ⟦t⟧`; `k⟦t⟧`, `k` separably closed and imperfect, `ℓ = p` | `0 → 0 → ℚ/ℤ ≅ ℚ/ℤ`; `ℤ/2 → (ℤ/2)² ↠ ℤ/2`; `Br(𝒪) = 0`, `H^1(k) = 0`, `Br(K)[p] ≠ 0`: fails, excluded | hypotheses needed | none |
| `zariskiNagata_full_faithful_connected` | `k⟦x,y⟧`; `k⟦x,y⟧/(xy)`; field | `vdim 2`, `U` connected; `vdim 1`, `U` is two punctured lines, excluded; `vdim 0`, `U = ∅`, not `ConnectedSpace` | hypothesis needed | carrier R02 |
| `zariskiNagata_isEquivalence` | `A_1`; node | `vdim 2`, `π_1(U) = ℤ/2 ≠ 1`, excluded; `vdim 3`, covers extend (SGA 2 X 3.4) | threshold sharp | carrier R02 |
| `frobeniusSemilinear_exists_fixed_basis` | `M = K`, `F = cφ`; `𝔽_3(t)^{perf}`, `F = tφ`; `M = 0` | `x^{p−1} = c^{-1}` solvable; `x² = 1/t` needs `v(x) = −1/2 ∉ ℤ[1/3]`; empty basis | algebraic closure needed | none |
| `free_of_endomorphisms_iso_pi` | `Rⁿ`; second syzygy `N` of `k` over `k⟦x,y,z⟧`; `r = 0` | `End = Rⁿ²`; `N` reflexive of rank 2, not free (`pd k = 3`), so no `End N ≅ N^r`; `End M = 0 ⇒ M = 0` | consistent | none |
| `isRegularLocalRing_uniqueFactorizationMonoid` | `ℤ_p⟦x⟧`; `A_1` | UFD; `xz = y²` gives two factorizations, and `A_1` is not regular | holds | none |
| Cor. 7.2.3 (R01) | quadric surface `xw − yz`; plane cubic | `Pic = ℤ²`, `[𝒪(1)] = (1,1)`, quotient `ℤ`; dimension 1, excluded by `hdim`, quotient has torsion `E[m]` for every `m` | statable at the pins | R01 |
| `finiteEtalePullback` (R02) | `f = 𝟙`; composite; `⊔` | Tau Ceti `pullbackId`, `pullbackComp`, `PreservesFiniteCoproducts` give exactly the three API bullets | duplicate | R02 |
| SGA 3 block (R03) | 24 theorems | 0/24 close in one tactic; 0 used by a headline | catalogue | R03 |
| `diagonalizableGroup_points_equiv` (R04) | `M = ℤ`, `T = 𝔾_{m,ℤ}` | both sides are `±t^ℤ ≅ ℤ/2 × ℤ`; every abstract isomorphism satisfies `Nonempty` | weaker than the README | R04 |
| §7.12b kernel (R06) | `φ = ·2 : ℤ → ℤ` | `A[ℤ] ⊗_{A[ℤ]} A = A[t]/(t² − 1) = 𝒪(μ_2)`, as Tau Ceti `kernelCoordinateIso` gives | duplicate route | R06 |
| §7.9 Check 3 (R09) | `X = Spec K` | (a) covers `i ≥ 2`, (b) is the identity on `H²`; `H^1 = 0` comes from Hilbert 90 | Check misattributes | R09 |

## Not verifiable

These sources are settled as uncertified, so I could not read them. I checked them only through the computations in the table and through the sources' own citations.
- **SGA 3 VIII 1.1–3.4, IX 1.1, 2.11 and X 4.5, §5.** These back §§7.12a–7.13, including the sampled §7.12d.
- **[Aus62] Theorem 1.3**, for `free_of_endomorphisms_iso_pi`. CS24 cites it only as "a result of Auslander … that crucially uses the regularity" (line 3684). I could not check whether the published statement assumes Tor-rigidity (unramified rings, extended by Lichtenbaum).
- **[Gro68] Brauer III 2.1 and 6.1 b), [Gab04b] Conjectures 2–3, [Bou78] V 4.9.** These were read only through CS24 lines 3764 and 3777–3790 and C19 line 552.
- **SGA 4 VII 5.7, X 5.1 and XVIII 3.1.8; SGA 5 I 1.12 and (4.2.2); [MB85] Lemme 2; [BH] 2.3.1; [DF84] Remark 3; [Avr77] 3.6.**

## Source issues

- **Error** in CS24 at Theorem 7.1.2, p. 87: the source says the regular clause needs dimension at least `d − 1`, which admits fields when `d = 1`; it should say dimension at least `max(d − 1, 1)`, as `Spec k ⊔ Spec k` with `Z` one point shows; affects a stated result.
- **Gap** in CS24 at the proof of Theorem 6.2.7, p. 85: the source says to apply Lemma 4.1.12 in degree `dim R`, although that lemma assumes `n < dim R`; it should drop that bound from Lemma 4.1.12, whose proof (p. 40) never uses it; affects the proof.
- **Misprint** in CS24 at the proof of Theorem 6.2.7, p. 85: the source says `f ∈ (p, x_1, …, x_n)²`; it should say `(p, x_1, …, x_d)²`; affects nothing.
- **Misprint** in CS24 at the proof of Theorem 3.3.1(b), p. 35: the source says `vdim(R_d) ≥ 3`; it should say `vdim(R) ≥ 3`; affects nothing.
- **Misprint** in CS24 at the proofs of Theorems 7.2.1 and 7.2.5, pp. 89–90: the source says `n ≥ 0`; it should say `n ≥ 1`; affects nothing.
- **Gap** in CS24 at Remark 7.2.6, p. 90: the source says the vertex of the affine cone over any complex elliptic curve is a complete intersection; it should specify a plane cubic or an intersection of two quadrics, since normal cones of degree at least 5 are not; affects nothing.
- **Gap** in C19 at Proposition 2.2, p. 4: the source infers injectivity of `H^1(V, G) → H^1(V, Res)` for possibly noncommutative `G` from lifting the trivial class; it should assume `G` commutative or argue fibrewise; affects nothing, because both uses have `G` commutative.

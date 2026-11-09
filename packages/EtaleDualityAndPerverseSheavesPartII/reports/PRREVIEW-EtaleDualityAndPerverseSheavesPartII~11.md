# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at 7fede29)

**Verdict:** needs changes

This is an incremental re-review of the 60 lines changed since 94b1e83. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning. Three of the four previous findings are repaired, and the repairs introduce nothing new. One blocking finding remains, carried over unchanged:
- **R01**: PurityForFlatCohomology, now at head 643f30e, still owns §§1.4–1.5, so local Lefschetz and local duality on regular local rings still have two owners. The repair is on that pull request's side; this folder needs no edit for it.

## R01 (P2) — Local Lefschetz and local duality on regular local rings still have two owners

**Location:**
- `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:23`: "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3 … and owns none of these statements."
- `README.md` Downstream consumers: "PurityForFlatCohomology §1.6 consumes local Lefschetz (§7.3)".

**Claim:** §§5.7, 6.11, 6.12, 7.1 and 7.3 are owned here, and PurityForFlatCohomology owns none of them.

**Witness:** PurityForFlatCohomology's pull request is now at head 643f30e (2026-11-09 05:00). In `TauCetiRoadmap/PurityForFlatCohomology/README.md` at that head:
- `:200–201` and `:3306–3307`: "to be imported by EtaleDualityAndPerverseSheavesPartII" for §§1.4–1.5.
- `:1075` (§1.4) states affine Lefschetz on principal punctured opens, the normalised dualizing complex and local duality for excellent regular local rings: §§7.1/5.7, 6.11 and the regular case of §6.12 here.
- `:1128` (§1.5) states the local Lefschetz theorem of §7.3 here.
- `:1169` (the *Needs* of §1.6) cites its own §1.5.

**Repair:** unchanged from the previous report; the operator settles it once for both pull requests.
- **In PurityForFlatCohomology:** delete §§1.4–1.5 and the importer bullets at `:200–201` and `:3306–3307`; cite this roadmap's §5.7 (or §7.1), §§6.10–6.11, §6.12 and §7.3; in the §1.6 *Needs* at `:1169` replace "§§0.2, 1.1, 1.5" with "§§0.2, 1.1; EtaleDualityAndPerverseSheavesPartII §7.3".
- **In this folder:** no change.

**Test of the repair, redone at 643f30e:** on a scratch copy of that README with only line 1169 edited, the dependency check with `--movable` prints `moved: PurityForFlatCohomology moved in the merge order from #218 to #386, right after its last supplier EtaleDualityAndPerverseSheavesPartII` and then `depcheck: 238 roadmaps, 2322 edges, 0 problem(s)`. Without `--movable` it prints the single line `UPWARD: PurityForFlatCohomology (#218) -> EtaleDualityAndPerverseSheavesPartII (#386) at README lines [1169]`. A `moved:` line is not a defect.

## Previous findings

- R01 — not repaired: `README.md:23` is unchanged, and PurityForFlatCohomology at 643f30e still states §1.4 (`:1075`) and §1.5 (`:1128`) and names this roadmap as their importer (`:200–201`, `:3306–3307`). Raised again as R01.
- R02 — repaired: `README.md:996` routes the native statement through the regularity of A → Â, §5.3 at the closed points, and the excellent complete ring Â; `:998` adds §5.3, SchemeAndStackFoundations §0.21 (`excellent_examples`), `TauCeti.AdicCompletion.ringKrullDim_eq`, `IsAdicComplete.henselianRing` and `AdicCompletion.residueField_map_bijective` to the *Needs*; `:66` says the signature uses the G-ring condition only through `IsGRing.regularAlgebraMap_adicCompletion` at the maximal ideal; `:29` keeps the identification with quasi-excellence as explanation and says no route uses it. Every input is owned (see Verified sound).
- R03 — repaired: `README.md:1002` reads "For n ≥ 2 the bound is sharp: H¹(η, ℤ/n) = ℤ/n(−1) ≠ 0 at q = d = 1 (it is ℤ/2 for n = 2) … For n = 1 every group is zero"; `:1006` names the closed point s and writes H⁴_s.
- R04 — repaired: `Suggested.lean:34–38` now says §5.6 needs dimension functions, constructible sheaves with higher direct images and scheme-level quasi-excellence, that §5.5 is an intermediate step of the proof and not a headline, and that §5.7 is stated below.

## Verified sound

**Gate, dependency check and elaboration** (run on this head):
- The worker's gate: `set_option=0 … statement-hygiene=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`.
- Required dependency check, complete output: `depcheck: 238 roadmaps, 2321 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder lists 0 paths.
- `lake env lean` on `Suggested.lean` exits 0 in 21.5 s; the only warnings are seven "declaration uses `sorry`" (lines 74, 97, 190, 234, 271, 291, 306). The diff changes only docstrings in the Lean file; the elaborated types of all 10 declarations (`scratch/signatures.md`) are those the previous report checked with `#check @name`, and `affineLefschetz_strictlyLocal` keeps every binder (`HenselianLocalRing A`, `IsSepClosed (ResidueField A)`, `TauCeti.Excellence.IsGRing A`, `ringKrullDim A = ↑d`, `IsUnit ↑n`, `IsAffineOpen U`, `d < q`). No `lemma`, no `set_option`, imports `Mathlib` and `TauCeti.RingTheory.RegularLocalRing.GRing` only.

**The R02 repair, checked input by input:**
- `TauCeti.Excellence.IsGRing` at the Tau Ceti pin (`TauCeti/RingTheory/RegularLocalRing/GRing.lean:57–62`): fields `isNoetherianRing` and `regularAlgebraMap_adicCompletion (p) [p.IsPrime] : RegularAlgebraMap (Localization.AtPrime p) (AdicCompletion (maximalIdeal …) …)`. At p = 𝔪, with A ≅ A_𝔪, this is regularity of A → Â, as `README.md:66` says.
- `TauCeti.AdicCompletion.ringKrullDim_eq` (`TauCeti/RingTheory/AdicCompletion/LocalRing.lean:52`): `ringKrullDim (AdicCompletion (maximalIdeal R) R) = ringKrullDim R` for R noetherian local. Gives dim Â = d.
- Mathlib `Mathlib/RingTheory/AdicCompletion/LocalRing.lean` at the pin: `IsLocalRing` instance for Â (`:85`), `maximalIdeal_eq_map` (`:95`), the `IsAdicComplete (maximalIdeal Â) Â` instance (`:116–127`), `residueField_map_bijective` (`:151`). Matches the new Mathlib row at `README.md:54`.
- Mathlib `IsAdicComplete.henselianRing` (`Mathlib/RingTheory/Henselian.lean:154`): complete along I implies henselian along I. With the instance above, Â is henselian local; with the bijective residue map, its residue field is separably closed. So Spec Â is strictly local.
- SchemeAndStackFoundations §0.21 on main (`README.md:1421–1422`): `excellent_examples` includes complete Noetherian local rings (Stacks 07QW). So Â is excellent, hence quasi-excellent, and §5.6 applies to Spec Â.
- §5.3 (`README.md:912`): g regular between noetherian schemes, f qcqs, n invertible on S. Spec Â → Spec A is regular (flat with geometrically regular fibres is Tau Ceti's `RegularAlgebraMap`), U → Spec A is an open immersion of a noetherian scheme, so the hypotheses hold. At the closed point s of a strictly local scheme the stalk of R^q f_* F is H^q(U, F), on both sides, which is what `:996` and the §5.3 Check at `:920` say.
- U ×_A Â is the preimage of an affine open under the affine morphism Spec Â → Spec A, hence affine.
- Source: ILO14 lines 10365–10375 (XV 1.2.5, p. 220): the completion morphism is regular "car X est quasi-excellent", and XIV 2.5.3 gives H^q(Û, ℤ/n) = H^q(U, ℤ/n) for every q. Nothing else of quasi-excellence is used there, as `:996` claims.
- Conventions (`:29`) against ILO14 lines 667–670 (I 5.3.1) and 722–734 (I 5.5.1 with its proof: the regular locus of a complete ring is open by 4.1 and descends along the regular completion map by 5.3.2). The paraphrase is accurate, and `grep IsGRing` over the README confirms that only §5.7 uses the class.

**Other changed passages:**
- `README.md:146`: seven headline signatures. Count of sorried theorems in `Suggested.lean`: 7.
- §5.5 statement (`:948`): "the strict localization of a scheme of finite type over S at a geometric point". ILO14 line 10481 is XV 3.1.4; lines 10484–10486 call the strictly local E_α "essentiellement de type fini sur le trait S", and line 10557–10559 (3.3.2, printed p. 224) applies Gabber's trait theorem [Illusie 2003, 2.4] by passage to the limit to an affine open of such a scheme. Remarque 1.1.3 at line 10337 is on printed p. 219 (the page-226 marker, printed 220, is at line 10360). Locators correct.
- §5.5 route (`:950`): descent of the affine open and its complement to an étale neighbourhood, then étale continuity (SchemeAndStackFoundations §2.15 on main, `etale_cohomology_limits`). Consistent with 3.3.2.
- §5.5 new Check (`:960`): computed below. `Algebra.EssFiniteType` at the pin (`Mathlib/RingTheory/EssentialFiniteness.lean:40`) is "a localization of a finitely generated subalgebra", as the Check reads it.
- §5.7 new Check (`:1004`): computed below.
- Lean docstrings (`Suggested.lean:12–16`, `:285–290`): ILO14 lines 667, 724 (I 5.3.1, 5.5.1(ii)) and 10362, 10365 (XV 1.2.4, 1.2.5) are correct.

**Seeded sample:** of the 15 seeded targets only "5.5 Strict-local consequence of trait affine Lefschetz" falls in the changed passages; its locators are verified above. The other 14 are untouched and carry the previous report's verification. The README flags no locator as unverified.

**Cross-roadmap citations in changed text:** SchemeAndStackFoundations §0.21 (`excellent_examples`, main `:1421`) and §2.15 (main `:3867`); LefschetzPencilsAndVanishingCycles §6.2 and §0.10 at #873 (unchanged). The leads in `scratch/citations.md` are as before: PerfectoidQuotientsPartII is a board package in `ORDER.txt`, and the six EtaleCohomologyFoundations names occur in its README on main. `scratch/overlaps.md` lists no dropped id and no other pull request changing this roadmap; ownership against the open heads was checked for the affine Lefschetz and local duality objects (R01 only).

**Declared gaps:** untouched by the diff; the previous check carries over.

**Adversarial table.** Rows for changed statements are computed this round; rows marked "r10" or "r9" are carried from the previous reports, because the diff leaves those statements untouched.

| Statement | Instances tried | Values on each side | Result / change |
| --- | --- | --- | --- |
| §5.7 native route via Â (new) | A = strict henselization of k[t]_(t), k separably closed, n invertible in k, U = η | **A side:** Frac A is the fraction field of a strictly henselian DVR: H¹ = ℤ/n(−1), H^q = 0 for q ≥ 2. **Â = k⟦t⟧ side:** U ×_A Â = Spec k((t)) = D(t), affine; H¹(k((t)), ℤ/n) = ℤ/n(−1), H^q = 0 for q ≥ 2. **Dimensions:** dim A = dim Â = 1 (`ringKrullDim_eq`). **Residue fields:** both k (`residueField_map_bijective`). | Holds; the route's identification is an isomorphism here. |
| same, d = 0 and U = ∅ | A artinian; U = ∅ | **d = 0:** Â = A (already complete), both sides H^q(κ) = 0 for q ≥ 1. **U = ∅:** both sites trivial, 0 = 0. | Holds. |
| same, hypothesis "A → Â regular" dropped | A a strictly henselian DVR of characteristic p with K̂/K inseparable (not a G-ring) | Regular base change is not available: Spec Â → Spec A is flat but its generic fibre Spec(K̂ ⊗_A K) = Spec K̂ is not geometrically regular. The theorem's hypothesis `IsGRing A` excludes it, so the signature is unaffected. | Hypothesis is used, not decorative. |
| §5.5 new Check (strict localization of 𝔸¹_S at the origin of the special fibre) | m = 2, 3 invertible on S; the Eisenstein criterion; degrees | **Hensel:** T^m − (1 + x) ≡ T^m − 1 mod (π, x), with 1 a simple root since m is a unit in the residue field, so (1 + x)^{1/m} lies in the strict localization. **Eisenstein at the prime 1 + x of K[x]:** T^m − (1 + x) is irreducible, degree m. **Fraction field:** union of fraction fields of étale neighbourhoods, each finite separable over K(x); contains K(x, (1+x)^{1/m}) for infinitely many primes m, so [Frac : K(x)] = ∞. **EssFiniteType side:** a localization of a finitely generated S-subalgebra D has Frac D finitely generated over K; algebraic over K(x) forces finite. **Dimension:** the strict henselization of S[x]_(π,x) has dimension 2 = d. | Holds; the Check separates the two readings. |
| §5.5 statement (reworded) | X′ = Spec k (d = 0); X′ = S (d = 1); U containing the closed point | **d = 0:** H⁰ = ℤ/n, H^q = 0 for q > 0. **d = 1, U = η:** H¹ = ℤ/n(−1), 0 above. **U ∋ closed point:** U = X′, H^q(X′) = 0 for q > 0 ≤ d. | Holds. |
| §5.7 Checks (reworded) | n = 1, 2 at η; U = X − {s} vs D(x) | **n = 2:** H¹(η, ℤ/2) = ℤ/2 ≠ 0 at q = d = 1. **n = 1:** every group 0. **Punctured spectrum:** H³(X − {s}) = ℤ/ℓ(−2) ≠ 0 at q = 3 > 2; **D(x):** H³ = 0. | Fixed wording agrees with the computations. |
| §5.3 Check (reworded) | A as in row 1 | stalks at the closed points of Spec A and Spec Â equal H^q(U) and H^q(Û); values as in row 1. | Holds. |
| Conventions: local `IsGRing` ⇔ quasi-excellent | r10: field; k⟦t⟧; inseparable DVR; ℤ_(p) | **Field, k⟦t⟧, ℤ_(p):** both; **inseparable DVR:** neither. | Agrees with ILO I 5.5.1(ii); now explanation only, no route uses it. |
| `affineLefschetz_strictlyLocal` (signature unchanged) | r10: d = 0; k⟦t⟧ with U = η; U = ∅; n = 1, 0; punctured k⟦x,y⟧; ℤ_p with ℓ = 2; valuation ring Γ = ℤ + ℤ√2 | r10 values: **n = 0** excluded (`IsUnit ((0:ℕ):A)` false in a local ring); **not affine:** H³ = ℤ/ℓ(−2) ≠ 0; **residue 𝔽_p, U = Spec ℚ_p:** H²(ℚ_p, ℤ/2) = ℤ/2 ≠ 0; **not noetherian:** H²(K, ℤ/ℓ) ≅ ℤ/ℓ ≠ 0. | Unchanged; holds and sharp, each hypothesis needed. |
| §§1.1, 1.2, 1.4, 1.5, 1.6, 1.7 (Lean) | r9 instances | r9 values (cusp p = 2: rank 3 with x² ≠ 0; t ↦ x^p rejected). | Unchanged; hold. |
| `cohomologicalDimension_le_of_strictlyLocal` (§5.8) | r9: d = 1, 2, 0 | **d = 1:** H¹(η) ≠ 0 at 2d − 1; **d = 2:** H³ ≠ 0; **d = 0** excluded by `0 < d`. | Unchanged; sharp. |
| §§0.3, 0.5, 0.6, 2.2, 3.3, 5.1, 5.4, 5.6, 6.2, 6.5, 6.10, 6.11, 6.12, 7.1, 7.2, 7.3, 8.4, 8.5 | r9/r10 instances | r9/r10 values (§6.11, d = 2: RΓ_x(Λ(2)[4]) = Λ in degree 0; §5.4: rule (1) gives 1, 0 and rule (2) gives 0, −1; §7.1, d = 1 with f = π: H^i(η) = 0 for i > 1). | Unchanged; §7.3 is R01. |

**Remarks on untouched text (no change requested):** none new.

## Not verifiable

- **Ill03** (Théorème 2.4, cited at ILO14 line 10559 for the trait theorem) and **Epp73** are settled as uncertified and were not read. §5.5 cites the trait theorem only through LefschetzPencilsAndVanishingCycles §6.2.
- I did not compare the published Astérisque pagination with ILO14 arXiv v1; the README cites the v1 printed pages, which I checked.

## Source issues

- none

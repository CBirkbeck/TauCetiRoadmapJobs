<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2099#issuecomment-6640200548 -->
Red team round 2 pass b (claude) of 64fe6dc

Verdict: needs_changes

1. **F01** (P2) The subform theorem is statable at the pins and is listed as not statable

   **Location.** `Suggested.lean` line 42: "the subform theorem: there is no function field of a
   projective quadric"; README 2.10 (lines 998–1004) has no Lean name.

   **Claim.** The function field `F(ψ)` is not needed to state the theorem. The file already binds a
   residue field without constructing it: `quadraticSimilarity_tfae` (lines 159–163) quantifies over
   every field `L` receiving `K[T]` with kernel exactly `(p)`. The same device states 2.10: "`q` is
   hyperbolic over `F(ψ)`" is equivalent to "`q` is hyperbolic over every field `L` receiving `K[T]`
   with kernel `(ψ(T))`", because `Frac(K[T]/(ψ(T)))` is one such `L`, it is `F(ψ)(x)` purely
   transcendental over `F(ψ)` (EKM, p. 94, ekm line 5178–5181), hyperbolicity descends along purely
   transcendental extensions by 2.1 and ascends to every `L` containing `F(ψ)`. The polynomial
   `ψ(T)` is `extendScalars ψ (MvPolynomial (Fin m) K) MvPolynomial.X`, and `Irreducible` is
   Mathlib's. Every other carrier (`IsRepresentedBy`, `Represents`, `dualProd`) is already used in
   the file. The theorem is a headline by the module docstring's own list, and a deep input of 2.11.

   **Witness.** `ψ = [1, 1]`, `q = [1, 1] ⊥ t[1, 1]` over `𝔽₂(t)` (README 2.10 Check): `ψ(T) = x² + xy
   + y²` is irreducible; `L = Frac(𝔽₂(t)[x, y]/(ψ(T))) = 𝔽₄(t)(x)`; `q_L` is hyperbolic; `a = b = 1`;
   the statement below concludes `ψ ⊆ q`, which holds. For `q = ℍ` the anisotropy hypothesis fails,
   as EKM Theorem 22.5 (ekm line 5198–5201) requires.

   **Repair.** Add to Layer 2 of `Suggested.lean`, after `quadraticSimilarity_tfae`:

   ```lean
   /-- **The subform theorem** (EKM, Theorem 22.5, p. 94), in every characteristic: let `q` be an
   anisotropic quadratic form and `ψ` an anisotropic quadratic form whose coordinate polynomial
   `ψ(T)` is irreducible, such that `q` is hyperbolic over the function field `F(ψ)`, phrased
   through every field receiving `K[T]` with kernel exactly `(ψ(T))` (each contains `F(ψ)`, and
   `Frac(K[T]/(ψ(T)))` is one of them). Then for every nonzero value `a` of `q` and `b` of `ψ`,
   `a b ψ` is isometric to a subform of `q`; in particular `dim ψ ≤ dim q`. -/
   theorem isRepresentedBy_smul_of_forall_equivalent_dualProd {K : Type u} [Field K] {m n : ℕ}
       (q : QuadraticForm K (Fin n → K)) (hq : q.Anisotropic)
       (ψ : QuadraticForm K (Fin m → K)) (hψ : ψ.Anisotropic)
       (hirr : Irreducible (extendScalars ψ (MvPolynomial (Fin m) K) MvPolynomial.X))
       (hhyp : ∀ (L : Type u) [Field L] [Algebra K L] [Algebra (MvPolynomial (Fin m) K) L]
         [IsScalarTower K (MvPolynomial (Fin m) K) L],
         RingHom.ker (algebraMap (MvPolynomial (Fin m) K) L) =
           Ideal.span {extendScalars ψ (MvPolynomial (Fin m) K) MvPolynomial.X} →
         ∃ k : ℕ, (extendScalars q L).Equivalent (QuadraticForm.dualProd L (Fin k → L)))
       (a b : K) (ha : a ≠ 0) (hqa : q.Represents a) (hb : b ≠ 0) (hψb : ψ.Represents b) :
       ((a * b) • ψ).IsRepresentedBy q := by
     sorry
   ```

   Delete the subform bullet from the docstring's not-statable list (line 42) and add "the subform
   theorem" to the Layer 2 line of "Stated here" (lines 20–22). In README 2.10 write "State
   `isRepresentedBy_smul_of_forall_equivalent_dualProd`: …" and add to its *Needs* "Mathlib
   `Irreducible`, `MvPolynomial.X`". Tested on the witness: `hirr` holds, the only hypothesis of
   `hhyp` that bites is `L ⊇ 𝔽₄(t)`, where `q` is hyperbolic, and the conclusion is `ψ ⊆ q`.

2. **F02** (P3) Two cited Tau Ceti declarations do not exist at the pin

   **Location.** README 224–225: "`TauCeti.oneFoldPfister_smul_equivalent_of_mem_unitValueSet`,
   `TauCeti.twoFoldPfister_smul_equivalent_of_mem_unitValueSet`"; README 724–725 (1.4) cites the same
   two names.

   **Claim.** Neither name exists in the pinned Tau Ceti. The roundness theorems of
   `TauCeti/LinearAlgebra/QuadraticForm/Witt/Round.lean` are `TauCeti.oneFoldPfister_smul_equivalent_iff`
   (line 44) and `TauCeti.twoFoldPfister_smul_equivalent_iff` (line 61): over any commutative ring `R`
   and `c : Rˣ`, `(c • ⟨1, −a⟩).Equivalent ⟨1, −a⟩ ↔ c ∈ unitValueSet ⟨1, −a⟩`, and likewise for
   `⟨1, −a, −b, ab⟩`, with `a`, `b` arbitrary elements, not units.

   **Witness.** `grep -rn oneFoldPfister_smul_equivalent` over the pinned `TauCeti/` returns only the
   `_iff` names; `scratch/citations.md` of this job lists both README names as found nowhere.

   **Repair.** Replace both names at 224–225 and 724–725 by `TauCeti.oneFoldPfister_smul_equivalent_iff`
   and `TauCeti.twoFoldPfister_smul_equivalent_iff`, and in 1.4 write "With `2` invertible and `m ≤ 1`
   this is the field case of Tau Ceti's … (stated over every commutative ring, as an `iff` with
   `unitValueSet`)". Tested: 1.4 for `m = 0`, `a₀ = (1 − a)/4`, `2` invertible, is the field instance of
   `oneFoldPfister_smul_equivalent_iff a c`, direction `←`.

3. **F03** (P3) "Lemma 7.13" is Proposition 7.13

   **Location.** README 804: "it splits off a hyperbolic plane (EKM, Lemma 7.13)"; References 1939:
   "Lemmas 7.12, 7.13 and 7.15".

   **Claim.** EKM's statement that an isotropic regular form splits off a hyperbolic plane is
   Proposition 7.13 (ekm line 2360–2366, printed p. 42); 7.12 and 7.15 are lemmas.

   **Witness.** ekm line 2360: the heading reads "Proposition 7.13".

   **Repair.** README 804: "(EKM, Proposition 7.13, p. 42)"; References 1939: "Lemmas 7.12 and 7.15,
   Proposition 7.13".

Files read in full: `packages/QuadraticFormInvariantsPartII/README.md` (1978 lines) and
`packages/QuadraticFormInvariantsPartII/Suggested.lean` (306 lines, 21 declarations: 6 definitions,
15 sorried theorems), with `design/plan.json` (`gaps`), `sources.toml` and `metadata.toml`. Round 1
passes a (a-F01–a-F18) and b (b-F01–b-F08) and the repair report were read first; every repair is
checked below at this head. New findings are S01–S03: one P2, two P3. No blocking finding re-raises
a settled one; the repair report marked nothing `not actionable`.

## Round 1 findings at this head

| Finding | Repaired passage at head (witness) | Status |
|---|---|---|
| a-F01 | README 676–678: "for `n = 1` when `2` is invertible; in characteristic two the unscaled one-fold forms span exactly the classes `[1, d]`, which need not be all of `I_q(F)`"; Check 693–695 adds `I_q(𝔽₂)` generated by `[1, 1]` | repaired |
| a-F02 | README 1314–1315 "For a nonsingular quadratic `n`-fold Pfister form `ρ` … this means `1 − 4a₀ ≠ 0`"; 1341, 1356; Check 1334–1335 (`[1, 1/4]` has no class, `[1, 0]` has invariant `0`) | repaired |
| a-F03 = b-F02 | README 801–805: quotient by the quadratic radical, then descent or `ℍ`; Check 810–813 with `x²` on `ℚ²` and `(x + y)²` over `𝔽₂` | repaired; the new locator "Lemma 7.13" is a misprint (S03) |
| a-F04 | README 825–830 and Check 844–846: zero-dimensional `ψ` gives (true, false, true) | repaired |
| a-F05 | README 159–161 (multiplicative convention, "coordinate of greatest value"), 1411, 1468–1471 ("unique maximum"); Check 1479–1480 computes `v(1 + t + t²) = 1 = max(1, c)²` | repaired |
| a-F06 = b-F08 | README 1406–1410: replace `y` by `y + x`, divide by the unit `q(y)`, monic with simple root `0`; Check 1425–1429 on `[1, t] ⊥ (1 + t)[1, t]` | repaired |
| a-F07 = b-F06 | Suggested.lean 239–241: "`a₀ = (1 − ε₀)/4` when `2` is a unit of `O`, and `a₀ = ε₀` in equal characteristic two" | repaired |
| a-F08 | README 655: "on `Fin (2ᵐ) × Fin 2 → F`, the direct sum of `2ᵐ` copies of `F²`"; dimension `2^{m+1}` at 656 | repaired |
| a-F09 | README 1290–1298: Kato's bilinear comparison is a target of 3.6, `blochGabberKato` composed with its inverse; Checks 1306–1310 | repaired |
| a-F10 | Suggested.lean 113, 133, 148, 270: representation theorem, norm principle, quadratic similarity, Lang–Nagata, each named in README 2.3, 2.6, 2.8, 5.4; the coefficient-field item stays in 6.1 with the repair report's reason (a step inside Dittmann–Pop's proof, not a theorem of a source) | repaired (item 5 settled with a correct reason) |
| a-F11 | README 1238–1239 "in cohomological degrees at most the weight"; 1264–1266; Check 1246–1248 (weight 0, degree 1 over `ℚ`) | repaired |
| a-F12 | README 1220–1224: intersection definition, no equality with ideal powers assumed, residue test `⟨1, −t⟩` on `𝔸¹_ℚ` | repaired |
| a-F13 | README 1554–1558: algebraically closed case first, `d = 1` by linear algebra, `C_i` applied once `M > Dⁱ`; Check 1563–1564 (`ℂ` is `C₁`) | repaired |
| a-F14 = b-F03 | README 1192 (Theorem 2.3, p. 71), 1199 (Theorem 2.12, pp. 78–80), 1201–1202 (Lemma 3.11 and its proof, p. 90, announced p. 69: morel lines 914–924, 212); "p. 11" at 1843, 1851, 1871, 1875, 1950 (dp lines 485–518 lie on printed p. 11) | repaired |
| a-F15 | README 629–631 (`4⟨1⟩ ∈ I_q² \ I_q³` over `ℝ`); 1622–1624 (`𝔽₄(t)`, `ℚ(√2)(t)`, `ℚ̄`) | repaired |
| a-F16 | README 1669–1672: `[1, a₀] ≅ ⟨1, −(1 − 4a₀)⟩`, principal-unit ratio is a square; Check 1688–1689 | repaired |
| a-F17 | README 86–92, 316–324, 567–573: `I_q(F)` is `W^q(F)` of HermitianKTheoryOfPoincareCategories §§3.4, 4.5, 7.9; those sections exist at its head (headings "3.4 The Witt group of projectives as a bounded L-group", "4.5 Degree-zero L-groups are classical Witt groups", "7.9 L-groups of a field in every flavour", whose (c) names `W^q(K)` in characteristic 2); merge order line 78 < 315 | repaired |
| a-F18 | README 1731–1740: Theorem 1.5(a) as an explicit step, proved from 1.5(b), Poitou–Tate, local duality and the limit, Tate's `H³`; contracts 372–384; Checks 1757–1759 | repaired |
| b-F01 | README 288–291 (`gap:real-closure-uniqueness`, supplier RealAlgebraicGeometry Layer 1, same sentence as `design/plan.json` `gaps[1]`); 1775–1778; Check 1789–1792 | repaired |
| b-F04 | README 1196–1197: Satz 3.3 in the proof of Lemma 2.14, p. 81 (morel line 611); odd-degree injectivity, p. 78 (morel line 511); References 1974–1975 | repaired |
| b-F05 | Contracts 372–376 (DeligneWeightsAndPurity §§7.12, 7.15), 270–271 (ClassFieldTheory Layer 10, `eq_zero_of_localInv_eq_zero`), 304–305 (LocalFieldsRamificationPartII §GF.5); Scope 106–109 | repaired |
| b-F07 | Suggested.lean 227–230 without `ha₀`; README 1435–1436 "with no condition on `1 − 4a₀`"; Check 1453–1454 (`ℚ₃`, `ε = 4`, `a₀ = 1/4`) | repaired |

No repair introduced a mathematical error. One repair introduced a locator misprint (S03). The
four theorems added for a-F10 were checked statement by statement (adversarial table below).

## Verified sound

**Head and policy.** `git diff --stat origin/main...HEAD` touches eight files, all under
`packages/QuadraticFormInvariantsPartII/`. README: no `set_option`, no pull-request number, no
review/repair/round words, no machine path; "lemma" occurs only as "Hensel's lemma" and "Gauss's
lemma". Lean: `import Mathlib` plus four `TauCeti.*` modules that exist at the pin; `theorem` only;
no `variable`, `instance`, `abbrev`, `opaque`, `example`, `True`, `#eval`, `#print`, `set_option`;
16 occurrences of `sorry`, one in the docstring and 15 closing theorems; no sorried data. Every Lean
name is backticked in the README; the three leads of `citations.md` are S02 (two names) and this
roadmap's own `IsCi.exists_common_zero`.

**Dependency check.** The gate printed

```text
depcheck: 209 roadmaps, 1818 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. Merge order: this roadmap at line 315; suppliers
LocalFieldsRamificationPartII 13, ArithmeticGaloisDuality 48, HermitianKTheoryOfPoincareCategories
78, DeligneWeightsAndPurity 91, GeometryOfNumbersAndQuadraticArithmeticPartII 108, the rest on main
or earlier; consumers LogicAndDefinabilityInNumberTheoryPartII 316 and RealSurfacePeriodIndex 153
(the latter through its own `gap:q2-tsen-lang`, its design README line 146).

**Declared gaps.** `gap:rost-cycle-modules` and `gap:real-closure-uniqueness` have the same slug,
supplier, section and sentence in `design/plan.json` and README 362–365, 288–291. Both are
precise and minimal: MotivesAndAlgebraicCycles §0.5b at its head is "Gersten residues and the
coniveau spectral sequence" for the theories of its §0.5a and states no cycle module;
RealAlgebraicGeometry on main (its README 128–137) constructs one real closure with `StrictMono ι`
and states no uniqueness; the pinned `Mathlib/FieldTheory/IsRealClosed/Basic.lean` has the class
only. The package commit replaced the design's two audit-style `gaps` entries (title, neededBy,
detail; no supplier) by the slug entries; those were not supplier gaps and the intake reads only
slug entries, so this is recorded, not raised.

**Supplier citations resolved (31).** HermitianKTheoryOfPoincareCategories §§3.4, 4.5(iii), 7.9(c)
at its head (`W(Proj(R);Q)` modulo strictly metabolic objects; classical quadratic Witt group;
`W^q(K)` in characteristic 2). GeometryOfNumbersAndQuadraticArithmetic §6.4 `ExactGW0`, `ExactW0`
(head lines 2498–2532, symmetric spaces modulo metabolic ones, every characteristic). K2SymbolsBrauer
§§5.4–5.8 (509–607), 5.12 (697: `K_n^M(𝔽_q) = 0`, `n ≥ 2`), Layers 9–10 (1369, 1750), §§10.5–10.9
(1820–1900), §10.32 (2391: `(ℤ/2)^{r₁}` for `n ≥ 3`). KTheoryFiniteLocalFields §3.0
(`blochGabberKato`, `dlog : Kₙᴹ(F)/p ≃ ν_F(n)`, field-map naturality, line 503) and §3.0a
(`motivicToK`, `ℤ/m(i) ≃ τ_{≤i} Rε_*μ_m^{⊗i}`, lines 536–538). MotivesAndAlgebraicCycles §0.5b (159),
§§4.1–4.6 (558–655), §4.14 (816). ClassicalAdicEtaleCohomology §11.2
`field_cohomological_dimension_transcendence` with infinite bounds permitted (5636–5638).
DeligneWeightsAndPurity §§7.12, 7.15 (2255, 2309). ArithmeticGaloisDuality §R02.4.2 (local Tate
pairing for finite modules, 3119), §R02.4.3 with its clause (c) `H^r(G_S, M) ≅ ⊕_{v real} H^r(K_v, M)`
for `r ≥ 3`, §R02.4.5 (3870), §R02.4.6 (4142). AdicCoefficientsAndComparisonsPartII §PA.6.9 at its
head ("6.9 Prime-to-ℓ alterations of varieties with snc boundary" under Layer PA.6, line 1611; the
hypotheses match README 388–391 word for word). LocalFieldsRamificationPartII design: GF.1 (226),
GF.4 (724), GF.5 `abhyankar-and-rank` (875: `rr(Γ_L/Γ_K) + trdeg(κ_L/κ_K) ≤ trdeg(L/K)`, finite
transcendence degree, no finite generation). GeometryOfNumbersAndQuadraticArithmeticPartII design
§DA.0 `integral-comparison` (37–39). On main: QuadraticFormInvariants Layers 1, 4, 7A, 7B, 9 (1058,
1338, 2300, 2413, 2797) and `W(ℝ) ≅ ℤ` (845); ProfiniteCohomology Layers 10–12 (1549, 1739, 2091);
ClassFieldTheory `cd_p_absoluteGaloisGroup_eq_two` for every prime (1286) and
`eq_zero_of_localInv_eq_zero` (1606); AdicSpaces §§1.1–1.3 (Completed, 276–310);
RealAlgebraicGeometry `exists_realClosure` (Completed, 137); SchemeAndStackFoundations §§0.12–0.14,
2.11, 2.15, 2.16 with the named declarations (969–1086, 3656, 3867–3880, 3896–3898).
LogicAndDefinabilityInNumberTheoryPartII's design cites Q2.1/quadratic-pfister, Q2.3, Q2.4, Q2.5 of
this roadmap by node id, consistent with Layers 1, 3, 4, 5.

**Pinned declarations opened (file and line).** Tau Ceti: `pfisterForm` (Witt/Pfister/Basic.lean:61,
weight `1` at index `0`, slot `a 0` paired with `![1, −a 0]`), `pfisterClass_mem_fundamentalIdeal_pow`
(318), `fundamentalIdeal_pow_eq_addClosure` (355, `0 < n`), `Represents` and `IsRepresentedBy`
(Representation.lean:44–47, injective isometry), `kummerClass` (MuTwo/Basic.lean:353, into
`continuousCohomology 1 (trivialF2 …)`), `trivialF2TopPairing` (Cup/TrivialF2/Basic.lean:66),
`TopPairing.cup m n : H^m → H^n → H^(m+n)` (Cup/Cohomology.lean:167), `presentedForm`
(RegularFormClass/Basic.lean:105), `formClass` (649, takes `Q.Nondegenerate`), the roundness
theorems (Round.lean:44, 61: S02), and the existence of `signedDiscrHom`, `WittRing.dimMod2`,
`scharlauTransfer`, `polar_scharlauTransfer`, `scharlauTransfer_baseChange_mul`, `galoisRes`,
`galoisRes_cup`, `cohomologicalDimensionAt`, `ValuationSpectrum`, `patchTopology`,
`isClopen_patchTopology_basicOpen`, `equivalent_of_equivalent_prod`, `IsometryEquiv.exists_extension`,
`unitValueSet`, `fundamentalIdeal_toAddSubgroup_eq_closure_oneFoldPfisterClass`,
`baseChange_mem_fundamentalIdeal_pow`, `baseChange_pfisterClass`, `pfisterFormClass_two_tfae`,
`pfisterClass_two_eq_zero_iff`. Mathlib: `MonomialOrder.lex` is `Finsupp.Lex` = `Pi.Lex (· < ·)`
(Order/PiLex.lean:50: the first differing index decides, so index `0` is most significant, as EKM
p. 77, ekm line 3904–3905); `MonomialOrder.leadingCoeff` (MvPolynomial/MonomialOrder.lean:119);
`multiplicity` (Multiplicity.lean:47, `emultiplicity.toNat`); `Nondegenerate` (Radical.lean:115,
radical zero and polar kernel of rank `≤ 1`); `dualProd` (Dual.lean:85); `baseChange`
(TensorProduct.lean:127, under `Invertible 2`); `algebraicClosure` (AlgebraicClosure.lean:39);
`IsRealClosed` (IsRealClosed/Basic.lean:48); `HenselianLocalRing.TFAE` (Henselian.lean:119);
`ValueGroup`, `valuation` (ValuationSubring.lean:161, 166); `nonempty_sections_of_finite_inverse_system`
(CofilteredSystem.lean:111); `char_dvd_card_solutions` (ChevalleyWarning.lean:178). No
henselization exists at either pin (`grep -ri henselization` finds nothing), so the Layer 7
headline is correctly deferred.

**Source locators verified (38 groups, one misprint: S03).** ekm: lex order and `f*` (3904–3912,
p. 77); Lemma 7.12, Proposition 7.13 (2351–2366); Example 7.23 (2448–2452); Remark 8.9(3) (2693);
Example 9.4, §9.B (2842–2853, `aₙ ≠ 0` only when `char ≠ 2`); Proposition 9.8 (2906–2931: (2) needs a
regular, in our words nonsingular, `ϕ`), Corollaries 9.9–9.10, Lemma 9.11 (2932–2960); Fact 5.15
(1843); Proposition 16.1, Fact 16.2 (3620–3657, Kato for `char 2`); Theorem 17.3 (3737–3738, `h ∈ D`
nonzero in the source, the Lean's `h = 0` is trivially true); Theorem 17.12 (3831–3837, both forms
anisotropic); Corollary 18.5 and its induction on `[K : F]` (4004–4008), Corollary 18.6 (4018–4019);
Theorem 20.14 and proof (4586–4610), Lemma 20.15, Theorem 20.16 (4613–4649), Corollary 20.7 (4463–4465,
with the `s(c ·)` change of functional in its proof); §22: Proposition 22.1, irreducibility criterion,
`F(ϕ)` purely transcendental of degree one, Example 22.2, Proposition 22.4, Theorem 22.5 (5157–5205);
§97: definition, Lemma 97.1, Theorem 97.2, Corollaries 97.5–97.6, Theorem 97.7 (20208–20285). dp:
§1 Kronecker dimension (35); §2 `k₁ᵥ` (henselization, real closure, `ℚ̄`), `K ⊗ k₁ᵥ` a domain, Fact 2.1
(146–159); Fact 3.1, Proposition 3.2 statement and proof (242–335: (∗), the Abhyankar step, Cases 1–2,
the Claim, the limit); §3.C and Lemma 3.9 (485–517, printed p. 11). jannsen16: Conjecture 1, the
Brauer kernel for curves, Theorem 0.4 (72–86), Theorem 0.6 "see Theorem 2.10" (93–98), Corollary 0.8
(141–145), `F(v) = F K(v)` with henselizations and the injectivity `H(F(v)) → H(F_v)` (311–317,
504–505), Theorem 1.5 (537–550, bad places `S ⊃ {v | ∞}` by Definition 1.6), its proof (661–669),
Theorem 2.4 (860–862), the `βA`/`γA` step on p. 21 (892–896), Theorem 2.10 (1034–1038). morel:
Theorem 2.3 (277–283), Theorem 2.12 (532–537), p. 78 odd-degree monomorphism (510–511), Lemma 2.14
and Satz 3.3 (607–614), Lemma 3.11 and proof (914–924).

**Checks tested (62 of 147, all correct), with values.** 0.1: `[a,b](1,0) = a`, `(0,1) = b`,
`[0,0](1,1) = 1`; `[1,1]` over `𝔽₂` takes `1` thrice, polar determinant `1`; `[1, 1/4] ≅ ⟨1, 0⟩`
(`1/4 − 1/4 = 0`). 0.4: `⟨1,1⟩_b((1,1),(1,1)) = 2 = 0`, `W_b(𝔽₂) = ℤ/2`. 0.5: `c[1,a] ≅ [c, a/c]` by
`y ↦ y/c`; `⟨1,−a⟩_b ⊗ ⟨1,−b⟩ = ⟨1,−a,−b,ab⟩` is `pfisterForm_two`. 0.6: signature of `4⟨1⟩` is `4 ∈ 4ℤ
\ 8ℤ`. Layer 0 example: in characteristic 3, `1 − 1/4 = 0` and `1 − 4 = 0`. 1.1: `m = 0` gives
`[1, a₀]` of dimension `2`; `⟨1,1,1,1⟩` anisotropic, `⟨1,−1,−1,1⟩` hyperbolic over `ℚ`; `t[1,1]` has odd
`t`-degree values. 1.5: `[1,0](0,1) = 0`; `(x + y/2)²` at `(1,−2)`; `⟨3,3,3⟩` has discriminant `27 ≡ 3`;
`3 + 6 = 9 = 1` at `x = y = 1/3` times `9`. 2.1–2.2: `t² + 1 = ⟨1,1⟩(t,1)`; `3` not a sum of two
rational squares (`3`-adic parity). 2.3: `(T,F,T)` for `ψ = 0`. 2.5: `𝔽₈ ∌ ω`; `−t = s²(−s)` with `−s` a
nonsquare. 2.6: `N(x + ωy) = x² + xy + y²`; `N(c) = c²` for `𝔽₂(s)/𝔽₂(t)`. 2.7: `t² + t + 1 =
[1,1](t,1)`. 2.8: `(1,0) > (0,2)` so `f* = 2`; `c⁻¹c = 1`, `c·c = c²`. 2.9: chart `y = 1` gives
`t² + t + 1 = 0`, `F(ψ) = 𝔽₄`. 2.11: `⟨1,1⟩` has signed discriminant `−1`; `3ℍ` has class `0`, dimension
`6`. 3.1: `℘(0) = ℘(1) = 0` in `𝔽₂`; `[dt/t] ≠ 0` in `H₂²(𝔽₂(t))` (the `t⁰`-coefficient of `t f′ + g² − g`
vanishes in `𝔽₂((t))`, that of `1` is `1`). 3.2: `⟨1,−u,−(1−u),u(1−u)⟩(1,1,1,0) = 0`; `{−1,−2} = {−1,−1}`
by Steinberg on `{−1, 2}`. 3.2a: `⟨1,1⟩` anisotropic over `𝔽₃`, `⟨1,1,1,1⟩(1,1,1,0) = 3 = 0`; `8 ∉ 16ℤ`;
`⟨1,1,−2,−2⟩(1,1,1,0) = 0`. 3.4: weight-0 degree-1 over `ℚ`. 3.5: signed discriminant of `⟨1,−a⟩` is
`(−1)(−a) = a`. 3.6–3.9: `ē₁([1,1]) = 1`, `ē₁([1,0]) = 0`; `d(c²)/c² = 0`; `dt = 2s ds = 0`. 4.1: `1 − 4 = −3
∈ ℤ₂ˣ`; `1/2 ∉ ℤ₂`; `9 ≡ 2 mod 7`, `a₀ = −1/4`; `q(e₂ + x) = 1`, `s² + s + t`. 4.2: `[1,1] ⊥ [1,1]` zero
at `(v,v)`; `(x + y/2)² − 4(z + w/2)²` at `(2,0,1,0)` is `1 − 1`; `⟨1,1,−7,−7⟩` anisotropic (`7` inert in
`ℤ[i]`). 4.3: `v(1 + t + t²) = 1 = max(1,c)²`; `[1,1] ⊥ t²[1,1]` zero at `((t,0),(1,0))`. 5.1–5.3:
`x² + xy + y²` has no nonzero zero over `𝔽₂`; `X^d` at `N = 1`; four zeros of `x² + xy + y² + z²`. 5.4:
`5 > 4`. 5.7: `0, 1, 1, 2`; `𝔽₄ ≠ 𝔽₂`, `ℚ(√2) ≠ ℚ`, `ℚ̄ ≠ ℚ`. 6.1: `√(1 + t)`, `√((2 + t)/2)`, `√(1 − 4t)`
in `ℚ((t))`. 6.2: `cd₂(ℚ(x)ℚ₃^h) ≤ 3`. 6.3: `(−1)³ ≠ 0` over `ℝ(x)`; `H²(ℚ, ℚ₂/ℤ₂(1)) ⊇ Br(ℚ)[2^∞]` with
invariant sum `0`. 6.5: `−7 ≡ 1 mod 8`; `[1, 1/2] ≅ ⟨1,1⟩`, `8⟨1⟩` anisotropic over `ℚ((x))`. 7.1–7.2:
`p(3) = 7`, `p′(3) = 6`; `−1 ∈ (ℚ_p)²` iff `p ≡ 1 mod 4`.

**Headlines and padding.** End theorems: Hauptsatz (stated for `2` invertible at line 170; the
characteristic-two form needs the quadratic Witt module, absent at the pin), invariant-zero
criterion (210; characteristic two needs Kato's group, absent), the three parts of Dittmann–Pop's
Proposition 3.2 (227, 242, 295), openness (no henselization at the pin). Deep intermediate results:
roundness (71), isotropy = hyperbolicity (80), Cassels–Pfister (102), representation (113), Springer
(123), norm principle (133), quadratic similarity (148), Milnor conjecture in cohomological form (195),
Lang–Nagata (270), Tsen–Lang (263), subform theorem (S01: statable, absent). Kato's theorem and
Milnor's original form are correctly deferred (no inverse Cartier operator, no Milnor K-theory at
the pins; `K2SymbolsBrauer` is a roadmap, not a pin). Jannsen's Hasse principle could in principle be
encoded through number-field places and adic completions with the same universal device, but only
through a long ad hoc encoding of the composita; it is not raised. No declaration is padding: none
follows by one tactic, restates a definition, mirrors a Check or computes a value.

**Lean versus README, declaration by declaration.** The elaborated types in `scratch/signatures.md`
match the README statements: 1.4, 1.5 (`1 − 4a₀ ≠ 0`), 2.2 (arbitrary `Q`, `h` any polynomial), 2.3
(both anisotropic, `E : Type u`, `c ≠ 0`), 2.5 (`FiniteDimensional`, `Odd finrank`, no separability),
2.6 (`Nondegenerate` on `Fin (2k) → K`, `FiniteDimensional K E`, `Algebra.norm`), 2.8 (`f ≠ 0`,
`MonomialOrder.lex.leadingCoeff`, `Odd (multiplicity p f)`, kernel exactly `(p)`), 2.11 (`Invertible 2`,
`FiniteDimensional`, `Nontrivial`, `Nondegenerate`, `Anisotropic`), 3.5 and 3.9 (`Invertible 2`,
`n + 1 ≥ 1`), 4.2 (henselian `O`, no discriminant hypothesis, `i : Fin m` forces `m ≥ 1`), 4.3
(`IsUnit (1 − 4a₀)`, `𝔽₂`-independence as no nonempty product a square), 5.4 (`0 < d`, `r dⁱ < N`),
5.6 (`trdeg = t`), 6.5 (`O ≠ ⊤`, `kroneckerDimension K = r`, `IsUnit (1 − 4a₀)`, `R` and `L` in
`Type u`). There are no section variables, so no binder can have been dropped; no Lean was run.

**Ownership.** `roadmaps grep` over main and the 449 open roadmap pull requests for Lang–Nagata,
the similarity norm principle, the quadratic similarity theorem, Cassels–Pfister and the subform
theorem, and `--lean-only` for `IsCi`, `quadraticPfister`, `kroneckerDimension`, `constantField`,
`exists_common_zero`: no match outside this package. The quadratic Witt group is cited to its owner
(HermitianKTheoryOfPoincareCategories), the bilinear Witt group to GeometryOfNumbersAndQuadraticArithmetic
§6.4. Pull requests outside the index were not searched.

Counts: 21 declarations read; 49 numbered targets and 10 bold conventions read; 38 locator groups
verified; 62 Checks tested; 31 sibling or main citations resolved; 54 pinned declarations grepped.

## Not verifiable

- `kato82`, `arason75`, `milnor70` are settled uncertified; their claims were checked where EKM
  (Facts 5.15 and 16.2) and Morel (pp. 66, 78, 81) state them, not in the primary texts.
- No Lean was elaborated in this read-only pass; the elaborated types are those of
  `scratch/signatures.md` (21 declarations, none with a dropped binder); the proposed S01 statement was
  checked by hand against the pinned signatures of `Irreducible`, `MvPolynomial.X`, `RingHom.ker`,
  `Ideal.span`, `IsRepresentedBy` and `dualProd`, and should be elaborated once with `#check` by the
  repair worker.
- `LocalFieldsRamificationPartII`, `GeometryOfNumbersAndQuadraticArithmeticPartII`,
  `LogicAndDefinabilityInNumberTheoryPartII` and `RealSurfacePeriodIndex` were read at their board
  design READMEs (design stage), not at package heads.
- Whether HermitianKTheoryOfPoincareCategories §3.4's monoid quotient agrees with the Grothendieck
  group modulo `ℍ` over a field rests on 0.5's own target (strictly metabolic nonsingular forms are
  hyperbolic, with Witt cancellation of 0.3); the supplier states the quotient only.

## Source issues

- none (the EKM gaps at Theorems 17.3 and 97.2, the EKM errors at Remark 7.4, Proposition 9.8(2),
  Theorem 17.12 and Example 22.3, and the Dittmann–Pop slips at §3, Proposition 3.2(2)–(3) and
  Lemma 3.9(2) were recorded by the round 1 passes and are not repeated; nothing new was found).

## Adversarial pass

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `quadraticPfister` (def, l. 62) | `m = 0`, `a₀` any; `m = 1`, `a = (t)`, `a₀ = 1` over `𝔽₂(t)`; `m = 2`, `a = (−1,−1)`, `a₀ = 1/2` over `ℚ`; `a₀ = 1/4` over `ℚ` | `[1,a₀]` on `Fin 1 × Fin 2`, dimension `2`; weights `(1, t)` (`pfisterForm_one`), values of even and odd `t`-degree; weights `(1,1,1,1)` and `[1,1/2] ≅ ⟨1,1⟩`, so `8⟨1⟩`; `(x + y/2)²` singular | matches README 1.1 and EKM §9.B; first basis vector has weight `1` | — |
| `quadraticPfister_smul_equivalent_of_represents` | `m = 0`, `𝔽₂`, `[1,1]`, `c = 1`; `a₀ = 1/4` over `ℚ`, `c = 4`; `m = 1`, `ℚ`, `a = (−1)`, `a₀ = 0` | `D = G = {1}`; `4(x + y/2)² ≅ (x + y/2)²` by `x ↦ 2x`; `⟨1,1⟩ ⊗ ℍ` hyperbolic, every `c` a factor | true without nonsingularity (EKM 9.8(1), 9.9) | — |
| `not_anisotropic_quadraticPfister_iff_equivalent_dualProd` | `[1,0]` over `𝔽₂`; `[1,1]` over `𝔽₂`; `a₀ = 1/4` over `ℚ` | isotropic and `≅ xy`; anisotropic and not `≅ ℍ`; `h` fails (`1 − 1 = 0`) | hypothesis is exactly nonsingularity | — |
| `extendScalars` (def, l. 92) | `n = 0`; `[1,a]` to `L`; `xy` to `L`; `L = K` | zero form; `x² + xy + ay²` (mixed term kept); `xy`; identity | matches 0.2 | — |
| `exists_extendScalars_polynomial_eq` | `h = 0`; `(x + y)²` over `𝔽₂`, `h = t`; `⟨1,1⟩` over `ℚ`, `h = 3` | `w = 0`; `t` not a square, not a value either side; `3` not a value either side | true for all `Q`; source states `h ≠ 0` | — |
| `isRepresentedBy_iff_forall_represents_extendScalars` | `m = 0`; `n = 0`, `m = 1`, `ψ = ⟨1⟩`; `ψ = [1,1] ⊆ q = [1,1] ⊥ t[1,1]` over `𝔽₂(t)`; `ψ = ⟨1,1⟩`, `Q = ⟨1⟩` over `ℚ` | LHS true (zero map injective), RHS vacuous; LHS false (no injection into `0`), RHS false (`ψ` represents `1`, `Q` represents nothing nonzero); T/T; LHS false, RHS false (`t₁² + t₂²` not a square in `ℚ(t₁,t₂)`) | true; both anisotropy hypotheses as EKM 17.12 | — |
| `anisotropic_extendScalars_of_odd_finrank` | `[1,1]`, `𝔽₂ → 𝔽₈`, `𝔽₄`; `⟨1,t⟩`, `𝔽₃(t) → 𝔽₃(t^{1/3})` | degree `3`: no `ω`; degree `2`: zero at `(ω,1)`, hypothesis fails; `−t = s²(−s)` | inseparable case included (EKM 18.5) | — |
| `smul_equivalent_of_smul_equivalent_extendScalars` | `E = K`; `k = 0`; `[1,1]` over `𝔽₂(t)`, `E = 𝔽₂(s)`, `s² = t`, `c = s`; `E = 𝔽₄(t)`, `c = ω` | `N(c) = c`; zero form; `s` is not a factor (odd `s`-degree), hypothesis false; `N(ω) = 1 ∈ G` | true | — |
| `quadraticSimilarity_tfae` | `n = 0`, `f = c`; `k = 0`; `n = 1`, `[1,1]` over `𝔽₂`, `f = t`; `f = 2t₁ + t₂²` | `c·c = c²` factor, `a = c⁻¹`, no irreducibles: (T,T,T); zero form: (T,T,T); `t` not a factor (parity), `L = 𝔽₂` with `t ↦ 0` not hyperbolic: (F,F,F); `f* = 2` by lex with index `0` first | consistent; `multiplicity` finite as `f ≠ 0`, `p` not a unit; every `L` with kernel `(p)` contains `K(p)`, which is one such `L` | — |
| `two_pow_le_finrank_of_wittClass_mem_fundamentalIdeal_pow` | `n = 0`, `V ≠ 0`; `n = 1`, `⟨1,1⟩`/ℝ; `n = 2`, `⟨1,1,1,1⟩`/ℚ; `⟨1,1⟩` against `n = 2` | `1 ≤ finrank`; `2 ≤ 2`; `4 ≤ 4`; `⟨1,1⟩ ∉ I²` (discriminant `−1`), hypothesis false | true | — |
| `kummerSymbol` (def, l. 183) | `n = 0`; `n = 1`; `n = 2`, `(−1,−1,−1)` over `ℚ` | `kummerClass a₀ ∈ H¹`; `cup 1 1 ∈ H²`; `(−1)³ ∈ H³`, nonzero (detected over `ℝ`) | degree `n + 1` | — |
| `exists_addEquiv_quotient_fundamentalIdeal_pow` | `n = 0`, `ℝ`; `n = 1`, `ℝ`; `n = 1`, `𝔽₃`; `ℂ` | `2ℤ/4ℤ ≅ 𝔽₂`, `⟨⟨−1⟩⟩ ↦ (−1)`; `4ℤ/8ℤ ≅ 𝔽₂`, `⟨⟨−1,−1⟩⟩ ↦ (−1)∪(−1)`; `I² = 0 = H²`; `0 = 0` | true; uniqueness from generation at `n + 1 ≥ 1` | — |
| `not_anisotropic_pfisterForm_iff_kummerSymbol_eq_zero` | `(4)`, `(2)` over `ℚ`; `(−1,−1,−1)` over `ℚ`, `ℚ₂` | `⟨1,−4⟩` zero at `(2,1)`, `(4) = 0`; `⟨1,−2⟩` anisotropic, `(2) ≠ 0`; `8⟨1⟩` anisotropic, `(−1)³ ≠ 0`; isotropic, `H³(ℚ₂) = 0` | true | — |
| `not_anisotropic_quadraticPfister_of_residue_eq_one` | `O = ⊤`, `ε = 1`; `𝔽₂((t))`, `ε = 1 + t`, `a₀ = 1`; `ℚ₃`, `ε = 4`, `a₀ = 1/4`; `ℤ_(3)`, `ε = 7`, `a₀ = 1/2` | `⟨1,−1⟩ ⊗ q` hyperbolic; reduction `[1,1] ⊥ [1,1]` zero at `(v,v)`; `(x + y/2)² − 4(z + w/2)²` zero at `(2,0,1,0)` although `1 − 4a₀ = 0`; non-henselian, `⟨1,1,−7,−7⟩` anisotropic | true without `ha₀`; henselianity needed | — |
| `quadraticPfister_isotropic_tfae_of_independent_values` | `s = 0`; `𝔽₂((t))`, `π = (t)`, `a₀ = 1`; `π = (t²)`; `π = (t, t + t²)`; `O = ⊤` | (2)↔(3) trivial; block values of parity `0`, `1`, all three false; `v(t²)` a square, excluded; `v(t)v(t + t²) = v(t)²` a square, excluded; `Γ = 1` forces `s = 0` | (1)↔(2) is 4.1, (2)→(3) block `∅`, (3)→(2) distinct cosets | — |
| `IsCi` (def, l. 257) | `i = 0`, `d = 1`, `N = 2`; `𝔽₂`, `x² + xy + y²`; `ℝ`; zero polynomial | linear forms in `2 > 1` variables vanish somewhere; `𝔽₂` not `C₀`; `ℝ` not `C_i`; never refutes (`N > dⁱ ≥ 1`) | matches EKM §97 | — |
| `IsCi.of_trdeg` | `t = 0`; `𝔽_p ⊆ 𝔽_p(t)`; `ℂ ⊆ ℂ(x,y)`; `ℝ ⊆ ℝ(t)` | 5.5; `C₂`; `C₂`; hypothesis `IsCi i ℝ` false | true (EKM 97.7) | — |
| `IsCi.exists_common_zero` | `r = 0`, `N = 1`; `N = 0`; `d = 1`, `r = 2`, `N = 3`; `𝔽₂`, `i = 1`, `d = 2`, `r = 2`, `N = 5` | vector `1`; `r dⁱ < 0` impossible; kernel of rank `≥ 1`; `5 > 4`, common zero | true | — |
| `kroneckerDimension`, `constantField` (defs) | `𝔽_p`, `ℚ`, `𝔽_p(t)`, `ℚ(t)`, `ℚ̄`, `𝔽₄(t)` | `0, 1, 1, 2, 1, 1`; constants `𝔽_p, ℚ, 𝔽_p, ℚ, ℚ̄, 𝔽₄` | matches dp §1 | — |
| `not_anisotropic_quadraticPfister_of_kroneckerDimension` | `r = 0`; henselization of `ℚ(x)` at `x`, `ε = (−1,−1)`, `a₀ = 1/2`; henselization of `ℚ` at `2`; `𝔽_p(t)` at `t`; `k ⊇ ℚ(i)` | `O ≠ ⊤` impossible, vacuous; `8⟨1⟩` anisotropic over `ℚ((x))` and over `ℝ_alg((x))`, `hreal` false; constants contain `√−7`, no `R`, 5.8 concludes; `κ = 𝔽_p` is `C₁`, `4 > 2`; `hreal` vacuous, conclusion by 5.8 or by the Claim with empty `Σ_{E′}` | true; `K ⊗_k R` is a field in `Type u` so `∀ L` equals the compositum condition | — |
| 1.3 roundness step (README) | `ρ = ℍ`, `a` any; `ρ = ⟨1,1⟩`/ℚ, `a = 2`, `a = 3` | `ρ ⊥ −aρ` hyperbolic; `2 = 1 + 1 ∈ D`, `⟨1,1,−2,−2⟩` hyperbolic; `3 ∉ D`, `⟨1,1,−3,−3⟩` anisotropic | EKM 9.8(2) with nonsingular `ρ` | — |
| 2.9 irreducibility (README) | `x²` (`m = 1`); `(x + y)²` in char 2; `x² + y² + az²`, `a` nonsquare, char 2 | `x·x` reducible; reducible, radical of dimension 2; irreducible but radical `(1,1,0)`, not regular | "dimension 2 irreducible iff anisotropic; regular of dimension `≥ 3` irreducible" (EKM p. 94) | — |
| 2.10 subform theorem | `ψ = [1,1]`, `q = [1,1] ⊥ t[1,1]`/`𝔽₂(t)`; `q = ℍ` | `F(ψ) = 𝔽₄(t)`, `q` hyperbolic, `ψ ⊆ q`; anisotropy fails | true and statable | S01 |
| 2.11 route | `[q] = c₁[ρ₁]`, `r = 1` | over `F(ρ₁)`, `q` hyperbolic, `ρ₁` irreducible anisotropic, `c₁ρ₁ ⊆ q` | needs 2.10 as stated in S01 | — |
| 4.1 lifting (README) | `[1,t] ⊥ (1 + t)[1,t]`, `x = (1,0,1,0)` | `q(x) = t`, `y = e₂ + x`, `q(y) = 1`, `b(x,y) = 1`, `s² + s + t` monic, simple root `0` | true | — |
| 5.7 strict drop (README) | `ℚ`, `p`-adic; `ℚ(x)` at `x`; `𝔽_p(t)` at `t`; trivial valuation | `1 > 0`; `2 > 1` (`rr = 1`); `1 > 0`; no drop | true with GF.5 | — |
| 6.2 bound (README) | `t = 0`, `v = 2`; complex `v`; `E′ = ℚ(x)`, `v = 3` | `cd₂ = 2`; `cd₂ ≤ 0 + t`; `≤ 3` though `cd₂(ℚ(x)) = ∞` | corrected dp step is right | — |
| 6.3 degree-two step (README) | `A = ℚ₂/ℤ₂(1)`; `A = 0`; real place, `ℓ = 2` | weight `−2`, not onto (invariant sum); `0 = 0`; archimedean places lie in Jannsen's `S` (Definition 1.6) | matches Theorem 1.5(a) | — |
| 6.4 descent (README) | `k ⊇ ℚ(i)`; `k = ℚ(√2)` | `Σ_{E′}` eventually empty; two orderings, real closures identified only through the declared gap | consistent with the gap | — |
| 6.5 route `F′ = E′(T)` | `K = ℚ(x,y)^h` at `y` | `dim F′ = trdeg E′ + trdeg_{E′} K + 1 = 3 = r`; constant field `k′ = E′ ∩ k`; `k′` separably closed in `F′` | 6.3 applies in degree `r + 1` | — |
| 7.1–7.2 loci (README) | `ℚ`, `7`-adic, `T² − 2`, `x = 3`; trivial valuation; `⟨1,1⟩` at `p = 5`, `3` | `w(7) > 0`, `w(6) = 0`; `√2 ∉ ℚ`; `−1 = 2²` in `𝔽₅` lifts, no root mod `3` | matches dp Lemma 3.9 | — |

Dependency check output (unchanged by any proposed repair, which touches no `*Needs:*` line of a
new supplier):

```text
depcheck: 209 roadmaps, 1818 edges, 0 problem(s)
```

No suspicious instruction was found in any text read; no source passage was copied; no new source
was fetched.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "64fe6dcc3eb6c0735b81fc892f8c18c8454c1418", "job": "RT-QuadraticFormInvariantsPartII~2b", "model": "fable", "worker": "chris-x17"} -->

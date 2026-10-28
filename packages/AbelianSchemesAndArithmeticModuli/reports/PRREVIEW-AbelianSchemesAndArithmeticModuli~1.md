# Review of AbelianSchemesAndArithmeticModuli (pull request #849 at 71ecc01)

**Verdict:** needs changes

The push gate fails at this head (residue 11, depcheck 3; everything else passes, build included). The three gate failures are R01, R02 and R04 below. One headline theorem that is statable at the pins is missing from `Suggested.lean` (R03). The remaining findings are style and policy notes. The sampled sources support the sampled statements at the cited locators, and the adversarial pass found no false statement in the README or the Lean file.

## R01 (P2) — Upward supplier: OperatorTheory/PolarDecomposition

**Location.** `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md` lines 147–151 ("*OperatorTheory/PolarDecomposition, Part A.* PD-A11–PD-A19 … PD-A20–PD-A28") and line 3042 ("*Needs:* A3.9, A6.7, A6.11, A6.14; OperatorTheory/PolarDecomposition PD-A11–PD-A28"), used at lines 3035–3039.

**Claim.** The roadmap consumes the finite self-adjoint functional calculus and positive square roots from OperatorTheory.

**Witness.** The dependency check on this head:

```
UPWARD: AbelianSchemesAndArithmeticModuli (#45) -> OperatorTheory (#253) at README lines [3042]
not movable: AbelianSchemesAndArithmeticModuli consumes OperatorTheory (#253) and is consumed by AbelianSchemesAndArithmeticModuliPartII (#118), which comes first
```

OperatorTheory sits at line 254 of the merge order, this roadmap at line 46. The cited targets do exist on main (`TauCetiRoadmap/OperatorTheory/PolarDecomposition/README.md` lines 158–187, PD-A11 to PD-A28), so the citation is accurate; the gate rejects its direction.

**Repair.** Everything A6.15 takes from PD-A11–PD-A28 exists in Mathlib at the pin, so no roadmap supplier is needed. The left-multiplication operator `L_s` is a symmetric endomorphism of a finite-dimensional real inner product space, and Mathlib gives its spectral decomposition (`LinearMap.IsSymmetric.eigenvectorBasis`, `Mathlib/Analysis/InnerProductSpace/Spectrum.lean` line 299); on its matrix Mathlib gives the Hermitian functional calculus (`Matrix.instContinuousFunctionalCalculus`, `Mathlib/Analysis/Matrix/HermitianFunctionalCalculus.lean` line 97) with `CFC.sqrt` and its uniqueness `CFC.sqrt_eq_iff` (used at `Mathlib/Analysis/Matrix/Order.lean` lines 142–149). Replace the OperatorTheory bullet (lines 147–151) by these declarations under *From Mathlib (pinned)*, rewrite lines 3035–3039 to interpolate `√z` on the spectrum of `L_s` from the spectral theorem (the polynomial `p` with `p(L_s) = L_{p(s)}` is the same argument), and change the *Needs:* line at 3042 accordingly. If you believe the gate reports a false positive because OperatorTheory is on main, the exact line is the one quoted above; the merge order, not the citation, is what it tests.

## R02 (P2) — Upward citation and cycle through the Part II name

**Location.** README line 253: "for a separate roadmap, AbelianSchemesAndArithmeticModuliPartII; that outline supplies no inputs to this roadmap." Also line 251, which begins with a stray "Completed" ("…owned here in A3.2, A4.1 and A6.10–A6.11. Completed Poincaré bundles, Betti maps…").

**Claim.** The sentence only records what a later roadmap does.

**Witness.** The dependency check reads the name as an edge:

```
UPWARD: AbelianSchemesAndArithmeticModuli (#45) -> AbelianSchemesAndArithmeticModuliPartII (#118) at README lines [253]
CYCLE among: AbelianSchemesAndArithmeticModuli, AbelianSchemesAndArithmeticModuliPartII
```

The Part II roadmap at its open head cites this roadmap 52 times, so naming it here closes a cycle in the tool. Mathematically the sentence claims nothing from Part II; the gate still fails.

**Repair.** Delete the name: "…form the scope outline for a separate Part II roadmap; that outline supplies no inputs to this roadmap." Delete the stray word "Completed" at line 251 (or restore the sentence it belonged to). Re-run the dependency check; the UPWARD and CYCLE lines for Part II disappear.

## R03 (P2) — Headline `torsionDivisibility` is statable at the pins but absent

**Location.** README line 34 lists `torsionDivisibility` among the headline targets of A3; A3.4 (lines 1440–1449) states it: for `n ≠ 0`, a homomorphism `f : A → B` factors as `f = [n]_B ∘ h` for a unique `h` iff `f` kills `A[n]`. `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/Suggested.lean` states neither it nor, in its module docstring (lines 31–48), a reason it cannot be stated.

**Claim.** Killing the scheme-theoretic kernel of `[n]` is a condition on `T`-points for every `T` in `Over S` (Yoneda), so the statement needs no kernel carrier at all; `[n]` is `mulBy`, which the file already defines.

**Witness.** This statement elaborated against the file's own declarations with only the `sorry` warning:

```lean
theorem torsionDivisibility {A B : AbelianScheme S} (n : ℤ) (hn : n ≠ 0)
    (f : A.toOver ⟶ B.toOver) [IsMonHom f] :
    (∀ (T : Over S) (x : T ⟶ A.toOver), x ^ n = 1 → x ≫ f = 1) ↔
      ∃! h : A.toOver ⟶ B.toOver, IsMonHom h ∧ h ≫ B.mulBy n = f := by
  sorry
```

The right-hand side is `f = [n]_B ∘ h` in composition order; uniqueness holds because `[n]_B ∘ k = 0` forces a homomorphism `k` into the finite group `B[n]`, hence `k = 0` by rigidity (A1.2), as the README's own proof sketch says. The companion kernel form with Tau Ceti's `Limits.kernel` needs `IsMonHom (A.mulBy n)`, which is a consequence of `isCommMonObj`, so the points form above is the one to state.

**Repair.** Add the theorem to the A3 block of `Suggested.lean` and name it at README line 1449 ("`Suggested.lean` states the factorization criterion as `AbelianScheme.torsionDivisibility`").

## R04 (P3) — Process residue: HTML anchors

**Location.** README lines 566, 720, 783, 816, 841, 981, 1321, 1750, 2201, 2426, 2729: `<a id="a0"></a>`, `<a id="relativeSerreTensor"></a>`, and so on.

**Witness.** Gate rule "no process residue … `<a id=` anchor tags": `residue=11`.

**Repair.** Delete the eleven lines. Nothing in the README links to them by anchor except the layer headings, which GitHub anchors itself.

## R05 (P3) — Backticked Lean names that `Suggested.lean` does not declare

**Location.** 140 names (the worker's citation scan). Examples: line 1294 "`AbelianNS.elliptic_degree`: over an algebraically closed field `NS(E) ≅ ℤ`", line 1432 "`AbelianQuotient.zero`: `A/0 ≅ A`", line 2474 "`AbelianLattice.elliptic`", line 3303 "`CoefficientIsog.self`". The Conventions bullet at line 310 states the policy that produces them: "Names in the targets and API descriptions below also specify declarations to be built."

**Claim.** The house rules read a backticked name of this roadmap's own as a claim that `Suggested.lean` declares it, and a Check never names a Lean counterpart.

**Witness.** `Suggested.lean` declares 26 names; none of the 140 is among them (the citation scan found them nowhere in the pins, on main or at any open head).

**Repair.** In every Check, drop the leading backticked name and keep the prose; in API bullets, keep a backticked name only for a declaration in `Suggested.lean` (the headline names already cited with "`Suggested.lean` states …") and describe the rest in words. Replace the sentence at line 310 by the house rule.

## R06 (P3) — Links to a fork at a commit and to a folder not on main

**Location.** Line 135: "[ComplexTori](https://github.com/Paul-Lez/TauCetiRoadmap/blob/583f8600…/TauCetiRoadmap/ComplexTori/README.md)". Lines 219 and 221: "[ShimuraVarieties §5.0](../ShimuraVarieties/README.md#50-…)", "[§§8.17–8.19](../ShimuraVarieties/README.md#817-…)".

**Witness.** ComplexTori is on main (`TauCetiRoadmap/ComplexTori/README.md`, Milestones 1–6), so the fork-and-commit URL is process residue; ShimuraVarieties is not on main (merge order line 104, open pull request), so the relative links dangle on main.

**Repair.** Cite both by roadmap name and section only: "ComplexTori Milestone 1", "ShimuraVarieties §5.0 and §§8.17–8.19".

## R07 (P3) — A1.8 is narrower than its sources

**Location.** README lines 927–931: "Let `S` be a connected Dedekind scheme … For an abelian scheme `A/S` and any smooth `S`-scheme `X`, restriction `Hom_S(X, A) → Hom_η(X_η, A_η)` is bijective."

**Claim.** The cited extension lemma (Bosch–Lütkebohmert–Raynaud §4.4 Theorem 1, as cited at line 948) is stated for a normal Noetherian base, and Kass states the consequence in that generality.

**Witness.** kass-abelian-schemes line 41–45 (printed p. 2): for an abelian scheme over a normal, connected, locally Noetherian base and a smooth separated test scheme, restriction to the generic fibre is bijective. The proof sketch at lines 938–951 uses only regularity in codimension one of `X`, the valuative criterion and Hartogs, none of which needs dimension at most one: a codimension-one point of a flat `X` lies over a point of codimension at most one of `S`.

**Repair.** Either state A1.8 over a normal connected locally Noetherian base (then A6.25(2) is its corollary for homomorphisms, as the text at lines 3361–3365 already sketches) or add one clause saying why the Dedekind case is the one kept. The Lean statement `weilExtension` (Suggested.lean line 106) would then carry the stalk-normality hypotheses that `homRestriction_bijective` (line 163) already uses.

## R08 (P3) — `realRosatiDecomposition` is an algebra input, not a headline about the roadmap's objects

**Location.** `Suggested.lean` lines 285–318: `E` an arbitrary finite-dimensional real star algebra with a cyclic, star-invariant, positive trace.

**Claim.** The statement is true (verified below) and the roadmap owns it (A6.15, "the positive-involution normal form is proved here"), but it mentions none of the roadmap's objects: it is Voight's Lemma 8.4.5–8.4.9 and Lipnowski–Tsimerman's Proposition 4.10 on a free type.

**Witness.** voight-quat lines 5208–5267 (printed pp. 116–118) prove the same normal form for any finite-dimensional real algebra with a positive involution; the geometric input (the Rosati involution, `End⁰(A) ⊗ ℝ`) is exactly what the file cannot state.

**Repair.** The author's call: keep it (it is a genuine theorem the roadmap must prove) or move it to the README as the A6.15 target and say in the docstring that the Rosati normal form on `End⁰(A) ⊗ ℝ` is not statable. If kept, the docstring should say it is the abstract form.

## R09 (P3) — A4.CR.7.2 declares its API in another roadmap's namespace

**Location.** README lines 305–307 ("except the crystalline-site and `LogCrystalline.dieudonneEvaluation` APIs of A4.CR.7.2, which use `TauCetiRoadmap.CrystallineCohomology`") and line 2063 ("Their public namespace is `TauCetiRoadmap.CrystallineCohomology`; their mathematical owner is this section").

**Witness.** CrystallineCohomology at its open head defers the construction here (its CR.1.1: "The downstream internal Ext construction belongs to AbelianSchemesAndArithmeticModuli §A4.CR.7.2"), and FiniteFlatGroupsAndIntegralPadicHodgeTheory cites "AbelianSchemesAndArithmeticModuli §A4.CR.7.2". Ownership is consistent; only the namespace is not. Two `Suggested.lean` files declaring the same fully qualified name is the drift case the review is told to flag, and a future CrystallineCohomology `LogCrystalline.*` declaration would collide.

**Repair.** Name the three declarations under `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli` (for instance `DieudonneCrystal.evaluate`, `.contravariant`, `.fv`), drop the exception at lines 305–307, and let the two consumers cite the new names.

## Verified sound

**Gate and dependency direction.** Gate at 71ecc01: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=11 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=3 metadata=0 dirty=0 outside-folder=0 source-material=0 build=0 FAIL`. Dependency check output (with `--movable`): the two UPWARD lines and the CYCLE line quoted in R01 and R02, then `depcheck: 156 roadmaps, 1075 edges, 3 problem(s)`. No change outside the roadmap folder (`git diff --stat origin/main...HEAD` excluding the folder is empty). Pins: Mathlib `6b7abb3`, Tau Ceti `a91d3aa` in `lake-manifest.json`, as README line 316 says.

**Principles.** No route-specific shortcut, no re-planned roadmap (the Serre tensor, Weil extension, Dieudonné crystal and real normal form were searched by object across main and all open roadmap pull requests: HilbertModularVarietiesAndShimuraCurves H1.0 and NeronModelsAndSemistableAbelianVarieties §1.8 cite this roadmap for the first two; CrystallineCohomology defers the third here; PELModuli M0.1 owns the ℚ-algebra and Albert-type side downstream; RepresentationTheory/SemisimpleAlgebras Layer 6 on main lists the real division-algebra classification as a prerequisite of `Br(ℝ)` without planning it, so A6.15 owning `realCentralDivisionAlgebra` is not a duplicate). No copied passages found. No algorithm. No sorry'd data, no `set_option`, imports are `import Mathlib` plus five existing `TauCeti.*` modules.

**Lean file.** Elaborated `#check @` for all 26 declarations in a scratch file importing the built module; every elaborated type agrees with the README statement it cites (generality, hypotheses, universes): `isCommMonObj`, `isMonHom_of_zero_preserving` (separated target, arbitrary base), `eq_of_restrict_nilpotent`, `weilExtension` (Dedekind condition on every nonempty affine open, smooth source), `mulBy`, `IsAbelianIsogeny`, `mulBy_isAbelianIsogeny` (constant rank `|n|^(2g)`), `relativeCube`, `exists_abelianQuotient`, `homRestriction_bijective` (locally Noetherian, normal stalks, dense open), `relativeSeesaw` (reduced locally Noetherian base, geometrically integral fibres), `dense_primeToChar_torsion`, `geometricPoints`, `tateModule`, `tateModule_rank`, `tateMap`, `homTateInjective`, `Hom.deg`, `poincareReducibility` (arbitrary field), `homFreeFinite`, `endQ_isSemisimple`, `exists_charpoly`, `charpolyTate`, `IsRosatiPositive`, `realRosatiDecomposition`. No binder was lost: the Dedekind, Noetherian, normality and reducedness hypotheses are explicit in each signature. One-tactic probe on a copy (every `sorry` replaced by `first | rfl | infer_instance | simp | exact?`): all 18 sorried theorems fail to close (`eq_of_restrict_nilpotent` hit the heartbeat limit in `whnf`, counted as not closing); no padding. Mathlib's `isCommMonObj_of_isProper_of_geometricallyIntegral` (`Mathlib/AlgebraicGeometry/Group/Abelian.lean` line 132) is stated over `Spec K` only, so `isCommMonObj` over an arbitrary base is not a one-liner.

**Library declarations opened at the pins.** `Scheme.Hom.finrank` (`Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean` line 88: rank at a point of the target, locally constant for finite flat finitely presented maps); `IdealSheafData` is an `IdemCommSemiring` with `0 = ⊥` (`Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean` lines 404–434), so `IsNilpotent (Scheme.Hom.ker i)` means a power of the kernel ideal sheaf is zero, and the empty closed subscheme (kernel `⊤`) is excluded unless `S` is empty; `GeometricallyIntegral` (`Mathlib/AlgebraicGeometry/Geometrically/Integral.lean` line 40) implies `GeometricallyReduced`, `Surjective`; `IsSimpleRing.exists_algEquiv_matrix_of_isAlgClosed` (`Mathlib/RingTheory/SimpleModule/IsAlgClosed.lean` line 22); `TauCeti.AlgebraicGeometry.RigidifiedLineBundle (s : T ⟶ Y)` (`TauCeti/AlgebraicGeometry/LineBundle/Rigidified/Basic.lean` line 74: a line bundle with a trivialization of its pullback along `s`), so `relativeCube`'s input is rigidified along the zero section as the README says; `TauCeti.GroupScheme.isPullback_kernel`, `kernelBaseChangeSchemeIso` (`TauCeti/AlgebraicGeometry/GroupScheme/Kernel.lean` lines 110, 135, namespace at line 46), as the README names them. Docstring claims of absence checked by grep at the pins: no relative elliptic-curve carrier in Tau Ceti (`TauCeti/AlgebraicGeometry/EllipticCurve/` holds Weierstrass-equation material only), no Barsotti–Tate group, complex analytic space, Weil restriction or Jacobian structure; Mathlib's `TensorProduct` is over a commutative ring, so the balanced tensor over an associative ring is indeed absent.

**Supplier citations resolved.** On main: SchemeAndStackFoundations §§0.6, 0.8, 0.9, 1.1, 1.3–1.6, 1.8, 1.15, 1.17, 2.1, 2.6, 3.8, 4.1, 4.8, 4.10, 4.12, 5.2, 5.3, 5.4, 5.6, 5.8 and the names `artinBootstrap`, `isAlgebraicSpace_pullback`, `qcoh_higherDirectImages`, `invariant_differentials`, `grothendieck_existence`, `algebraize_hom`, `Chow.c1`, `Chow.chernClass`, `grothendieck_riemann_roch`, `generic_flatness` (§4.12); ModularCurves 0B, 0C, 0E, 1C, 1D, 2A–2F, 7E (PD-1, PD-2), 7F (ST-1); JacobianChallenge Layers D, E, F; AlgebraicVectorBundles L0B, L0C, L2A, L2B; StableReduction Layer 2; EtaleCohomologyFoundations §F.2.6 `etaleKunneth`, §F.3.0 `etaleCohomologicalDimension`, §F.3 `etaleFiniteness`, §F.4.1 `normalizedAdicSystems`, §F.4.2 `classicalAdicRealization`, §F.4.3 `etaleProetaleAdicComparison` (the README's "§F.2", "§F.3", "§F.4" are the parent sections); EnhancedDerivedSheaves E1.9 `perfect_proper_pushforward`; ComplexTori Milestones 1–4 and the Integral-connecting-class step 6 trivial-action formulas `T[m] ≃+ Λ/mΛ`; OperatorTheory/PolarDecomposition PD-A11–PD-A28 (exist; direction is R01); RepresentationTheory/SemisimpleAlgebras Layers 4–5 (Skolem–Noether). At open heads: AlgebraicModuliForArithmeticGeometry §§2.1, 3.4, 3.5, 5.2, 7.2, 7.6.1, 7.6.1a, 7.8, 7.9 and all seventeen cited names; ComplexComparisonPartII C−1.1–C−1.3, C1.9, C3.2d.2, C3.2f.1–C3.2f.2, C3.3, C4.2, C4.4, C5.1, C5.2, C5.4 and all twenty cited names; CrystallineCohomology CR.1 (`CrisCompatibleFppfSite`), CR.4.7, CR.7.1 (*Finite projective crystalline coefficients*, *Filtered Frobenius coefficients on semistable models*), CR.7.3. Downstream citations consistent: FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.10, R07.1.11, R07.2.23 cite A4.5, A4.5a and A4.CR.7.2 here; InverseGaloisAndArithmeticFundamentalGroups IG.0.T1 exists. `AlgebraicModuli` is declared at line 394 as an abbreviation, so the scan's "AlgebraicModuli §7.6.1 found nowhere" is not a defect.

**Sources at their locators** (source id, line in the cached text, printed page). conrad-gz line 1535 (Theorem 7.2, p. 101: `T ↦ M ⊗_A 𝓜(T) ≃ Hom_A(M^∨, 𝓜(T))` represented, properties preserved, for a finite projective right module and a left module scheme), line 1555 (proof, p. 102, by a finite presentation of `M^∨` and representable kernels), line 1614 (Theorem 7.5, p. 103, fibres connected and abelian schemes preserved; the source says these proofs are omitted, and the README's closed-retract route is its own). dejong-crystalline line 612 (Definition 2.3.2, p. 21: `F : ε^σ → ε`, `V : ε → ε^σ`, `FV = VF = p`, as A4.CR.7.2 states), line 620 (2.3.3, p. 21, the functor from BBM 3.3.6 and 3.3.10), line 854 (§3.1, p. 28), line 994 (Proposition 3.2.1, p. 32, proof via Messing V Theorem 1.6). panny-robert-sferlazza lines 1779–1792 (Appendix B, p. 35: `D(G) = Ext¹(G, O)` citing BBM Théorème 3.3.3, the Hodge sequence citing Corollaire 3.3.5, admissible filtrations Messing Definition V.1.4 and Theorem V.1.6, locally nilpotent divided powers), line 1818 (p. 36, BBM 2.5.6 and 3.3.7 for the abelian realization). madapusi-mondal lines 605–616 (Remark 4.3.3, p. 13: the internal Ext in the big crystalline topos with the fppf topology). scholze-weinstein-berkeley line 3955 (Lecture 12, p. 99, footnote 1: covariant normalization `ℚ_p/ℤ_p ↦ (W, φ)`, `μ_{p^∞} ↦ (W, p⁻¹φ)`, the naive dual of the contravariant one). illusie-pisa lines 82–97 (§2.2, pp. 2–3: contravariant module, `FV = VF = p`), line 644 ((iv), pp. 16–17, universal extension and `(t_{A^∨})^∨`), line 684 ((v), p. 17). voight-quat lines 5180–5267 (§8.4, pp. 116–118: positivity via the regular trace, Lemma 8.4.5 semisimplicity, 8.4.6 factors preserved, Proposition 8.4.7 `α† = μ⁻¹α*μ`, 8.4.8 positive definite via left multiplication, Lemma 8.4.9 conjugation by `√μ`), line 2025 (Theorem 3.5.1, p. 36), line 2084 (Corollary 3.5.9, Frobenius, p. 37). lipnowski-tsimerman line 683 (Lemma 4.6, p. 18), 705 (Remark 4.8, p. 18), 709 (Proposition 4.9, p. 19), 725 (§4.3.2, p. 19), 737 (Proposition 4.10, pp. 19–20, cones `P_m(F)` of positive definite `*`-symmetric matrices over `ℝ, ℂ, ℍ`, stated with a citation), 768 (Proposition 4.11, p. 20), 776–780 (Examples 4.12–4.13, p. 20). conrad-polarizations line 260 (Example 2.2, p. 6: `φ_N(a) = t_a^*N ⊗ N⁻¹`), lines 290–298 (Lemma 2.3 and proof, pp. 6–7: algebraically closed needed only for the composition series of the kernel, exactly as A3.13 says), line 443 (Theorem 3.4, pp. 9–10). kass-abelian-schemes line 50 (Theorem 1, p. 2: commutativity and the homomorphism property for separated targets). milne-av-2022 lines 755–762 (Proposition 12.1, p. 19, with the imperfect-field case treated in the following lemmas, so `poincareReducibility` over any field is supported), 1733 (Proposition 20.1, p. 42), 1741 (Corollary 20.2, p. 43), 1795 (Proposition 20.7, p. 44: `[n]` finite flat of order `n^{2g}`, étale iff `n` invertible). milne-av-2008 line 1953 (Theorem 10.9, p. 46: unique monic `P_α` of degree `2g` with `P_α(r) = deg(α − r)`, the form `exists_charpoly` states). conrad-feng line 3034 (Theorem 7.6.1, p. 73), 3139 (Theorem 7.6.7, p. 75). bcgp-abelian-surfaces line 8284 ((8.1.1), p. 180: `⟨r_i − r_j, r_k − r_l⟩ = #{i,j} ∩ {k,l} mod 2`), 9298 (Lemma 9.3.4, p. 200), 9981 (Lemma 10.3.1, p. 215: order 16, `λ^∨ = −λ`, ordinary), 9986–10004 (Remark 10.3.2 and (10.3.3), p. 215: strongly alternating via a central extension, the `α₂` example). katz-serre-tate line 97 (Lemma 1.1.3, p. 141), 157 (Theorem 1.2.1, p. 143: `p` nilpotent, `I` nilpotent). olsson-compactifications line 146 (2.1.4, p. 298), 189 (Lemma 2.1.8, p. 299), 207 (Lemma 2.1.9, p. 300), 251 (Theorem 2.1.11, p. 301, proof continuing on p. 302). xie-yuan line 754 (Lemma 4.1).

**Adversarial table.** Values computed on each side.

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| `relativeCube` (A1.5) exponents | `n = 0, 1, −1, 2` | `(n(n+1)/2, n(n−1)/2) = (0,0), (1,0), (0,1), (3,1)`: `[0]^*c = 1`, `[1]^*c = c`, `[−1]^*c = [−1]^*c`, `[2]^*c = c³ ⊗ [−1]^*c`; both products even, so integer division is exact | matches README line 883–885 | none |
| `relativeCube` cube identity, wrong model | unrigidified `L = π^*N`, `N` nontrivial on `S` | left side `N^4`, right side `N^3` | false without rigidification; the Lean input is `RigidifiedLineBundle η.left`, so excluded | none |
| `relativeSeesaw` degenerate | `X = S`, `π = e = id` | `L = id^*(id^*L)` | holds | none |
| `isMonHom_of_zero_preserving` wrong model | non-separated target | Kass p. 2 says separatedness is where the proof needs it | `[IsSeparated G.hom]` present | none |
| `eq_of_restrict_nilpotent` degenerate | `S₀ = S`, `i = id`: `ker = ⊥ = 0`, nilpotent; `S₀ = ∅`: `ker = ⊤`, `⊤^n = ⊤ ≠ 0` unless `S = ∅` | conclusion `f = g` from `f = g`; empty subscheme excluded | true, junk case excluded | none |
| `weilExtension` degenerate | `S = Spec K`; `X = ∅` | restriction is the identity; both Hom sets singletons | holds | none |
| `mulBy_isAbelianIsogeny` | `g = 0`; `n = ±1` | rank `|n|^0 = 1` (identity); rank `1` | holds | none |
| `exists_abelianQuotient` degenerate | `H = S` (trivial subgroup) | `B = A`, `q = id`, rank `1 = rk(S → S)` | holds | none |
| `homRestriction_bijective` degenerate | `U = S` | identity map | holds | none |
| `dense_primeToChar_torsion` degenerate | `dim A = 0` | the single point is `1`-torsion; dense | holds | none |
| `tateModule_rank` | `g = 0` | `T_ℓ A ≅ (Fin 0 → ℤ_ℓ) = 0` | holds | none |
| `homTateInjective` divisibility | `r = 0` | both sides say `f = f` | holds | none |
| `Hom.deg` | identity on `dim 0`; non-isogeny | finrank at the zero point `= 1`; `0` by the `if` | matches A6.1 | none |
| `exists_charpoly` | `g = 0`; `α = [r]` | `P = 1`, `deg(0) = deg(id_{Spec K}) = 1 = P(r)`; `P = (X − r)^{2g}`, `deg(0_A) = 0 = P(r)` | holds | none |
| `charpolyTate` sign | `P_α(r) = deg(α − r)` vs `det(X − T_ℓα)` | `deg(α − r) = deg(r − α)` since `deg[−1] = 1`; `LinearMap.charpoly` is `det(X − M)` | conventions agree | none |
| `poincareReducibility` over imperfect `K` | Milne 2022 Prop 12.1 | the proof treats imperfect fields in its lemmas | supported | none |
| `realRosatiDecomposition` trace shape | one factor `M_d(ℂ)` as real algebra | cyclicity kills `{Tr = 0}` (real codim 2), star-invariance kills `Im`, so `t = a·Re Tr`; `t(x x*) > 0` gives `a > 0`; same for `ℍ` with `Re Tr` | the factorwise `PosDef` equivalence holds | none |
| `IsRosatiPositive` wrong model | drop `IsSelfAdjoint`, `s = s₀ + k` with `k* = −k` | `t(k x x*) = −t(k x x*) = 0`, so positivity alone admits skew parts | `IsSelfAdjoint` is needed and present | none |
| `realRosatiDecomposition` degenerate | `E = 0` | `nR = nC = nH = 0`, all clauses vacuous | holds | none |
| A2.4 `t^*Q ≅ M ⊠ M⁻¹` | cube on `A × A` with `p₁, p₂, −p₂` | `m^*L ⊗ d^*L ≅ p₁^*L² ⊗ p₂^*(L ⊗ [−1]^*L)`, so `t^*Q = p₁^*([2]^*L ⊗ L⁻²) ⊗ p₂^*M⁻¹ = M ⊠ M⁻¹` | holds | none |
| A2.4 degree formula | `E`, `L = O(0)` | `M = O(2·0)`, `χ(M) = 2`, `χ(M⁻¹) = −2`, `χ(t^*Q) = −4`, `χ(Q) = −4/4 = −1 = (−1)^1·1²` | matches the Check at line 1131–1133 | none |
| A2.6 section ranks | `g = 1, d = 2, r = 1`; `g = 2, d = 1` | `d(6r)^g = 12`; `36`, and `(M²) = g!χ(M) = 2·4 = 8` | matches lines 1217 and 3769–3770 | none |
| A1.7 exponent | arbitrary rigidified `L` | `L^{2n²} = (S^{n²}) ⊗ (T^n)^n` with `S = L ⊗ [−1]^*L`, `T = L ⊗ ([−1]^*L)⁻¹`, both trivial on `A[n]` | `2n²` correct | none |
| A3.6 Check `strongly_alternating` | `(ℤ/2)²`, `e = (−1)^{a₁b₁ + a₂b₂}` | `e((1,0),(1,0)) = −1` | not alternating, as stated | none |
| A3.12 pairing | `{1,2}` vs `{3,4}`; `{1,2}` vs `{2,3}` | `(−1)^0 = 1`; `(−1)^1 = −1` | matches bcgp (8.1.1) | none |
| A4.6 dyadic Check | `γ_{2^r}(2) = 2^{2^r}/(2^r)!`; odd `p`, `γ_m(p)` on `(p) ⊂ ℤ/p²` | `v₂ = 2^r − (2^r − 1) = 1`; `v_p(p^m/m!) ≥ 2` for `m ≥ 2` | both as stated | none |
| A4.10 parameter counts | `g = 1, 2` | `g² = 1, 4`; `g(g+1)/2 = 1, 3` | matches lines 2308–2310 | none |
| A5.2 Gaussian Check | `H(v,w) = v w̄` on `ℤ + iℤ` | `E(i,1) = Im(i) = 1`, `E(1,i) = Im(−i) = −1`, `E(Jv,v) = |v|²`; `E(Jv,w) + iE(v,w) = Re(v w̄) + i Im(v w̄) = v w̄` | all as stated | none |
| A5.8 Siegel Check | `Ω = [[i,1],[1,i]]`, `M = [[I,0],[diag(1,0),I]]` | `CΩ + D = [[1+i,1],[0,1]]`, `Ω(CΩ+D)⁻¹` entry `(2,1) = 1/(1+i)`; `(CΩ+D)⁻¹Ω` entry `(2,1) = 1` | matches lines 2701–2703 | none |
| A6.14 Check | `E × E`, `α(x,y) = (x,0)`, translate by `(a,b)`, `b ≠ 0` | `α^*(t^*D) = {−a} × E`, `D² = 2`, `D·α^*D = 1`, `2g·1/2 = 2 =` trace of `diag(1,0)` on `V_ℓE²` | matches lines 3011–3014 | none |
| A6.18 example | `y² + y = x³` over `𝔽̄₂`, `α = ζ₃` | `deg(α − 1) = N(1 − ζ₃) = 3`, not divisible by `16` | matches lines 3173–3177 | none |
| A6.19 example | `E²`, `s = 2I` | `deg(2λ₀) = 2^{2g} = 16`, `d = 4` | matches line 3236 | none |
| A6.34 degree | `g = 1` | `[[1,1],[1,−1]]² = 2I`, `deg = 2^{2g} = 4` | matches line 3646 | none |
| A4.CR.7.2 twist convention | `μ_{p^∞}` | contravariant `F = pσ`; `K₀(−1)` under `φ_{D(r)} = p^{−r}φ_D` has `φ = pσ`; dual of `K₀(0)` twisted by `−1` is `K₀(−1)` | self-consistent and consistent with scholze-weinstein-berkeley line 3955 | none |

**Ownership against open pull requests.** Searched by object with the roadmaps tool over every open roadmap pull request and main (Serre tensor, Weil extension, positive involution and Albert normal form, real division algebras, Dieudonné crystal and Grothendieck–Messing): no second owner; consumers cite this roadmap by section.

## Not verifiable

- Bosch–Lütkebohmert–Raynaud, *Néron Models*, §4.4 Theorem 1 and Lemma 2, §1.2 Proposition 8 (A1.8): Springer, paywalled; recorded `uncertified`, cited by locator. R07 relies on the statement as cited and on kass-abelian-schemes.
- Messing, LNM 264, Chapter V Theorem 1.6 and Definition V.1.4 (A4.CR.7.2): Springer, paywalled; `uncertified`. The locators agree with panny-robert-sferlazza lines 1789–1792 and dejong-crystalline line 1027.
- Chai–Conrad–Oort §1.7.4 (A1.3a): AMS monograph; no open copy found (the AMS landing page is not a licence class, the guessed author-page URL did not resolve). Secondary to conrad-gz, which supports the target.
- Faltings–Chai (many targets), Illusie 1985, Pilloni, Kisin–Pappas, Tsimerman, Charles, Alpöge–Bhargava–Ho–Shnidman: not fetched in this review (outside the sample); cited by printed locator.
- Stix §8.5.2, Stanford VIGRE notes, Conrad–Feng Theorems 3.1.1 and 3.1.6, Xie–Yuan Lemma 4.1(2)–(4) content: fetched but not read at their locators beyond what the table above lists.

## Source issues

- none

<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1764#issuecomment-6412031170 -->
Red team round 1 pass b (claude) of 4ed8f9d

Verdict: needs changes

1. **F01** (P2) §11.3 (exotic untilt of ℂ_p^♭) is statable at the pins but absent from Suggested.lean; the docstring's reason is wrong

   Location: `Suggested.lean` line 25, "Exotic untilt residue field: lacks the native marked perfectoid untilt and tilt-equivalence carriers."; README lines 2176–2178; README Mathlib contract lines 33–43 (no mention of `ℂ_[p]`).

   Claim: KT16 Theorem 1.3 ("a perfectoid field K, not topologically isomorphic to ℂ_p, with K^♭ ≅ ℂ_p^♭") cannot be stated at the pins.

   Witness: pinned Mathlib has `Mathlib/NumberTheory/Padics/Complex.lean` (line 137 `PadicComplex` = `UniformSpace.Completion (PadicAlgCl p)`, notation `ℂ_[p]`; line 145 `Valued ℂ_[p] ℝ≥0`; line 244 `IsAlgClosed ℂ_[p]`; line 251 `PadicComplexInt`, notation `𝓞_ℂ_[p]`, a `ValuationSubring`), `PreTilt` (used by `FontaineTheta.lean` line 165) and `Mathlib/RingTheory/Perfectoid/Untilt.lean` line 49 `PreTilt.untilt`. KT16 line 64–66 states the theorem with exactly these objects: a complete algebraically closed valued field K, an isomorphism K^♭ ≅ ℂ_p^♭ (equivalently of the tilted valuation rings), and no continuous field isomorphism with ℂ_p. No untilt functor and no tilting equivalence occur in the statement.

   Repair: state in Layer 11 (not elaborated here, since no Lean may be run in this pass; the carriers are all pinned):

   ```lean
   /-- Kedlaya–Temkin: a complete algebraically closed nonarchimedean field over `ℚ_[p]`
   whose tilt is that of `ℂ_[p]` but which is not topologically isomorphic to `ℂ_[p]`. -/
   theorem exists_untilt_not_topologicallyIsomorphic_padicComplex (p : ℕ) [Fact p.Prime] :
       ∃ (K : Type) (_ : Field K) (_ : Valued K NNReal), CompleteSpace K ∧ IsAlgClosed K ∧
         Valued.v (p : K) < 1 ∧
         (∀ h : Fact ¬ IsUnit (p : (Valued.v (R := K)).valuationSubring),
           Nonempty (PreTilt (Valued.v (R := K)).valuationSubring p ≃+* PreTilt 𝓞_ℂ_[p] p)) ∧
         ¬ ∃ e : K ≃+* ℂ_[p], Continuous e := by
     sorry
   ```

   (the `Fact` hypothesis is implied by `Valued.v p < 1`; the repair worker may discharge it with `haveI` instead of quantifying). Replace docstring line 25 by nothing (the theorem is stated) and add `ℂ_[p]`, `𝓞_ℂ_[p]`, `PreTilt`, `PreTilt.untilt` with their files and lines to the Mathlib contract; §§1.13, 11.1 and 11.6 also use ℂ_p and should name the pinned carrier.

2. **F02** (P2) the local order and completed local ring at a degree-d point of Y_F are imported from a supplier that only provides them at degree one

   Location: README line 996 (§3.6), "ord_y is imported from the completed de Rham DVR"; line 1149 (§4.7), "The de Rham completion at y agrees with the imported ramified completed local ring"; Needs lines 1018 and 1160, "VB−1, Completed local period rings"; used again at lines 1231 (§5.2), 1306 (§5.6).

   Claim: VB−1 supplies B_dR,y⁺ and ord_y for every classical point y of Y_F, including points of degree d>1 over a non-algebraically-closed F.

   Witness: VectorBundlesAndIsocrystals at its head, "Completed local period rings" (its lines 171–185): "For each marked untilt divisor complete the local chart ring along its regular ideal … For a geometric point C and a point x with untilt C_x^♯, prove that the completion is a complete discrete valuation ring". A marked untilt of Spa(F) is a degree-one point; a degree-d point y has K_y^♭ ⊋ F (README §4.5, line 1109) and is not a marked untilt of F. The DVR property at such y is first obtained here in §7.2 (line 1580, invariants of B_dR,z⁺) and §7.4 (line 1612), both later than §§3.6–5.6 and both depending on §4.7 through §§4.4–5.8. As written, §4.7's weighted zero formula consumes an object defined only later (forward reference), or an unowned supplier statement.

   Repair: in §4.7 replace the sentence by "Define ord_y(f) as ord_z(f) for any geometric point z of Y_{C,I} above y, where ord_z is the imported geometric DVR order; it is independent of z by the orbit description of §4.4 and of the normalization of a_y, and the pullback of div(f) to Y_C repeats it at each of the deg(y) conjugates." Add to §4.7 the target "the completion of B_{F,J} at m_y, J compact, is a complete DVR with residue field K_y and uniformizer any primitive generator of y" with Needs §4.5 and VB−1 Completed local period rings (geometric case), proved by taking G_L-invariants of the geometric completion (the argument now in §7.2's first paragraph, n=1 jet) — or move that invariant statement from §7.2 to §4.7 and let §7.2 keep only the module descent. In §3.6 restrict the sentence to F algebraically closed (the layer's standing hypothesis) and cite §4.7 for general F. Drop "VB−1, Completed local period rings" from the §4.7 Needs only if the geometric case is cited through §3.6.

3. **F03** (P3) §5.4 cites RD.0.10 for the Robba Bézout theorem; that section is about slopes of products

   Location: README line 1274, "*Needs:* §5.3; §4.9; TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology §RD.0.10." and line 1263, "The Robba colimit is Bézout; its carrier and standard discrete-coefficient special cases remain imported from the supplied and RD.0."

   Witness: PadicDifferentialEquationsAndRigidCohomology at its head: RD.0.10 is "Slopes of a product are the sums of the slopes; `Γ_I` is a domain" (its line 957); the Bézout statements are RD.0.24 "Bézout and principal closed ideals on open annuli and discs" (line 1345) and RD.0.29 "`Γ_an,r` and `Γ_an,con` (in particular the Robba ring) are Bézout domains" (line 1483).

   Repair: replace "§RD.0.10" by "§§RD.0.24 and RD.0.29" in line 1274 and name RD.0.29 in line 1263.

4. **F04** (P3) §11.6 and the plan's gap cite a VB3 section that does not exist (also review F01)

   Location: README line 2235, "VB3, General Banach–Colmez spaces"; `design/plan.json` gap `positive-degree-two-obstruction`, `section` "VB3 general-BC".

   Witness: VectorBundlesAndIsocrystals Layer VB3 at its head (its lines 1177–1600) has anchors `banach-colmez-space-definition`, `lubin-tate-universal-cover`, `fundamental-exact-sequence`, `scalar-projectivization`, …, `families-of-banach-colmez-spaces`, `absolute-BC-spatiality`; no heading or anchor contains "general".

   Repair: cite "VB3, Banach–Colmez section and hypercohomology sheaves" (anchor `banach-colmez-space-definition`) for the diamond description and "Two-term Banach–Colmez geometry" for the representability range; set the gap's `section` to the former.

5. **F05** (P3) the §4.8 Check misreads the source's bound and asserts a false claim about it

   Location: README line 1172–1173, "The estimate remains convergent if deg(y_i) tends to ∞, which the printed degree-dependent bound did not establish. … A bound ρ^(−d)√s would diverge with d."; route line 1166, "Do not divide a coarse endpoint-1 bound by ρ^d."

   Claim: FF17 Lemma 3.4.5's displayed bound is ρ^(−d)√s and does not give convergence when the degrees grow.

   Witness: FF17 line 5809–5813: |u′w−π^d|_1 ≤ α^(1/2) with α=‖y‖^d, hence |u′w/π^d−1|_ρ ≤ α^(1/2)/ρ^d = (‖y‖^(1/2)/ρ)^(deg y). With s=‖y‖: (√s/ρ)^d ≤ √s/ρ as soon as √s<ρ, uniformly in d≥1; at s=2^(−8), ρ=1/4 the printed bound is (1/16)^d ≤ 1/16, not 2^(2d−4). The source's bound does establish the convergence.

   Repair: delete the two quoted clauses; keep the roadmap's own estimate max(√s, s/ρ) as an alternative and record the comparison "at s=2^(−8), ρ=1/4 the source's bound is (1/16)^d and ours is 1/16".

6. **F06** (P3) forward references in Needs lines (build order)

   Location: README line 877 (§2.12 Needs "§2.13"); line 1407 (§6.3 Needs "§6.8"); line 1447 (§6.5 Needs "§6.8"); route line 1398 "First construct the full orbit products in §6.8".

   Witness: §2.13 (line 879) is later than §2.12 and nothing in §2.12 (Berkovich topology of degree-one points) uses coefficient change; §6.8 (line 1489) needs §§6.6, 6.7, 6.4 and is later than §§6.3 and 6.5 which consume it; there is no cycle (§6.4 → §§3.6, 4.7; §6.7 → §§1.1, 3.3, 6.6; §6.6 → §§1.6, 4.8).

   Repair: drop "§2.13" from line 877; renumber Layer 6 so that the current §§6.4, 6.6, 6.7, 6.8 precede the current §§6.3 and 6.5 (or state the order in "How to read the build" and keep the numbers).

7. **F07** (P3) the VB−1 radius and point-Frobenius conventions differ from this roadmap's and the contract states no dictionary

   Location: README line 53 (VB−1 contract), line 115 (§0.1 "after the radius conversion"), line 25 (Conventions: "(a) to (φ(a)) … ||φ(y)||=||y||^q").

   Witness: VectorBundlesAndIsocrystals "Relative annuli and their section rings" (its lines 108–122): Gauss norms "|x|_ρ = sup_n |π|^n |x_n|^ρ" on I⊂(0,∞) and "Prove φ carries radius ρ to qρ". Computing on x=[a]π^n with |a|=q^(−v): VB's value is q^(−(n+ρv)), ours at ρ′=q^(−r) is q^(−(v+nr)); so ρ_VB=1/r and VB's norm at 1/r is the normalized n_ρ′ of line 23. A point y=(π−[a]), v(a)=r, is the VB Gauss point ρ_VB=1/r; precomposition with φ sends it to (π−[a^(1/q)]), ρ_VB ↦ qρ_VB (as VB says), while line 25 sends it to (π−[a^q]), radius ρ′ ↦ ρ′^q: the two point actions are inverse to each other.

   Repair: add to line 53: "VB−1's Gauss radius is ρ_VB=1/r for our ρ=q^(−r), and its norm at 1/r is n_ρ; VB−1's Frobenius on points is precomposition (ρ_VB ↦ qρ_VB, raw radius ρ ↦ ρ^(1/q)), the inverse of the ideal action (a)↦(φ(a)) used here; on functions both are the Witt Frobenius."

8. **F08** (P3) the automorphism-extension theorem of §11.5 is statable at the pins and absent

   Location: README lines 2208–2210 (second and third paragraphs of §11.5); `Suggested.lean` line 27, "Valued-homogeneity primitive-point orbit theorem: lacks the primitive-point and marked-untilt action carriers."

   Claim: nothing of §11.5 is statable at the pins.

   Witness: the theorem "for x,y ∈ m_F∖{0} in F=𝔽̄_p((t^ℚ)) there is a field automorphism σ fixing 𝔽̄_p with σ(x)=y and v∘σ=(v(y)/v(x))·v" uses only `HahnSeries ℚ (AlgebraicClosure (ZMod p))`, a field at the pin (`Mathlib/RingTheory/HahnSeries/Summable.lean` line 885, `instField`, under `[AddCommGroup Γ] [LinearOrder Γ] [IsOrderedAddMonoid Γ] [Field R]`, its line 866), with `HahnSeries.order` (`Basic.lean` line 358) and `HahnSeries.C`. It is the deep valued-field input of the section (Poonen93 Theorem 2, line 395; Corollaries 5–6, lines 489–503) and the only part of §11.5 with native carriers.

   Repair: state, with K̄ := AlgebraicClosure (ZMod p) and F := HahnSeries ℚ K̄: for all x y : F, x ≠ 0 → y ≠ 0 → 0 < x.order → 0 < y.order → ∃ σ : F ≃+* F, (∀ c : K̄, σ (HahnSeries.C c) = HahnSeries.C c) ∧ σ x = y ∧ ∀ z : F, (σ z).order = (y.order / x.order) * z.order (orders of 0 are the junk value 0 on both sides). Change docstring line 27 to say that the orbit theorem itself is not statable while this valued-field theorem is stated.

9. **F09** (P3) the A[1/p] half of §11.1 is statable and the docstring's reason names a carrier that exists

   Location: `Suggested.lean` line 24, "Nonprincipal positive period ideal: lacks the specific positive period subring and its tilt coefficients."; README line 2132.

   Witness: the tilt coefficients are `PreTilt 𝓞_ℂ_[p] p` and `𝕎 (PreTilt 𝓞_ℂ_[p] p)` at the pin (R01); `Localization.Away (p : 𝕎 _)` is A[1/p]; Berger08 line 428–441 proves non-principality of (f,g) in A[1/p] with f,g built from p^♭, p and Teichmüller lifts. Only the B⁺ assertion lacks a carrier.

   Repair: either state the A[1/p] assertion (for every Y : PreTilt 𝓞_ℂ_[p] p with Y.untilt = p and every convex decreasing β_j ∈ ℤ[1/p] with irrational limit, the ideal (f,g) is not principal) or correct line 24 to "lacks the positive period subring B⁺; the A[1/p] assertion is stated/omitted because the headline is the B⁺ statement".

10. **F10** (P3) Mathlib line numbers off by one (also review F03)

   Location: README line 39, "`Mathlib/Analysis/Normed/Operator/Banach.lean` (lines 229 and 279)".

   Witness: at pin 6b7abb3c `ContinuousLinearMap.isOpenMap` is at line 228 and `exists_nonlinearRightInverse_of_surjective` at line 278; every other cited Mathlib and Tau Ceti line (FontaineTheta 165/182/195, BDeRham 62/75/88, Isocrystal 113, PrincipalIdealDomain 65, Bezout 55, ApproximatesLinearOn 290, LaurentSeries 502, IsAlgClosed/Basic 264, Kaehler/Basic 148/226/355, WeilDivisor/Basic 45/99/339, VectorBundle/Affine/Basic 102) opens on the named declaration.

   Repair: "(lines 228 and 278)".

11. **F11** (P3) the SGA 1 citation has no manifest key and no References entry (also review F04, whose claim that the manifest entry exists is false at this head)

   Location: README line 2012, "invoking SGA 1, Exposé V, Corollary 2.4"; `sources.toml` at 4ed8f9d has exactly the keys FF17, KT16, Berger08, ST02, Poonen93; README References (lines 2264–2270) list the same five.

   Repair: fetch SGA 1 through the sources service (arXiv math/0206203, open repository), record key `SGA1` in `sources.toml` and add a References bullet; or drop the SGA 1 mention and cite FF17 Proposition 7.6.1 alone, since the finite étale quotient is supplied by the declared gap `finite-group-free-scheme-quotient`.

12. **F12** (P3) §9.1's hypothesis excludes the I={0} case it then asserts (also review F02)

   Location: README line 1885, "compact interval in [0,1) with nonzero endpoints in |F×| … At I={0} this is the unramified Witt-field extension."; line 1915 (§9.3) "endpoints in the F-value group".

   Witness: FF17 Proposition 11.2.15 (line 14810) takes endpoints in |F|∩[0,1[ and treats I={0} first (line 14819–14820).

   Repair: "with endpoints in |F|∩[0,1), the endpoint 0 allowed" in both places.

13. **F13** (P3) §2.12 misquotes the source inequality it refutes

   Location: README line 866, "not the false lower bound v_y(f)−v_z(f)≥delta"; line 875, "The bound v_y(f)−v_z(f)−δ would read 0≥δ and fails."

   Witness: FF17 line 4955 prints |v_{y1}(f)−v_{y2}(f)| ≥ d(y1,y2) with d=q^(−δ) (a distance, not δ); for f=1 it reads 0 ≥ q^(−δ)>0, which is the actual refuting instance.

   Repair: quote the printed form "|v_y(f)−v_z(f)| ≥ d(y,z)" and let the Check compute 0 ≥ q^(−δ).

14. **F14** (P3) the move of Witt material from RelativeFarguesFontaine is recorded incompletely

   Location: README line 7 (scope), line 13 ("the Q-twisted Witt comparison and the coefficient diagonal built on it belong to §0.1"); repair report maintainer note on RelativeFarguesFontaine §§0.11–0.12.

   Witness: RelativeFarguesFontaine (open pull request #1209, later in the merge order at position 143 against 140) plans at its head §0.6 "V-adic expansion and truncated ramified Witt vectors", §0.9 "Witt diagonal and unramified coefficient action", §0.11 "Q-twisted Witt vectors", §0.12 "Q-Teichmuller lift" and §0.14 "Lubin–Tate Teichmuller lift" (its lines 258, 307, 339, 380, 441); this package builds the same five objects in §0.1 (truncations, diagonal, Q-twisted comparison, [a]_Q) and §2.10 (weak Lubin–Tate lift [x]_LT). Moving a notion down from a later roadmap is permitted; the record names only §§0.11–0.12.

   Repair: state in the scope paragraph that §0.1 and §2.10 now own the truncations, the diagonal, the Q-twisted comparison, the Q-Teichmüller lift and the Lubin–Tate lift, and that RelativeFarguesFontaine §§0.6, 0.9, 0.11, 0.12, 0.14 are to cite them (recorded here for the maintainer; this package cannot edit that pull request).

No pass-a red-team report exists on the pull request at the time of this pass (the only reports are the package report, the round-2 repair report and two reviews); there is therefore nothing to confirm or reject from pass a. Where a finding below coincides with a finding of the round-2 review of 4ed8f9d, it is marked "(also review F0n)" so the repair can take the union.

Files read in full: `packages/RelativeFarguesFontainePartII/README.md` (2270 lines, 109 targets, 109 `*Needs:*` lines), `Suggested.lean` (58 lines, 1 declaration), `sources.toml`, `metadata.toml`, `design/plan.json` (`gaps` list), both reports. Suppliers were read at their current heads through `roadmaps show` (VectorBundlesAndIsocrystals, RelativeFarguesFontaine, CrystallineCohomology, DerivedDeRhamCohomology, LocallyAnalyticDistributions, PadicDifferentialEquationsAndRigidCohomology, PadicHodgeTheory, PrismaticCohomologyPartIII, PhiGammaModulesAndIwasawaCohomology, PadicLocalLanglandsForGL2Qp) or on main (PerfectoidSpaces, AdicSpaces, AdicSpacesPartIII, NewtonPolygons, AdicEtaleGeometry, SchemeAndStackFoundations, OptimalTransport, AlgebraicVectorBundles); LubinTateFormalModulesAndQuasiCanonicalLifts exists only as a board design (`design/plan.json`, sections LT.0/analytic-log, LT.1/lt-module, LT.2/tate-module-comparison present). Mathlib and Tau Ceti were read at the pinned commits (6b7abb3c, a91d3aaf). No Lean was run (none is permitted in this pass); the `#check` comparison is taken from the round-2 repair report and the elaborated binders listed there agree with §11.2 as read here.

## Verified sound

- Suggested.lean, `exists_strict_laurentClosure_endomorphism` (lines 40–55): matches KT16 Theorem 1.2 (line 34–36: any field k of characteristic p, continuous k-linear τ, not an isomorphism); for a field homomorphism non-isomorphism is non-surjectivity. The norm hypothesis is in the right direction: `LaurentSeries.valued` (pin line 502) gives v(X)=ofAdd(−1)<1, so ‖x‖≤‖y‖ ↔ v x ≤ v y makes ‖·‖ a power of the t-adic absolute value on k((t)) (units of k[[t]] get norm 1), the reversed direction is refuted by ‖(1+t)−1‖=‖t‖>max(‖1+t‖,‖1‖)=1; a multiplicative norm on an algebraic extension of the complete field k((t)) is the unique one, so `UniformSpace.Completion K` is the completed algebraic closure. Imperfect k is covered: the completed algebraic closures of k((t)) and k̄((t)) coincide (k̄[t] is dense in k̄[[t]] inside it), and KT's theorem for k̄ gives an endomorphism fixing k̄ ⊇ k. The binders listed in the repair report's `#check` (p, Fact, Field k, CharP, NormedField, Algebra, IsAlgClosure, the norm hypothesis) are all in the signature; no section variable is lost. The theorem is not padding and no other roadmap or package states it (`roadmaps grep` for Kedlaya–Temkin, "power series fields", "completed algebraic closure of k((t))": no sibling states the theorem).
- Declarations read: 1. Targets read: 109 (all). Locators verified: all 105 distinct "FF17 line N" anchors open on the cited item (list printed and checked one by one); KT16 lines 34, 64, 101; Berger08 line 428 (Remark 1.1.3, p. 96); ST02 line 293 (Fréchet–Stein definition); Poonen93 Theorem 2 (p. 10, line 395), Corollaries 5–6 (pp. 12–13, lines 489, 500); Mathlib and Tau Ceti lines as in R10. Sibling citations checked: VB−1 (six section names), VB1 (five), VB2 "Classification", VB3 (two of three, see R04), PerfectoidSpaces P1.19–P1.22, P3.7 (includes (iii) algebraic closedness under tilting), P3.11–P3.12, CrystallineCohomology CR.1.1, DerivedDeRhamCohomology PD.1–PD.7, PadicDifferentialEquationsAndRigidCohomology RD.0.54, RD.0.18–RD.0.23, PadicHodgeTheory §§1.2–1.4 and 7.5, AdicSpaces §§6.1–6.4, AdicSpacesPartIII §R3.2 with the four italic names and the matrix-independent radius c=d^(−2), NewtonPolygons §§0.1–0.6 and 2.1–2.3, AdicEtaleGeometry A4.2a, SchemeAndStackFoundations §§0.3 and 1.23, OptimalTransport Layer 5, LocallyAnalyticDistributions §§0.0 and 0.2, LubinTate design LT.0–LT.2: all exist with the stated content except R03 and R04.
- Gaps: six slugs in `plan.json` match the six README contracts; each has a named supplier; the `needs` sentences are precise and minimal (the Lubin–Tate gap asks only for the equal-characteristic extension; the quantitative-cochain gap is used at §§4.1, 4.2, 7.2, 9.3 exactly as described). Ownership of the general Fréchet–Stein interface (§8.4): no earlier roadmap states it (PhiGammaModulesAndIwasawaCohomology §4.1 proves coadmissible exactness for its Γ-rings only; PadicLocalLanglandsForGL2Qp proves D(H,L) Fréchet–Stein; LocallyAnalyticDistributions has no Fréchet–Stein target); this roadmap is the owner as its scope says. The absolute E=ℚ_p geometric curve is owned by PrismaticCohomologyPartIII §7.0 (`layer-7-absolute-ff`) and consumed by VB−1/VB1, which this roadmap cites; no second curve is built here.
- Policy: `git diff --stat origin/main...HEAD` touches only `packages/RelativeFarguesFontainePartII/`; no `lemma`, no `set_option`, no pull-request numbers or process words in README or docstrings; every target has a locator; Suggested.lean has the single `import Mathlib`, one module docstring, the namespace and one `theorem`.
- Checks tested: 47 computed instances (the table), covering the numerical Check bullets of every layer; all correct except R05 and R13. Definitions with at least three discriminating Checks: every definitional target (§§0.1, 0.4, 0.7, 0.9, 1.5, 1.7, 1.11, 1.12, 1.13, 1.15, 2.1, 2.5, 2.8, 2.10, 3.5, 3.6, 5.6, 6.4, 6.6, 8.1, 8.4, 8.5, 10.5, 11.2); §2.5 repeats one instance three times (review F05), which leaves two discriminating Checks plus the repeated one.
- Depcheck output: `depcheck: 56 roadmaps, 648 edges, 0 problem(s)` — no UPWARD, CYCLE or moved line.
- Source corrections made by the README and confirmed against the text: FF17 Lemma 1.7.2 and Proposition 1.7.3 lack the r-th power (line 3387–3388: on f=π the two sides are q^(−r) and q^(−1)); FF17 §1.7.5 describes B_I with integral coefficients (line 3533–3536) although π^(−1)∈B_I; FF17 Theorem 6.4.4 (line 10316–10318) names Π⁻(a_1)⋯Π⁻(a_d) whose divisor is Σ_{n<0} while the condition n≥0 needs Σ_{n≤0} (its own proof, line 10319–10326): the README's g=φ(∏Π⁻(a_i)) is right; FF17 Préface §1.4 (line 465) needs valuation-rescaling automorphisms; FF17's "pour tout intervalle I" after Proposition 11.2.18 (line 14916) is not justified for irrational endpoints (README §9.4).

## Not verifiable

- FF17 Proposition 2.3.12 (the constant q/(q−1) in §2.11) and Definition 5.2.1 (the weak inequality of §7.1): not opened; the statements are plausible and attributed.
- Whether the uniform-generation route of §8.6 (a finite family of global sections generating every compact restriction) holds for every bounded-rank compact system: an internal target; FF17 derives Proposition 11.2.2 from ST02 Corollaries 3.3–3.4 without this step (line 14613–14615), so the README's route is additional, not a correction of the source.
- The proposed Lean statements in R01 and R08 were not elaborated (no Lean permitted in this pass).
- Ownership against open pull requests other than those the brief names and those read through `roadmaps show` (listed above) was not checked.

## Source issues

- **Error** in FF17 at Lemma 1.7.2 and Proposition 1.7.3, printed pp. 80 and 82: the Gauss-norm comparison is printed as an equality |ι(f)|_ρ = ‖f‖_ρ̌ with ρ̌=q^(−1/r); on f=π the sides are q^(−r) and q^(−1); it should be ‖f‖_ρ̌^r; affects a stated result.
- **Error** in FF17 at Proposition 1.7.3, printed p. 82: stated for the Frobenius lift (1+X)^q−1 with arbitrary q, the proof factors [ε]−1 as the backward orbit of u_ε, which is primitive of degree one only when that polynomial is Lubin–Tate for E, i.e. q=p and E=ℚ_p; for q≠p the slopes are the p-typical ones and the threshold q^(−q/(q−1)) is unsupported; it should be restricted to E=ℚ_p (the README's §1.9 treats the general case as a target); affects a stated result.
- **Error** in FF17 at §1.7.5, printed p. 84: B_I is described as sums with coefficients in W_OE(k) and a filter limit condition; π^(−1) lies in B_I and is excluded; it should allow coefficients in W_OE(k)[1/π] with π-adic valuation bounded below on each threshold set; affects a stated result.
- **Error** in FF17 at Theorem 6.4.4, printed p. 254: the ideal of x∈A with φ^n(x)∈y_1⋯y_d for all n≥0 is said to be generated by Π⁻(a_1)⋯Π⁻(a_d); that product has divisor Σ_{n<0} and does not lie in y_i; it should be generated by φ(Π⁻(a_1)⋯Π⁻(a_d)) (or the condition should read n≥1); affects a stated result.
- **Misprint** in FF17 at proof of Proposition 2.3.16, printed p. 120: the displayed inequality |v_{y1}(f)−v_{y2}(f)| ≥ d(y1,y2) is false for f=1; the intended fact is min(v_{y1}(f),δ)=min(v_{y2}(f),δ) from Proposition 2.3.2; affects the proof.
- **Gap** in FF17 at the conclusion of §11.2.4 after Proposition 11.2.18, printed pp. 376–377: descent of bundles is asserted for every interval I⊂[0,1) from the compact case with endpoints in |F|; for an irrational endpoint or singleton those compact subintervals are not cofinal; it should add the arbitrary-compact base-change estimate; affects the proof.
- **Gap** in FF17 at Préface §1.4, printed p. 9: it is said that for a maximally complete C^♭ the automorphism group acts transitively on m_{C^♭}; norm-preserving automorphisms cannot move elements of different norm, so continuous automorphisms rescaling the valuation are meant; affects nothing (heuristic remark).

## Adversarial pass (table)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Suggested.lean norm hypothesis | x=t,y=1; reversed direction; k=𝔽_p(u) imperfect | v(t)=ofAdd(−1)<v(1)=1 so ‖t‖<1; reversed: ‖(1+t)−1‖=‖t‖>1=max, not ultrametric; C_k=C_{k̄} | correct direction; imperfect k covered | none |
| Suggested.lean conclusion | f=id; trivial-norm K | id surjective (excluded by ¬Surjective); trivial norm excluded by ‖t‖<‖1‖ | sound | none |
| §0.2 N_k(πx)=N_{k−1}(x) | x=[a]π², k=1; k=0 | coefficient k of πx is x_{k−1}; N_1(πx)=N_0(x)=0 | holds | none |
| §0.2 v_r(φx)=q v_{r/q}(x) | q=2,v(a)=3,x=[a]π²,r=2 | left 6+4=10; right 2(3+2)=10 | holds | none |
| §0.4 transform sign | π−[a], v(a)=2, r=1,3; [a]π², r<0 | min(r,2)=1,2; monomial −∞ for r<0 | holds | none |
| §0.5 product | slopes 2,5 | v_1=2,v_3=5,v_6=7; drops 1 at 2 and 5 | holds | none |
| §0.7 multiplicity | (π−[a])², v(a)=2 | ∂_left=2, ∂_right=0 at r=2 | 2 | none |
| §0.8 uniform bound | v_r=min(5r,11.2−3r) on [0.5,1.5] | 2.5, 6.7, max 7 at r=1.4 | holds | none |
| §0.9 rank-two values | π^n; [a]π², v(a)=3 | (nr,±n); (3+2r,±2) | holds | none |
| §0.10 norm of π | e=2,q=2 | 2^(−2) vs 2^(−1) | square | none |
| §1.5 route inequality | x∈A[1/π], r′≤r | v_{r′}−(r′/r)v_r = v_F(x_n)(1−r′/r)≥0 | holds | none |
| §1.6 positivity | π^(−1); [a]^(−1), v(a)=2 | |π^(−1)|_1=1; |[a^(−1)]|_1=q²>1 | holds | none |
| §1.8 norm power | q=2,r=2 on X and π | ‖X‖²=1/2=|T|_ρ; ‖π‖²=1/4=|π|_ρ | holds; source lacks power | source issue |
| §1.9 carries | p=2,e=2 | faces (0,1),(2,1/2),(4,1/4): slopes 1/4,1/8, length 2; Σ_m (p−1)/p^m=1=v(t) at e=1 | holds | none |
| §1.11 norms | q=2,ρ=1/2: π^(−1), T; a_n=π^(−n²); π^nT^(−n) | 2; 1/2; 2^(n²−n)→∞; (qρ)^n | holds | none |
| §1.12 bivector growth | v(a_{−m})=q^(2m); m² | q^(−m)v→∞; →0 | holds | none |
| §1.14 k⊂O_F | nonzero x∈k | x^(−1)∈O_F so |x|=1 | trivial valuation | none |
| §2.1 coordinatewise addition | p=2, (1,−1,i,…) | sum (2,−2,…): (−2)²=4≠2 | fails as claimed | none |
| §2.6 division | E=𝔽_q((π)), a=π−c, b=π² | (π+c)(π−c)+c²=π² | holds | none |
| §2.7 normalization | y=(π−c), v(c)=2 | v_y(π)=2, |π|_y=q^(−2)≠q^(−1) | holds | none |
| §2.10 u_ε, norm | Q=2X+X², p=2; v(ε)=4 | u=2+[ε^(1/2)]_Q=1+[(1+ε)^(1/2)]; ‖ε‖=1/4, ‖πε‖=1/8 | holds (FF 2.3.7, line 4820) | none |
| §2.12 source inequality | f=1 | printed |0−0|≥q^(−δ) false; README's 0≥δ also false | refuted; misquoted | R13 |
| §3.2 evaluation | f=π+[b], v(b)=3 at y, v(a)=2 | v=min(2,3)=2 | holds | none |
| §4.1 trace | degree-p separable, char p | Tr(1)=0 | averaging invalid | none |
| §4.3 cocycle norm | |a|_ρ=1/4, numerator 1/8 | ratio 1/2 | holds | none |
| §4.6 radius | d=2, |a_0|=q^(−6) | ‖y‖=q^(−3), slope 3 | holds | none |
| §4.8 bound | s=2^(−8), ρ=1/4, d=1,100 | ours max(1/16,1/64)=1/16; FF's (√s/ρ)^d=(1/16)^d | both converge | R05 |
| §5.1/§5.3 field case | F=ℂ_p^♭, I={p^(−√2)} | |F×|=p^ℚ, no point, (0) maximal | holds | none |
| §6.2 twist | φ(u)π=uπ′, φ(x)=π^d x | φ(u^d x)=π′^d u^d x | holds | none |
| §6.6 ratio | b∈M_d | φ(Π₊)=∏_{n≥1}φ^n(b)/π^d=π^dΠ₊/b | holds | none |
| §6.7 divisor of Π⁻ | φ(D)=[y]+D, locally finite near 0 | c_n=0 (n≥0), c_n=1 (n<0) | Σ_{n<0} | none |
| §6.11 ideal generator | one point | condition n≥0 ⇔ div x ≥ Σ_{n≤0}; div φ(Π⁻)=Σ_{n≤0} | README right, FF 6.4.4 shifted | source issue |
| §6.11 t=0 rejection | K_y, c=√π | (cT)²=T·(πT), c∉E | target monoid not free | none |
| §7.6 Eisenstein at p=2 | X²+πX+π | derivative π≠0 | separable | none |
| §8.2 index pieces | ρ=1/4,1/2 | |π|=ρ; |π^(−1)|=4,2 | directions right | none |
| §8.4 flatness | K[ε]/(ε²)→K | Tor_1(K,K)≠0 | not flat | none |
| §8.8 conjugation | Z=diag(T,T^(−1)) | ZE₂₁Z^(−1)=T^(−2)E₂₁ | holds | none |
| §9.3 descent | σ(e)=[σc/c]e | fe fixed ⇔ σ(f[c])=f[c] | B_{F,I}[c]^(−1)e | none |
| §10.1 window | ρ₂=1/2,q=2 | 1/4≤(1/2)² | meets every orbit | none |
| §10.6 degree | Φ(e)=π^(−1)e | deg=−v_π(π^(−1))=1 | agrees with O(1) | none |
| §10.8 approximant | |b|=1/4 | π/[b] vs π[b]: factor 16 | holds | none |
| §11.2 d_n | p=2 | d=3,7,17,39; d_{n+1}−2d_n=2n−1; d_n/2^n→3; all odd | meets KT (a)–(c) (KT's own example is 3,9,23) | none |
| §11.3 topological invariant | K from KT 1.3 | closure of ℚ̄_p is ℂ_p in ℂ_p, proper in K | holds (KT line 210–212) | none |
| §11.5 extension | x=t,y=t², ℤ[1/p] p odd | s=2, v(σ(t^(1/2)))=1; 1/2∉ℤ[1/p] scaling | needs divisible group | none |
| §11.5 valuation on 𝔽̄_p(x) | Σa_i x^i | distinct term valuations i·v(x) | v=v(x)·ord_x | none |
| VB−1 radius dictionary | x=[a]π^n, |a|=q^(−v) | VB: q^(−(n+ρv)); ours q^(−(v+nr)) | ρ_VB=1/r; point actions inverse | R07 |
| Degree-d local ring | y of degree 2 over F | not a marked untilt of F (K_y^♭ of degree 2) | VB−1 supplies degree one only | R02 |

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4ed8f9d", "job": "RT-RelativeFarguesFontainePartII~1b", "model": "fable", "worker": "fable-rt218"} -->

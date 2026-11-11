# Review of AdicSpacesPartV (pull request #2133 at a70c9f5)

**Verdict:** accepted

Incremental re-review of the 11 lines of `TauCetiRoadmap/AdicSpacesPartV/README.md` changed since `5aa51b7`. No finding. `Suggested.lean` is unchanged.

## Previous findings

- R01 — repaired: README line 744 now reads "For a finite injective homomorphism A → B of K-affinoid algebras with B an integral domain, the induced map Spa(B, B°) → Spa(A, A°) sends Shilov points to Shilov points", with a route and a new Check (line 757).
- R02 — repaired: line 918 reads "the resolution of T_red composed with the closed immersion T_red → T, which is a bijection on underlying points, is a proper surjection onto T"; the route at line 922 uses "Surjectivity:", "Connectedness:", "by the density just proved".

Neither repair introduces a new problem; the checks are below.

## Verified sound

**The changed passages (4).**

- *Line 744, the finite-map property and its route.* Each step checked. (a) Ã → B̃ is finite: RigidAnalyticGeometry §2.3 on main (README line 369, "A finite affinoid map induces a finite map on canonical reductions"). (b) Injective: A → B finite injective gives lying over, so every classical point of A lifts and `|a|sup` computed in A equals that in B (RigidAnalyticGeometry §2.1, line 306, "integral injective ones preserve them"); hence A° = A ∩ B°, A°° = A ∩ B°°. (c) A is a domain as a subring of B; with a finite injective K⟨T₁,…,T_d⟩ → A (RigidAnalyticGeometry §1.2, line 207), for g in the Tate algebra with Gauss norm 1 and f with minimal polynomial Xⁿ + Σ aᵢXⁿ⁻ⁱ, the element gf has minimal polynomial Xⁿ + Σ gⁱaᵢXⁿ⁻ⁱ and supremum max |gⁱaᵢ|^(1/i) = max |aᵢ|^(1/i) (§2.1, line 309, the minimal-equation equality), so ḡ is a nonzerodivisor on Ã and on B̃. (d) A minimal prime of B̃ is an associated prime of a torsion-free K̃[T]-module, so it lies over (0); its contraction q to Ã lies over (0), and a prime strictly inside q would also lie over (0), contradicting incomparability for the integral extension K̃[T] ⊆ Ã. (e) Compatibility of sp with the map is the fourth API bullet of §4.1 (line 696); the image of a rank-one point is rank one because its valuation is nontrivial on K. The statement is true as written.
- *Line 748, `*Needs:*`.* RigidAnalyticGeometry §§1.1–1.2 and 2.3 exist on main (headings at lines 177, 205, 355). The §2.1 inputs of steps (b) and (c) are reached through §4.1, which this line lists and whose own `*Needs:*` (line 701) lists RigidAnalyticGeometry §§2.1–2.2. The dependency check is unchanged: 0 problems.
- *Line 757, the new Check.* Computed in the table below; all three instances are as stated, and the two negative controls are the witnesses of the previous R01.
- *Line 224.* "K-affinoid algebra that is an integral domain of Krull dimension d": for such A every maximal ideal has height d (Noether normalization), an affinoid subdomain has the same completed local rings at its classical points, so every nonempty affinoid open has dimension d and dim_x X = d at every point. The wording no longer collides with "affinoid domain" in the sense of line 14.
- *Lines 918 and 922.* Checked on the node and the double point (table). The statement now attributes bijectivity to T_red → T only, consistent with the Check at line 929 (two points over the origin). The route's three labels match the three assertions of the statement, and "the density just proved" refers to the sentence before it.

**Seeded sample, where it falls in the changed passages.** §0.2: BH22 line 332 (Proposition 2.9(2), p. 8: transcendence degree of the secondary residue field equals dim_x X; the notion is used there, not defined, as the README says). §4.3: BH22 line 310 (Definition 2.4, p. 7) and line 235 (Proposition 2.2, pp. 6–7; page markers at lines 224 and 272). The remaining sampled targets (§§0.1, 0.4, 0.5, 1.1, 1.2, 1.3, 2.3, 2.4, 3.3, 4.2, 4.4, 4.7, 5.3) lie in text the diff does not touch; the README flags no locator as unverified.

**Gate, dependency check, Lean.** Gate rerun at this head: every scanner 0, ending `outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0 OK`. Dependency check output: `depcheck: 235 roadmaps, 2133 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. `lake env lean` on `Suggested.lean`: three `declaration uses sorry` warnings (lines 76, 97, 131), nothing else. The file is byte-identical to the one the previous review read, so its `#check @` comparison, the one-tactic probe (15 attempts, 15 failures) and the headline list (three stated, four named in the module docstring as not statable with their missing carriers) stand as recorded there. `git diff --stat origin/main...HEAD` outside the folder is empty. `scratch/overlaps.md`: no other pull request changes this folder, no cited id is dropped, no id is defined only by an open revision. `scratch/citations.md`: the four names it lists are the AdicSpacesPartIII supplier names resolved in the previous report; the diff adds no backticked name.

**Pull request description.** Read against the head: its claims about the folder, the five supplier gaps, the dependencies and the merge-order block are unaffected by the 11 changed lines.

**Cross-roadmap citations resolved for this round (3).** RigidAnalyticGeometry §1.2 (line 205), §2.1 (line 297), §2.3 (line 355), on main.

**Adversarial table.** Rows 1–3 are the changed statements, with values computed in this round. The remaining rows are carried from the previous report (PRREVIEW-AdicSpacesPartV~3, at `5aa51b7`), whose statements the diff leaves untouched.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §4.3 finite-map Shilov property, lines 744 and 757 | T ↦ T² on K⟨T⟩ (also residue characteristic 2); K⟨T⟩ → K, T ↦ 0; K⟨T⟩ → K⟨T⟩ × K, T ↦ (T, 0); K → L finite | First: reductions K̃[T] → K̃[T], T ↦ T², finite injective; Gauss norm of f(T²) equals that of f, so Gauss ↦ Gauss; (0) contracts to (0). Second: not injective; the minimal prime (0) of K̃ contracts to (T), a closed point. Third: injective, target not a domain; the minimal prime K̃[T] × 0 contracts to (T). Fourth: (0) ↦ (0), point ↦ point | true; both hypotheses needed |
| §0.2 Check, line 224 | K⟨T⟩ (d = 1) at the Gauss point and at T = 0; K × K⟨T⟩ | First: every nonempty affinoid open of the disc has dimension 1, so 1 = 1 at both. Second: not a domain, values 0 and 1 (the Check of line 223) | true; "integral domain" needed |
| §5.4 *resolution-consequences*, lines 918 and 922 | XY = 0; K[ε]/(ε²); cusp; nodal cubic | First: T_red = T, resolution two discs, 2 points over the origin: surjective, not bijective, disconnected. Second: T_red → T bijective on the single point, Spa K → T surjective. Third: bijective. Fourth: connected | true as reworded |
| `gaussPoint_mem_closure_rationalPoints`, §3.4 | residue field infinite; 𝔽_q, q = 2, 3; n = 0 | g = T(T − 1): ḡ(ā) ≠ 0 for ā ∉ {0, 1}, then \|g(a)\| = 1. Over 𝔽_q: \|T^q − T\| = 1 at η and < 1 at every a ∈ K°. n = 0: one point | carried; `Infinite` needed for n ≥ 1 |
| `IsUnitGaussPoint` | π + T at η and at T = 0 | 1 = max(\|π\|, 1) at η; \|π\| at T = 0 | carried |
| `analytic_constantRank`, §6.1 | (x, y) ↦ (x, 0); x ↦ x² at 0; Tᵖ in characteristic p; m = n = k = 0 | rank 1, normal; rank 0 at 0 and 1 nearby; rank 0 with value π^(np) ≠ 0 at πⁿ; empty coordinates | carried; `CharZero` needed |
| `analytic_germ_eq_zero_of_subfield`, §6.6 | Σ c_n zⁿ zero on pᵏℤ_p; z(z − a), a ∉ E; m = 0; zᵖ over 𝔽_p((t)) | c_k = lim f(t)/tᵏ = 0; zero at 0 only; f(0) = 0; value t^(kp) ≠ 0 | carried |
| §0.5 *affinoid-localization-regular* | K⟨T⟩ → K⟨T, T⁻¹⟩ at (T − 1); K⟨T⟩ → K; K → K(a^(1/p)) | completions K[[T − 1]]; T-torsion, not flat; fibre K(a^(1/p))[ε]/(εᵖ) | carried |
| §1.1 *rigid-normalization* | cusp; K⟨T⟩/(T²); XY = 0; origin → XY = 0 | K⟨t⟩ with t² ∈ A; K; two discs, 2 points over the origin; 2 lifts | carried |
| §1.2 *normalization-characterisation* | cusp map; one axis ↪ XY = 0; X ⊔ Spa K → X | Z = {0}, true; Z contains the other axis, false; f⁻¹(Z) contains an open point, false | carried |
| §1.3 *connected-components* | K × K; ∅; XY = 0; countably many discs | 2; 0; 1; an affinoid meets finitely many | carried |
| §1.4 *irreducible-components* | XY = 0; nodal cubic; two discs; ∅ | 2, 1, 2, 0 components of X^ν | carried |
| §1.5 *irreducibility-criterion* | XY = 0; disc; Spa K[ε]/(ε²) | all false; all true; all true | carried |
| §1.6 *full-dimensional-closed-subset* | V(T) in the disc; two discs; V(XY) in the bidisc | 0 < 1; 1 = 1 and Y is the component; 1 < 2 | carried |
| §1.8 *dense-open-connected* | punctured disc; nodal cubic minus node; XY = 0 minus origin | 1, 1, 2 components | carried |
| §2.4 *singular-stratification* | cusp; plane ∪ line; K(a^(1/p)) | 2 strata ≤ d + 1; Y₁ a point; regular, Ω of rank 1, not smooth | carried |
| §3.3 *polydisc-points-topology* | ℤ_p in the disc; n = 0 | \|a² − p\| ∈ {1, \|p\|}; \|aᵖ − a\| < 1 against 1 at η; one point | carried |
| §4.5 *abhyankar-bound* | Gauss point of Dⁿ; classical point; irrational radius; Spa L | n ≤ n; 0 ≤ n; 0 ≤ 1; 0 ≤ 0 | carried |
| §4.7 *weakly-shilov-avoid-nowhere-dense* | V(T) in the disc; isolated point of Spa(K⟨T⟩ × K); V(Y) in XY = 0 | 0 ≠ 1; weakly Shilov and open; contains the Gauss point of its axis | carried |
| §5.1 *rigid-blow-up* | disc at (T); zero ideal; unit ideal; K⟨x,y⟩/(y², xy) at (x, y) | isomorphism; ∅; X; x-chart K⟨x⟩, y-chart 0 | carried |
| §5.2 hypersequence | y² = x^(2n+1) | n steps, 0 for n = 0 | carried |
| §6.4 *algebraic-point-atlas* | G_m over ℝ ⊆ ℂ; GL₂; μ₃ over ℝ | derivative of inversion −1; \|det g − 1\| < 9/32; 1 real and 3 complex points | carried |
| Inversion contract | T + T² | (T − T² + 2T³) + (T − T² + 2T³)² = T + O(T⁴) | carried |
| `gap:countable-resolution-invariants` | README line 140 against the plan | "resolution functor" against "reduced resolution functor"; §7.5 on main is one functor | carried; README correct |

**Remark on untouched text (no change requested).** Line 215 still writes "Each remaining A/p_i is an affinoid domain" for an affinoid algebra that is an integral domain; the meaning is fixed there by the quotient by a prime.

**Declared gaps.** The five slugs and their sentences are untouched by the diff; this acceptance is conditional on them as declared.

## Not verifiable

- SCHNEIDER11, BARTENWERFER76 and LUTKEBOHMERT74 are recorded as uncertified and were not read; none is cited in a changed passage.
- BGR 3.8.1/7, 6.2.2 and 6.3.4–6.3.5, on which steps (a)–(c) of the §4.3 route rest, were checked through their statements in RigidAnalyticGeometry §§2.1 and 2.3 on main, not in the book.

## Source issues

- none

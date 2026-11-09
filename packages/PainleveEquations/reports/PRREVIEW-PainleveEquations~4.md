# Review of PainleveEquations (pull request #1955 at 693f9f7)

**Verdict:** accepted

This is an incremental re-review of the 27 lines changed since 2995b1c (README only; `Suggested.lean` is unchanged). The three findings of the previous review are repaired, the repairs introduced no new problem, and the gate passes. No finding remains.

## Previous findings

- R01 — repaired: README line 89 now declares `gap:relative-hilbert-mumford` to AlgebraicModuliForArithmeticGeometry, in the intake's shape, for a projective G-equivariant X→X₀ with X₀ affine of finite type, G affine linearly reductive and ℒ relatively ample: semistable iff the limiting-fibre weight is ≥ 0 for every one-parameter subgroup with a limit, stable iff > 0 for every nontrivial one. The "reuse `gap:reductive-character-git` where applicable" sentence is gone. The *Needs* of §§1.3, 4.2, 4.3 and 4.4 (lines 543, 1041, 1079, 1101) cite `[Reductive GIT](#supplier-reductive-git)`. §4.3 line 1053 now applies the criterion by name.
- R02 — repaired: line 861 states the computed value (trace-free horizontal endomorphisms on the cover w²=z form the one-dimensional diagonal; the deck involution negates it, so the descended space is zero) and line 862 states h⁰ = h² = 0, h¹ = 2 for a stable fixed-determinant PVI object and h¹ = 6 with varying residue eigenvalues. The duplicate dq ∧ dp test is gone from §3.6.
- R03 — repaired: line 1086 reads "Use ComplexComparisonPartII §C−1.1 to analytify the projective quotient morphism, obtain its analytic properness … Use §C−1.2 to analytify locally separated algebraic-space presentations through their étale relations", and the *Needs* on line 1101 cite "§§C−1.1–C−1.2".

## Verified sound

**Gate, order and build.**
- The worker's gate passed at 693f9f7. I reran it with `--order` set to the candidate merge order: every scanner is 0, `depcheck=0`, `source-material=0`, OK.
- `gate --depcheck … --order merge-order-candidate.txt --movable` prints `depcheck: 236 roadmaps, 2269 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. In the candidate order AlgebraicModuliForArithmeticGeometry is at 34, ComplexComparisonPartII at 39, FormalConnectionsOpers at 40 and PainleveEquations at 41, so both suppliers named by the changed text are earlier.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Lean.** `Suggested.lean` is byte-for-byte the file the previous review read. `lake env lean` at the pins gives exactly six `sorry` warnings (lines 26, 33, 40, 54, 64, 78) and nothing else. The elaborated signatures of all six theorems are those recorded last round; no binder lost. The one-tactic probe (`simp_all` on every statement) and the headline inventory from the previous review stand unchanged, so I did not repeat them.

**The new gap (`gap:relative-hilbert-mumford`, line 89), checked against GHH15 (arXiv 1404.7267v4).**
- GHH15 line 364–378 (Theorem 3.3): X → S projective, S = Spec A noetherian affine, G affine linearly reductive acting equivariantly, ℒ an ample G-linearized invertible sheaf; a geometric point is stable iff μ > 0 for every nontrivial one-parameter subgroup, semistable iff μ ≥ 0 for every one; over a finite-type S it suffices to test subgroups defined over the point's field. GHH15 line 68–73 (Corollary 1.1) is the finite-type, algebraically closed, closed-point form the README states. GHH15 line 263–264: over affine S, ample equals relatively ample, so "relatively ample" is the right hypothesis. GHH15 line 379–384: a subgroup without a limit has μ = ∞ and may be ignored, which is the README's "for every one-parameter subgroup with a limit in X".
- Sign convention. GHH15 line 358–360 (Definition 3.1) sets μ = −(weight on the fibre L(p₀)), and GHH15 line 599–601 identifies that L with V(𝒪(1)), the geometric line bundle in the contravariant convention of GHH15 line 148–152 (§1.1: sections of V(F) are F^∨). GHH15 line 605–607 and 704–705 confirm μ = −r with r the weight on the cone lift, i.e. on the geometric fibre. The README's weight (line 91: the exponent on the fibre of the invertible sheaf ℒ, "minus the weight on its dual"; line 1073: "weights on the linearized sheaf itself") is therefore μ itself, so "semistable iff ≥ 0, stable iff > 0" is GHH15's criterion exactly. Independent check on SL₂ acting on ℙ¹ with 𝒪(1): λ = diag(t^(−a), t^a), point [e₂] fixed, sheaf fibre e₂^∨ has weight −a < 0, so [e₂] is unstable, as it must be (ℙ¹ has no SL₂-semistable point).
- Finite stabilizers: GHH15 line 318–330 (Proposition 2.7, quoted from GIT Amplification 1.11 with "properly stable") makes stability require a finite stabilizer, as line 91 says. Projectivity: GHH15 line 256–262 (Proposition 2.6): Y ≅ Proj T^G and Y relatively projective over Spec A^G, as the GHH15 reference entry (line 1743) says.
- The gap is precise (one criterion, hypotheses stated), minimal (no Hilbert–Mumford criterion at the pins; `roadmaps grep -i 'hilbert.mumford'` finds only `gap:reductive-character-git` in CountingBundlesAndHallAlgebrasOfCurves line 103 (characters of products of GLₙ on affine schemes), `gap:hilbert-mumford-linear` in QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups line 89 (linear actions on vector spaces), proof-route uses for specific actions in LanglandsParameterStacks line 647 and ArithmeticDynamics line 1667, and the out-of-scope line 117 of TensorProductCombinatorics on main), and declared in the README's supplier subsection in the intake's shape with the same supplier as `gap:reductive-connection-git`. No design/plan.json is readable on the board, so, as for the first gap last round, the declaration is checked in the README alone.
- The descent remark (line 91): a central subgroup acting trivially on X and ℒ would otherwise give a nontrivial one-parameter subgroup with a limit and weight 0, so no point could be stable; descending to the quotient group is the correct handling, and §1.3 (line 536) applies it to the GL framing group. In §4.3 the frame group is SL₂ × determinant-one tori × finite groups, whose centre is finite, so line 1055 ("finite scalar center") correctly needs no descent.

**§4.3 (lines 1051–1055) and its new Check (line 1073).**
- Limit test. For λ with global weights (−a, a), a > 0, a point [v] of the flag ℙ¹ has limit [e₁] (the weight-(−a) line) unless v ∈ W = [e₂], which is fixed: the Check's "in the latter case the limit is the weight-(−a) line" holds. Sheaf-fibre weights of 𝒪(1): −a at [e₂], +a at [e₁]; so 𝒪(KΔ) contributes −KaΔ when the incidence line is W and +KaΔ otherwise, as the Check says.
- Agreement with the §4.3 formula 2Ka(½ Σᵢⱼ β′ᵢⱼ − Σᵢ β′ᵢ(W)): at a logarithmic pole where W is the incidence line, β′ᵢ(W) = β′_high and the pole's share is 2Ka(½(β′_high + β′_low) − β′_high) = −KaΔ; otherwise +KaΔ. Both match the Check.
- Direction of the slope comparison: weight > 0 ⟺ Σᵢ β′ᵢ(W) < ½ Σᵢⱼ β′ᵢⱼ, which with deg W = −Σ Re λ(W) and βᵢⱼ = cᵢαᵢⱼ − Re λᵢⱼ is the strict parabolic slope inequality for the sub-line W; ≥ 0 is the weak one.
- Links. With trivial global part a local torus subgroup diag(t^b, t^(−b)) acts on an invertible link L by L·diag(t^(−b), t^b); a limit in the invertible locus forces b = 0, so "trivial local parts by the same links" holds. At a totally ramified pole the formal frame group is finite, so a one-parameter subgroup there is trivial, and a nontrivial global part moves the link without limit: no nontrivial subgroup has a limit, every point is stable, consistent with §4.4's "a totally ramified pole makes every Stokes object irreducible".
- Linear reductivity of SL₂ × tori × finite groups over ℂ holds (characteristic 0).

**§3.6 Checks (lines 861–862).** On the cover w²=z the pulled-back formal connection is diagonal with the two exponential factors exchanged by w ↦ −w; horizontal endomorphisms are the constant diagonal matrices (dimension 2), trace-free ones diag(c, −c) (dimension 1); the deck involution sends diag(c, −c) to diag(−c, c) = −diag(c, −c), so the invariants are 0. PVI: h¹ = 4·2 − 3 − 3 = 2 for a stable fixed-determinant object (h⁰ = h² = 0 by stability and duality); freeing the residue eigenvalues with the trace fixed adds one trace-free diagonal direction per pole, 2 + 4 = 6.

**§4.4 (line 1086) and ComplexComparisonPartII at the #848 head (db79c46).** Its README line 1072 (§C-1.1) states that analytification "carries finite and proper morphisms, respectively, to finite and proper analytic morphisms"; line 1114 (§C-1.2) constructs the analytification of a locally separated algebraic space of finite type over ℂ from an affine étale atlas and its scheme relation, with `analyticRelationLocalChart` the point where local separatedness is used. Both citations resolve as the text uses them.

**References.** MFK94 (line 1741): wording only; I23 Theorem 5.1 (SIGMA 19 (2023) 013, printed p. 21) is the existence of the relative coarse moduli space of α-stable connections with (λ, μ̄, ν̄)-structure, quasi-projective over the parameter scheme, proved through the GIT moduli of stable parabolic triples, so "the quotient construction used for the framed filtered connections in I23, Theorem 5.1" is right. GHH15 (line 1743): Proposition 2.6, Corollary 1.1, Theorem 3.3 and Definition 3.1 verified above; §1.1 is the convention section.

**Sampled targets.** Of the seeded sample, only 1.3, 3.5 (its §3.6 neighbour), 4.2–4.4 and 4.9's neighbours are touched by the diff; the changed passages are checked above. The other sampled targets (0.1, 0.4, 1.5, 1.6, 3.9, 3.10, 3.11, 4.1, 4.8, 4.9, 5.2) are untouched since the full review and the previous incremental reviews passed them; I did not re-read their sources.

**Declared gaps.** Two, both to AlgebraicModuliForArithmeticGeometry (lines 87 and 89), both one sentence in the intake's shape, both precise, neither provided by Mathlib, Tau Ceti, a roadmap on main or an earlier roadmap. Line 87 now says "G affine linearly reductive", which is the hypothesis of GHH15 Proposition 2.6.

**Overlaps.** No open pull request changes this roadmap, no cited id is dropped, no cited id exists only in an open revision (`scratch/overlaps.md`). Ownership of the Hilbert–Mumford criterion against open pull requests is checked above by object.

**Adversarial table.** Rows marked (r4) were computed this round for changed statements. Rows marked (r3) and (r2) are carried from the previous reports for untouched statements, with the values they recorded.

| Statement | Instances | Computed values (both sides) | Result | Change |
|---|---|---|---|---|
| (r4) Gap line 89, sign convention | SL₂ on ℙ¹, 𝒪(1), λ = diag(t^(−a),t^a), point [e₂] | README weight = sheaf-fibre weight = −a; GHH15 μ = −(geometric-fibre weight) = −(a) = −a; README "≥ 0" fails, GHH15 "μ ≥ 0" fails; ℙ¹ has no semistable point | agree | — |
| (r4) Gap line 89 vs GHH15 Theorem 3.3 / Corollary 1.1 | hypotheses side by side | X→X₀ projective, X₀ affine finite type, G affine linearly reductive, ℒ relatively ample (= ample over affine, GHH15 line 263); closed point, subgroups over ℂ; limit-only subgroups (μ = ∞ otherwise) | same statement | — |
| (r4) Line 91 finite stabilizers | GHH15 Proposition 2.7 | stable ⟺ finite stabilizer and closed orbit in X^ss | holds | — |
| (r4) Line 91 central descent | G = GL₂ with scalars acting trivially on X and ℒ | λ(t) = t·I: limit exists, weight 0, μ = 0 ≯ 0, no stable point; G/𝔾ₘ linearly reductive, criterion applies there | correct handling | — |
| (r4) §4.3 line 1053 limit test | λ global (−a,a); [v] with v₁ ≠ 0; v ∈ W | λ(t)v = t^(−a)v₁e₁ + t^a v₂e₂ → [e₁]; [e₂] fixed | matches Check line 1073 | — |
| (r4) Check line 1073 flag weights | 𝒪(KΔ), K > 0 | sheaf fibre at [e₂]: weight −a ⇒ −KaΔ; at [e₁]: +a ⇒ +KaΔ | holds | — |
| (r4) §4.3 weight formula at a logarithmic pole | W incidence line; W not | 2Ka(½(β′h+β′l) − β′h) = −KaΔ; 2Ka(½(β′h+β′l) − β′l) = +KaΔ | agrees with Check | — |
| (r4) §4.3 slope direction | rank 2, sub-line W | weight > 0 ⟺ Σβ′(W) < ½Σβ′ᵢⱼ ⟺ par-deg W < ½ par-deg E | stable ⟺ > 0 | — |
| (r4) §4.3 trivial-global subgroup | L invertible, λ_loc = diag(t^b,t^(−b)) | L·diag(t^(−b),t^b) has an invertible limit iff b = 0 | holds | — |
| (r4) §4.3 totally ramified pole | finite frame group | one-parameter subgroups into a finite group are trivial; nontrivial global part has no link limit; vacuous criterion ⇒ stable | consistent with §4.4 | — |
| (r4) §3.6 Check 2 | PI slope 5/2 on w²=z | horizontal End = constant diagonal (dim 2), trace-free dim 1; deck: diag(c,−c) ↦ −diag(c,−c), invariants 0 | holds | — |
| (r4) §3.6 Check 3 | stable fixed-det PVI; eigenvalues freed | 4·2−3−3 = 2; +1 per pole ⇒ 6 | holds | — |
| (r4) §4.4 line 1086 citations | ComplexComparisonPartII at db79c46 | line 1072: proper ↦ proper analytic; line 1114: locally separated algebraic spaces of finite type via étale atlas | resolve | — |
| (r4) MFK94 line 1741 / I23 Theorem 5.1 | SIGMA p. 21 | relative coarse moduli of α-stable connections, quasi-projective over T, via stable parabolic triples | holds | — |
| (r3) Lean PV with `hlift` | q = conj outside the closed ball | exp s₀ = t₀ in the ball; q∘exp analytic near s₀ | excluded | — |
| (r3) Lean PV constant solution | q ≡ −1, γ = 0, α = −β, δ = 1 | RHS = 0 = q″ | consistent | — |
| (r3) Lean PV lift choice | s₀, s₀ + 2πi | separate existentials; monodromy allowed | consistent | — |
| (r3) §3.2 Checks 2–3 | x ↦ 1−x; λ dz/z, z = x−t | (α,β,γ,δ) ↦ (α,−γ,−β,δ); curvature λ dt∧dx/(x−t)² ≠ 0 for the space-only form | hold | — |
| (r3) §3.6 Check 1 | stable rank 2, fixed det | Aut = {±I}; det((1+εa)I) = 1+2εa ⇒ a = 0 | holds | — |
| (r3) Gap line 87 | relative GIT | Proj ⊕Γ(X,ℒⁿ)^G projective over Spec Γ(X₀,𝒪)^G; X^s = X^ss ⇒ geometric quotient | true, precise | — |
| (r3) §1.5 Pic⁰ dimension and smoothness | proper flat curves | h¹ = 1−χ locally constant; R^q p_* = 0 for q ≥ 2 | hold | — |
| (r3) §5.1 universal functions | Y ∈ \|−K_S\|, S rational | H⁰(𝒪_Y) = ℂ, dim Pic⁰(Y) = 1 | holds | — |
| (r3) IS12 Theorem 6.3 | IS12 line 1849 | 5 unramified types, non-resonant irreducible | holds | — |
| (r2) Lean PIII/PV/PVI domains and cover | ball missing 0 (and 1); p constant | lifts exist; universal cover | consistent | — |
| (r2) 7.2 PVI dictionary; 7.4 sigma forms; D₇, D₈; PIV, PV, PIII(D₆) | as recorded in r2 | parameter dictionaries and Δ formulas as recorded | hold | — |
| (r2) 7.2 PV elimination | (t,q,p,θ₀,θ₁,θ∞) = (1,2,0,0,1,1) | system gives 2; printed VDPS09 (3) gives 7/2 | README right | source issue (r2) |
| (r2) 7.2 Flaschka–Newell, PI scaling; 7.4 affine branches | c³ = 2; c⁵ = 2; σ = t+2, σ ≡ 0 | PII with α = a − ½; residual 2 + t/2 | hold | — |
| (r2) 1.5/3.7 dimensions; 1.6 unfolding; 3.3/3.4 counts; 3.8 Checks | as recorded in r2 | 2, 4, 2, 4; z² at h = 0; 17 and 10; monodromy −I | hold | — |
| (r2) 4.3/4.4 index, PV split example, PVI cubic; 4.7–6.3 Checks; 0.3–0.8 Checks | as recorded in r2 | 8−4−2 = 2; degree −1 lines; non-square discriminant; the recorded values | hold | — |

## Not verifiable

- **MFK94** (Springer, paywalled), **GR84** and **JK94**: not read; MFK94's entry changed in wording only, and the locator it couples to (I23 Theorem 5.1) was read in the open SIGMA text.
- The journal pagination of GHH15 (Manuscripta Math. 148 (2015), 283–301) is behind Springer's paywall; the arXiv v4 text was read, and its numbering (Corollary 1.1, Proposition 2.6, Proposition 2.7, Definition 3.1, Theorem 3.3) is the numbering the README cites.
- The I23 SIGMA PDF has no text layer beyond its first page on this worker (no OCR available); pages 19–21 were rendered and read as images.

## Source issues

- none

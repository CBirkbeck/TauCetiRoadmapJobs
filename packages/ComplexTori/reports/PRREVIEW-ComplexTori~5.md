# Review of ComplexTori (pull request #2550 at 6916a61)
**Verdict:** accepted

**Summary.** Accepted, with no findings. This was a full review of the head that restores the milestones and items of the roadmap on main: every item of Milestones 1–6 is kept under its id with its statement, the 137 declarations named on the *In Tau Ceti:* lines exist at the pin, and every Check, worked example and formula was recomputed and holds (the cyclic correction, the sign of the gauge, the normal and canonical characters, the connecting class, the image `λ/m` of the meridian). There is one small correction, a claim in the module docstring of `Suggested.lean` that the pinned Tau Ceti lacks open gluing of complex manifolds, which it has, and two format notes carried over from the previous review; none blocks. The two paywalled textbooks are left to the human reviewers.

## C01 — The module docstring of `Suggested.lean` says that open gluing of complex manifolds is not available at the pins, but the pinned Tau Ceti has it

The last bullet of the docstring (lines 71–73) reads "they need `Q` and open gluing of complex manifolds, which is not a carrier at the pins". An implementer of §6.4 who reads this would build a gluing construction that exists already. At the pin, `TauCeti/Geometry/Manifold/Gluing/GlueData.lean` declares `TopCat.GlueData.chartedSpace` (line 84), `TopCat.GlueData.IsCompatible` (line 103) and `TopCat.GlueData.IsCompatible.isManifold` (line 155) over any nontrivially normed field, and its module docstring says that for `𝕜 = ℂ` this glues complex manifolds along holomorphic transitions; `TauCeti/Geometry/Manifold/Gluing/Map.lean` adds the universal property for maps.

The headline stays not statable, because `Q` is missing: the rotated disc carries no atlas at the pin, as the second bullet says. The smallest change is to drop the gluing clause, "they need `Q` above". The description of the pull request repeats the claim in its list of what the pins lack ("open gluing") and would drop that item too. The author may also wish to name `TopCat.GlueData.IsCompatible.isManifold` beside ComplexManifolds Milestones 5–6 on the *Needs:* line of §6.4.

## N01 — Convention 2 and the overview give `Y` as Hausdorff and second countable, while §2.3, the supplier contract and the Lean theorem assume Hausdorff and locally compact

The overview (line 8) and Convention 2 (line 70) against §2.3 (line 267), the Tau Ceti contract (line 941) and the binders `[T2Space Y] [LocallyCompactSpace Y]` of `Suggested.lean`. Adding local compactness to Convention 2 (automatic for a finite-dimensional model) would align them. Carried over from the previous review.

## N02 — The module docstring of `Suggested.lean` describes §6.6 as the fundamental group of the reglued manifold, which §6.6 does not compute

Lines 71–72 read "the reglued manifold, its independence of choices and its fundamental group and first homology". §6.6 states `π₁(Q) = H₁(Q)` and the map `π₁(Y*) → π₁(Q)`. Would "and the maps on `π₁` and `H₁` of the quotient and the collar" serve? Carried over from the previous review.

## Previous findings

The previous review, of `88225db`, had no findings. Its two format notes:

- N01 — not repaired: Convention 2 still reads "with `[T2Space Y]` and `[SecondCountableTopology Y]` stated explicitly"; repeated above as N01.
- N02 — not repaired: the docstring still reads "its fundamental group and first homology (Milestone 6, §§6.4–6.6)"; repeated above as N02.

The roadmap as a record, compared with the README at the merge base `1b7b481` item by item: Milestone 1 items 1–4 are §§1.1–1.4; Milestone 2 items 1–5 are §§2.1–2.5; Milestone 3 items 1–5 are §§3.1–3.5 and its regression test is the Check of §3.3; Milestone 4 items 1–6 are §§4.1–4.6, with the two subheadings named in "How to read the build" (line 56) and in the introduction of Milestone 4, so the citations "Milestone 4 / Torus-level affine algebra" (GeometryOfNumbersAndQuadraticArithmetic, line 3121) and "Milestone 4, Integral connecting class, step 6" (AbelianSchemesAndArithmeticModuli, line 2092) still resolve; Milestone 5 items 1–5 are §§5.1–5.5; Milestone 6 items 1–6 are §§6.1–6.6 and its worked involution is the first example of Milestone 6. No milestone or item is removed, no id changes subject, and no completed item is reduced to a declaration name.

## Verified sound

| Statement | Instances tried | Values computed (text / computed) | Result | Change |
|---|---|---|---|---|
| §1.1 quotient, Checks | `L = ℤ ⊂ ℂ`; `L = ℤ + √2ℤ + iℤ` | not a lattice, `ℂ/ℤ ≅ ℂ∖{0}` / same via `exp(2πiz)`; spans, dense in `ℝ` direction, quotient not Hausdorff | true | none |
| §1.2 Lie group | pinned `Module.Basis.orbitRelQuotientLatticeEquiv` | `E/L ≃ₜ+ UnitAddTorus ι` / README "`(ℝ/ℤ)^d` as a topological group" | agrees | none |
| §1.3 kernel and components | `f(z,w)=2z`; `f(z)=(z,0)`; `e=2` on `ℂ/ℤ[i]` | `(ℤ/2)²`, 4 components / `ℤ[i]/2ℤ[i]`; `0` vs `L'/f(L)≅ℤ[i]`; kernel order 4, `e(L)=2ℤ[i]≠L'` | true | none |
| §1.3 general component formula | `f(L) ⊄ L'` | `f⁻¹(L')/((L∩f⁻¹L')+ker f) ≅ (L'∩range f)/(L'∩f(L))` via `f` / same | true | none |
| §1.4 homology, Check | `α = 1+i` on `ℂ/ℤ[i]` | `H₂` degree 2 / real determinant `|α|² = 2`; ranks 1, 2, 1 | true | none |
| §2.3 headline (Lean) | `U = ∅`; `E = 0`; constant periods `g = 1`; `ℍ`, `Π(τ)(a,b)=a+bτ` | inverse `[y,v] ↦ (y,[g(y)⁻¹v])` well defined; `g(τ)·1 = 1` forces `τ = τ₀`, hypothesis fails off a point | true; Lean = README | none |
| §2.4 topology and base change | pinned `torusFamilyBaseChangeHomeomorph`, `contMDiff_torusFamilyBaseChange_iff` | homeomorphism onto `{(z,x) : p(x) = f(z)}`; iff on projection and base-change composite / README the same | agrees | none |
| §2.5 marking, Check | `τ = i`, multiplication by `i` | `(0,−1; 1,0)` / `i·1 = i ↦ (0,1)`, `i·i = −1 ↦ (−1,0)` | true | none |
| §3.1 linear constructor | normalising law; pinned `isCancelSMul_torusFamilyLinearMulAction_iff` | `g·(λ+ᵥx) = (gy, R_g(y)v + Π(gy)ρ(g)λ)`; free on total space iff free on `Y` | true | none |
| §3.2 affine constructor | composite `g·(h·[y,v])` | `R_g(hy)(R_h(y)v + b_h(y)) + b_g(hy)` / cocycle law of the text | true | none |
| §3.3 Check, §3.4 Check | `(z,x) ↦ (−z, x+½)`; `Γ=ℤ`, `R_n = iⁿ` | `(1−A)T = 0 ∌ ½`, free; transport `ρ(−1) = −i ≠ i` | true | none |
| §4.2 period, exact order | `t=⅓, m=2`; `t=½, m=4`; pinned `affineEquiv_pow_eq_one_iff` | `N₂=⅔≠0`; `N₄=2=0`, `N₂=1=0`, exact order 2; `f^m=1 ↔ A^m=1 ∧ N_m(t)=0` | true | none |
| §4.3 conjugacy and `H¹` | `A=−1`, `A=1`, `m=2`; `ZMod 2`, `σ=id` | `τ_b f τ_b⁻¹: t ↦ t+(b−Ab)` (pinned `conj_addRight_affineEquiv`); `H¹=0`; `T[2]≅(ℤ/2)²`; `id+σ=0` | true | none |
| §4.4 Check | `A=diag(1,i)`, `t=(½,0)`, `m=4` | generator: `(1−A)T = 0×T ∌ t`; square `(x₁,−x₂)` fixes `(x₁,0)` | faithful, not free | none |
| §4.5 connecting class | `m=3`, `t=⅓`; `A=−1`, `m=2`; `v/m` | `[1] ≠ [−1]` in `ℤ[i]/3`; `Λ^A=0`; `m·N(w)=N(v)=mv ⇒ N(w)=v` | true | none |
| §4.6 trivial action | `Λ=ℤ[i]`, `m=2` | `|T[2]| = |Λ/2Λ| = 4`, three points of exact order 2; pinned `groupCohomologyEvenEquivQuotSMulTop` lands in `QuotSMulTop m` | true | none |
| §5.1 total action | `R_ζ(0)=1` | `N_k(t)=kt`, `range(1−A^k)=0`: free iff `kt≠0` for `0<k<m` iff `addOrderOf = m` / pinned statement | true | none |
| §5.2 quotient | pinned `rootsOfUnityBallQuotientHomeomorph` | ball of radius `r` mod `μ_m` ≃ ball of radius `r^m` / README `D_t = {‖t‖<r^m}` | agrees | none |
| §5.4–5.5 characters | `m=2`, translation; `det A_E=−1` | `dg(∂_z)=ζ∂_z`: `N` has `χ=ζ`; `K_Q|_F`: `(ζ det A)⁻¹`; `(det A)⁻¹ = (ζ det A)⁻¹·ζ`; `1=(−1)(−1)`; `K_F`: `−1` | true | none |
| §6.1 covering identification | injectivity, surjectivity; `m=1`; radius `r` | `g` fixing `z≠0` is `1`; `p_X(x)=ζ^j z`, replace `x` by `ζ^{−j}x`; `(z/r)^m = z^m/r^m` | true | none |
| §6.2 cyclic correction | general `m`; `m=2` | `c(ζz) = c(z) − f(z)` using `∑_j f(ζ^j z)=0`; `c=½f`, unweighted gives `0`; lift change `mΠμ` | true | none |
| §6.3 gauge | generator; branch `+2πik`; opposite sign, `m≥3` | change `Πλ/m − Πλ/m = 0`; `−kΠλ`; `2Πλ/m`, a period iff `2λ∈mΛ` | true | none |
| §6.5 independence | data held fixed against §6.2 | lift change in `mΛ`; class `λ mod mΛ` fixed / statement holds these fixed | consistent | none |
| §6.6 `π₁` | retraction `[z,v] ↦ [sz, F_{sz}F_z⁻¹v]`; `ζ→ζ⁻¹` | equivariant since `Π` depends on `z^m`; `π₁(Q)=Λ+ℤλ/m`; orbit sum `−Πλ` | true | none |
| Docstring: pins lack open gluing | pinned `TopCat.GlueData.IsCompatible.isManifold` | text "not a carrier at the pins" / declared at line 155, `𝕜 = ℂ` covered | false claim about the library | C01 |
| Convention 2 vs §2.3 | hypotheses on `Y` | T2 + second countable / T2 + locally compact | form | N01 |

- Source locators checked against the text: 8. MilneCFT lines 3174–3190 (Example 1.20, printed p. 66: `H¹ ≅ ker Nm/(σ−1)M`), lines 3191–3199 (Remark 1.21, p. 66: boundary map through a lifted cochain), lines 3787–3812 (Proposition 3.4, p. 81: period-two isomorphisms, with `H⁰_T = ker(σ−1)/im Nm` on the same page). BogomolovTschinkel2003 lines 74–96 (§3, p. 3: the cyclic cover and pullback), lines 99–103 (p. 4: translation by a period over `m`, for §6.2), lines 104–105 (the identification off the central fibre, §6.3), lines 106–107 (the extension, §6.4), lines 107–109 (the circle becoming a nontrivial cycle, §6.6). All support the statements as written.
- Library declarations: the 137 names of the *In Tau Ceti:* lines were each found declared at the pinned Tau Ceti (two through `to_additive`, `TauCeti/Geometry/Manifold/Instances/Quotient.lean` lines 239 and 253); 14 further Mathlib and Tau Ceti names of the *Needs:* lines and contracts were elaborated with `#check`; 10 signatures were opened and compared with their items (for example `Submodule.orbitRelQuotientMap_bijective_iff`, `TauCeti/Algebra/Module/Submodule/OrbitRelQuotient.lean` line 317; `AddEquiv.faithfulVAdd_affineAddAction_iff`, `TauCeti/RepresentationTheory/Cyclic/Affine.lean` line 497).
- Docstring claims about what the pins lack: the rotated disc has no atlas (`TauCeti/Algebra/Module/ZLattice/Family/RotatedDisc.lean` has no `ChartedSpace`); `TauCeti.IsAnalyticSubmanifold` is on `Set (Fin n → 𝕜)` (`TauCeti/Analysis/Analytic/Submanifold/Basic.lean` line 238); fibre products have local equations only (`TauCeti/Geometry/Manifold/FiberProduct/Equation.lean`); the gluing claim fails (C01).
- Cross-roadmap citations resolved on main: ComplexManifolds Milestones 1, 4, 5, 6 and items 7.4–7.6 (lines 172–359; 7.6 states the exact-order theorem for a connected compact cover); AlgebraicTopology §§2.6, 5.4, 5.5 (lines 386, 1482, 1505); GeometricTopology §§1.1, 1.3 (lines 788, 851); SmoothRepresentationsOfLocalGroups SR.0d.2 (line 1335); the consumers' sections A5.1, A5.6, A5.8, §8.2 and §6.1a exist.
- Dependency check: `depcheck: 172 roadmaps, 1999 edges, 0 problem(s)`; no file changed outside the folder; every automatic check passed.
- Elaboration: `Suggested.lean` exits 0, the `sorry` at line 112 the only warning; its elaborated type has every binder of §2.3. One-tactic probe on the theorem: `simp`, `rfl`, `infer_instance`, an anonymous-constructor `exact` and `aesop` all fail; no padding.
- Description against the head: 18 Check blocks with 28 bullets, 137 distinct declarations, one theorem, four consumers, the items with *In Tau Ceti:* lines (§§1.1–1.4, 2.1–2.5, 3.1–3.3, 4.1–4.6, 5.1, 6.2), `metadata.toml` unchanged: all as stated, apart from the gluing item of C01.

Overlap check: read ComplexManifolds (main and its open revision), FuchsianOrbifolds (main) and BallQuotientsAndComplexHyperbolicLattices (main); nothing shared: ComplexManifolds owns quotients, gluing and line bundles and names this roadmap as their consumer, FuchsianOrbifolds mentions a torus only as an example, and BallQuotientsAndComplexHyperbolicLattices consumes Milestone 1.

Source independence: 9 passages compared with 2 sources (BogomolovTschinkel2003 against the introduction of Milestone 6, §§6.2, 6.3, 6.4, 6.6 and the module docstring; MilneCFT against the introduction of Milestone 4, §4.3 and §4.5), none shared beyond forced terms; largest share BogomolovTschinkel2003, 5 of 12 locators; contents compared with BogomolovTschinkel2003 (its five sections against six milestones): independent. Birkenhake–Lange and Barth–Hulek–Peters–Van de Ven could not be read.

Research link: Milestones 5–6 formalise Kodaira's logarithmic transforms, which Bogomolov–Tschinkel (2003, §3, Proposition 3.1) use to construct elliptic fibrations keeping simple connectivity and the Kähler property; Milestones 1–3 feed the analytic abelian-variety families of AbelianSchemesAndArithmeticModuli. Rests on BogomolovTschinkel2003 §3 (read) and the README's consumers section.

## Not verifiable

- Birkenhake–Lange, *Complex Abelian Varieties*, Chapters 1 and 8 (introductions of Milestones 1 and 2): paywalled, cited by chapter only; the statements were checked by computation and against the pinned declarations.
- Barth–Hulek–Peters–Van de Ven, *Compact Complex Surfaces*, Chapter V, p. 216 (introductions of Milestones 5 and 6): the same.

## Source issues

- none

## For the human reviewers

- Not tested: the locators into Birkenhake–Lange (Milestones 1 and 2) and Barth–Hulek–Peters–Van de Ven (Milestones 5 and 6) are paywalled and were not compared with the text; the largest-share source, BogomolovTschinkel2003, was read.

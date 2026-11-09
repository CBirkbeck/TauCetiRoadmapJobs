# Review of NoncommutativeGeometry (pull request #1143 at 3571729)

**Verdict:** needs changes

Incremental re-review of the 109 changed README lines since f1b5581 (the head r17 read). The change is the repair of r17 R02: N6 now builds `A_θ` on Tau Ceti's pinned full crossed product and rotation action. `Suggested.lean`, the rest of the folder and everything outside the folder are unchanged. The repair is correct at the pin (checked name by name and by elaboration, below). The two findings that remain are the two r17 findings this head does not touch: OperatorKTheory #866 has not moved, and the description is unchanged.

## R01 (P2) — `A_θ`, its presentation and its trace have two owners: N6 and OperatorKTheory 7.4

Carried from r17 R01.

**Location.**
- `TauCetiRoadmap/NoncommutativeGeometry/README.md` 50–56: "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` for every real θ, built on Tau Ceti's full crossed product … which OperatorKTheory's Pimsner–Voiculescu computation consumes".
- The same file, 1568–1571: "OperatorKTheory 7.4 consumes N6's rotation C*-algebra A_θ, its universal presentation, the injectivity of its coordinate copy of C(𝕋) and its faithful trace τ".

**Claim.** N6 is the only owner of `A_θ`, its presentation and τ, and OperatorKTheory takes them from N6.

**Witness.** OperatorKTheory #866 is still at 1377338a (unchanged since r16):
- 1782–1784 define `α(f)(z)=f(exp(2πiθ)z)`, `A_θ=C(𝕋)⋊_αℤ`, v, u and "the canonical trace `τ=HaarIntegral∘E` using D2's expectation";
- 1796–1798: "A_θ has the universal unitary presentation with these relations from Dynamics D1, including injectivity of the coordinate copy";
- 2324–2326: this roadmap "consumes K1–K7 … and K7's rotation algebras with their K-groups".

Main's copy of this roadmap (`TauCetiRoadmap/NoncommutativeGeometry/README.md` on main, 477) still consumes "K7's universal rotation algebra". This pull request reverses that direction and #866 has not followed, so today both roadmaps define the same object.

**Repair.** Unchanged from r17:
- README: no edit. N6 must stay the owner: a scratch copy with `OperatorKTheory §7.4` added to N6's *Needs:* (1411) gives an `UPWARD: NoncommutativeGeometry (on main) -> OperatorKTheory` line from the dependency check.
- Description: state that #1143 merges before #866, and that #866 then replaces its definitions at 1782–1784 and the bullet at 1796–1798 by a citation of NoncommutativeGeometry N6 (which now sits on the pinned `TauCeti.CStarAction.FullCrossedProduct`), and rewrites 2324–2326.
- Test: after the repair, `roadmaps grep --fixed 'τ=HaarIntegral∘E'` (today #866:1784) and `roadmaps grep --fixed "K7's rotation algebras"` (today #866:2326) return nothing.

## R02 (P3) — The description describes an earlier head and states no merge order

Carried from r17 R03. The description is byte-identical to the one r17 read.

**Location.** The pull-request description.

**Claim.** The description says: "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged"; "K5's fixed swapped reduction x×_K5 y"; N1.Tensor includes the "Fréchet scalar-extension/balancing maps"; "[Smooth Banach #1145] … supplies generic SB8 analytic results to N6"; N2 "retains [Algebraic K-theory #1142] as its A0–A3 supplier"; "three intended prototype admissions"; "which merge first: #864". It says nothing about N6 building on the pinned crossed product.

**Witness, at this head.**
- `git diff --stat origin/main...HEAD -- TauCetiRoadmap/NoncommutativeGeometry/Suggested.lean`: 52 insertions, 93 deletions.
- README 956–957 name the two reductions `x⊠_u y` and `x⊠_s y`; no "x×_K5" occurs in the file.
- README 19–23 assign the complexification and balancing maps to SmoothBanachRepresentations §7.2a, "not planned here".
- README 100: SmoothBanachRepresentations' "generic inverse closure is not an input here".
- No `*Needs:*` line names AlgebraicKTheory (grep count 0).
- `Suggested.lean` has one `sorry` (line 62), not three admissions.
- #864 is not in the open index (`roadmaps list` has no #864).
- README 1234–1276 and 310–342 now build `A_θ` on `TauCeti.CStarAction.FullCrossedProduct`.

**Repair.** Rewrite the description to match this head:
- N3–N4 consume NoncommutativeIntegration §1.3–§1.6, §2.1 and VonNeumannAlgebras V4.Core; N6 builds `A_θ` on Tau Ceti's full crossed product and rotation action and cites OperatorAlgebraDynamics D1–D2, D4 only for the universal property, the expectation and the dual action.
- `Suggested.lean` states only `bijective_matrixExtension`.
- The two Clifford reductions are `x⊠_u y` and `x⊠_s y`; OperatorKTheory 7.5 owns the identification of `A_θ` with `C*(ℤ²,c)`.
- State the order: #866 after this pull request (R01); SmoothBanachRepresentations #1145 (d7717e65, `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/README.md` 9: "NoncommutativeGeometry N1 owns the rest of the completed locally convex projective tensor, over ℝ and over ℂ alike") and LocallyConvexDuality #1782 consume N1.Tensor over ℝ, which only this revision provides, so both merge after it; #1187 conflicts with this folder's `Suggested.lean` (`overlaps.md`) and rebases after this pull request.
- Drop the #864 line and the build report for 84190a1e.

## Previous findings

- R01 — not repaired: README 50–56 "N6 alone owns the rotation C*-algebra … which OperatorKTheory's Pimsner–Voiculescu computation consumes" and 1568–1571 stand; #866 is still at 1377338a with 1784, 1796 and 2326 unchanged. Carried as R01.
- R02 — repaired: the Tau Ceti contract gains the bullet "Crossed products (N6)" (310–342); N6 (1234–1276) defines `A_θ` as `TauCeti.CStarAction.FullCrossedProduct α μ` for α the pinned rotation pulled back by `TauCeti.CStarAction.comp` along `n↦−2πθn`, v the coordinate under `coefficientMultiplier`, u the generator under `groupMultiplier`; D1 is cited only for the universal property into an arbitrary unital C*-algebra, D2 for full = reduced, the expectation and the generator formulas, D4 for the dual action; the names are in *Needs:* (1411) and the modules in References (1639–1640). Every name, module, formula and hypothesis is checked at the pin below and the construction elaborates; the repair introduced no new problem.
- R03 — not repaired: the description is byte-identical. Carried as R02.

No repair report marked any finding `not actionable in this package`, so nothing is re-raised.

## Verified sound

**Gate, dependency check, elaboration and signature.**
- `gate … --base origin/main --build` at 3571729: every scanner 0, `build=0`, `OK`.
- The dependency check: `depcheck: 237 roadmaps, 2309 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/NoncommutativeGeometry/Suggested.lean` exits 0 with the single diagnostic `declaration uses sorry` at 62:8. The file is unchanged since f1b5581, so r17's one-tactic probe (`simp`, `infer_instance`, `exact?` all fail) and signature comparison stand: the elaborated type of `bijective_matrixExtension` keeps `[CommRing R] [Algebra ℚ R] [Ring A] [Algebra R A] [AddCommGroup M] [Module R M] [Fintype ι] [DecidableEq ι] [Nonempty ι]`, the generality of README 528–553 (now 561–586 after the shift).
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty.
- No gaps are declared.

**The new construction, elaborated at the pin.** A scratch file (not in the folder) with `import Mathlib` and the three Tau Ceti modules the contract names elaborates with exit 0 and no diagnostic:
- `rotZ θ := rotation.comp ⟨AddMonoidHom.toMultiplicative (zmultiplesHom ℝ (−2πθ)), continuous_of_discreteTopology⟩ : CStarAction (Multiplicative ℤ) C(Circle, ℂ)`;
- `FullCrossedProduct (rotZ θ) Measure.haar` has a `NonUnitalCStarAlgebra` instance, and `Measure.haar` on `Multiplicative ℤ` satisfies `InnerRegularCompactLTTop` by `inferInstance`, so `of_injective`'s measure hypothesis holds;
- `rotZ θ (ofAdd 1) f z = f (Circle.exp (2πθ) * z)` is proved by `simp [Circle.exp_neg]` after unfolding, and `rotZ θ (ofAdd 1) Circle.coordinate = exp(−i·(−2πθ)) • Circle.coordinate` from `rotation_coordinate`: the generator sends the coordinate to `exp(2πiθ)` times itself, the README's sign (1238–1239, 1353–1357);
- `groupMultiplier (rotZ θ) haar (ofAdd 1)` is a term of `unitary (DoubleCentralizer ℂ (FullCrossedProduct …))` and `coefficientMultiplier (rotZ θ) haar Circle.coordinate` a term of the multiplier algebra, as 1241–1245 say;
- `PositiveLinearMap.gnsStarAlgHom f : C(Circle, ℂ) →⋆ₐ[ℂ] (f.GNS →L[ℂ] f.GNS)` elaborates under `open scoped ComplexOrder`, so Mathlib's `gnsStarAlgHom` (`Analysis/CStarAlgebra/GelfandNaimarkSegal.lean:246`, for `[CStarAlgebra A] [PartialOrder A] [StarOrderedRing A]` and a positive functional) applies to the Haar state of C(𝕋) as 1270–1274 use it. The README cites it by its last name component, as it cites `cfc`.

**Library declarations opened at the pins (Tau Ceti 2fd255d9, Mathlib as pinned).**
- `Analysis/CStarAlgebra/Action/CrossedProduct/Full.lean`: standing hypotheses `[IsTopologicalGroup G] [LocallyCompactSpace G] [BorelSpace G] [μ.IsHaarMeasure]` (261), `FullCrossedProduct` as the completion of the twisted convolution algebra in the full seminorm (266) with the `NonUnitalCStarAlgebra` instance (276), `of` (282), `denseRange_of` (322), `of_injective` with `[μ.InnerRegularCompactLTTop]`, `H : Type v` and an injective `ρ : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)` (335), `starAlgHom_ext` (345), `lift` with the bound `‖ρ f‖ ≤ fullSeminorm f` (378), `CovariantRepresentation.integratedFull` on a Hilbert space (417), `norm_le_iff` (438). The module docstring (14–35): the full seminorm is the supremum over covariant representations on Hilbert spaces; no unit assumed.
- `…/CrossedProduct/Multiplier.lean`: `coefficientMultiplier` with `(i_A(a) f)(s) = a * f(s)` (141–144, through `coefficientMul`, `Convolution/Multiplier.lean:52`, `a • f.ofConv`), `groupMultiplier : G →* unitary 𝓜(ℂ, …)` with `(i_G(r) f)(s) = α r (f (r⁻¹ * s))` (221–224, through `translateLIE`, 103, and `translate_apply`, `Convolution/Translate.lean:74`), and `groupMultiplier_mul_coefficientMultiplier : i_G(r) * i_A(a) = i_A(α r a) * i_G(r)` (258).
- `…/Convolution/Basic.lean:133`: `convolution_apply : (f ⋆ g) s = ∫ r, f r * α r (g (r⁻¹ * s)) ∂μ`, the formula at README 320.
- `…/Action/ContinuousMap.lean`: `rotation : CStarAction (Multiplicative ℝ) C(Circle, ℂ)` (72), `rotation_apply_apply : rotation t f z = f ((Circle.exp t.toAdd)⁻¹ * z)` (76), `rotation_coordinate` (81).
- `…/Action/Basic.lean:156`: `comp (α) (φ : ContinuousMonoidHom H G)`, with `comp_apply` (161).
- `Analysis/Complex/Circle.lean`: `Circle.coordinate` (80), `coordinate_mem_unitary` (97).
- The pin's gaps the contract states (339–342): no `One`/unital instance on `FullCrossedProduct` (only the `NonUnitalCStarAlgebra` at 276 and the `NonUnitalStarAlgHom.id` at `Functoriality.lean:85`), no reduced crossed product, conditional expectation or dual action (no file under `Analysis/CStarAlgebra/` matches `ReducedCrossedProduct`, `conditionalExpectation`, `dualAction`; the `CrossedProduct` directory holds `ApproximateUnit`, `Full`, `Functoriality`, `Multiplier`), and no universal property beyond `lift` (bounded by the full seminorm) and `integratedFull` (Hilbert spaces).
- Mathlib `CStarAlgebra` (`Analysis/CStarAlgebra/Classes.lean:38`).

**Cross-roadmap citations resolved, on main.**
- OperatorAlgebraDynamics D1 (148): the convolution algebra with the same formula (158–161), the integrated form, the full norm as the supremum of integrated-representation norms (199–201), "its canonical nondegenerate coefficient map into `M(A⋊αG)` and strictly continuous unitary group map, with covariance", and "the universal property for nondegenerate covariant homomorphisms into multiplier algebras" (205–208): the supplier-table row at 354 and the use at 1258–1264 (a unital B is its own multiplier algebra; the pair (cfc of V, U) is nondegenerate because the representation is unital).
- D2 (221): the faithful conditional expectation `E(∑a_g u_g)=a_e` with the contractive Fourier-coefficient maps for discrete G (245–252), the full expectation factoring through the regular quotient (250–252), amenability giving `A⋊G≃A⋊rG` (258–259), and "the full-product identification and generator formulas for G=ℤ" (276–278): row 354 and 1249–1252, 1275–1278.
- D4 (333): the dual action of `PontryaginDual G` for abelian G, with the G=ℤ instance (351): row 354 and 1280–1281.
- Remark, no change asked: D1 and D2 on main construct their own full and reduced crossed products, and this README applies D1's universal property and D2's expectation to the pinned object. The two full products are the same completion of `C_c(G,A)` in the same supremum norm (D1 199–201 against the pin's `norm_le_iff`), so no identification is missing; a roadmap defers to what the pin has, so D1 built against this pin uses `FullCrossedProduct`.
- OperatorKTheory #866 at 1377338a, 1782–1798 and 2324–2326: R01. Its 7.5 (1864–1872, the twisted-group identification with `W_(m,n)=v^m u^n`) still matches README 57–63.
- SmoothBanachRepresentations #1145 has moved to d7717e65 (`TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/`): line 9 still names N1 as the owner of the real and complex completed tensor, and §7.2a (466–480) "builds no tensor product and proves no law of one", owning only the two scalar-comparison maps; README 19–23 and 100 resolve there, and r16 R02 stays repaired.

**Ownership against open work.** The objects the change introduces (the ℤ-action by rotation, `A_θ` on the full crossed product, its unit, u, v, the trace) were searched by object in the sibling checkouts named in the brief: the only second owner is OperatorKTheory #866 (R01). OperatorAlgebraDynamics #1137 revises a roadmap on main and is not a dependency; OAD is cited as it is on main. SpectralManifolds #1158, CompactQuantumMetricSpaces #1155 and HeisenbergImprimitivity #1149 consume `A_θ` and the torus and build neither (r17).

**Sources.** The changed passages cite no source text: they cite the pin and OperatorAlgebraDynamics. None of the 15 sampled locators (seed 1143017, all in the cached `connes94` and `grothendieck52`) falls in them; r17 verified all 15 at the cache and that verification stands. No locator is flagged unverified.

**The mathematics of the changed passage.** Every value below was recomputed this round; the rows marked r17 are carried from that report for statements the diff leaves untouched.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| The ℤ-action (1234–1239): `α=rotation.comp(n↦−2πθn)`, generator `f↦f(exp(2πiθ)z)` | n=1 at general θ; θ=1/4; θ=0.3; the other pullback `n↦2πθn` | `rotation t f z=f(exp(it)⁻¹z)` at `t=−2πθ`: `f(exp(−2πiθ)⁻¹z)=f(exp(2πiθ)z)`. On the coordinate: `exp(2πiθ)·z`, which is `i·z` at θ=1/4 and `(−0.309017+0.951057i)·z` at θ=0.3; the other pullback gives `−i·z` and `(−0.309017−0.951057i)·z`, the algebra `A_(−θ)`; they agree iff `exp(4πiθ)=1` iff θ∈½ℤ (both −1 at θ=1/2). Lean: `rotZ θ (ofAdd 1) f z = f (Circle.exp (2πθ) * z)` and `rotZ θ (ofAdd 1) coordinate = exp(−i·(−2πθ)) • coordinate` elaborate | true; the Check at 1353–1357 pins the direction | none |
| Covariance and the relation (1241–1246): `uvu*=exp(2πiθ)v`, `uv=exp(2πiθ)vu`, `U₂U₁=exp(2πiθ)U₁U₂` | r=1, a=z at θ=0.3; the pinned torus relation | `i_G(1)i_A(z)=i_A(α₁z)i_G(1)=exp(2πiθ)i_A(z)i_G(1)`, so `uv=exp(2πiθ)vu` and (u unitary) `uvu*=exp(2πiθ)v`. With `U₁=v`, `U₂=u`: `U₂U₁=exp(2πiθ)U₁U₂`, the pinned `U₂_mul_U₁` (r17, `SmoothTorus/Basic.lean:561`) and the N6 multiplier witness at `(m,n)=(0,1)`, `(m′,n′)=(1,0)`. The reversed covariance `i_A(a)i_G(r)=i_G(r)i_A(α_r a)` would give `vu=exp(2πiθ)uv`, which contradicts the pinned relation for θ∉ℤ | true | none |
| The unit (1247–1252, Check 1358–1362): `of(c⁻¹δ₀)` two-sided unit | c=1; c=2; g arbitrary | `(c⁻¹δ₀⋆g)(s)=∫c⁻¹δ₀(r)α_r(g(r⁻¹s))dμ=c·c⁻¹·g(s)=g(s)`; `(g⋆c⁻¹δ₀)(s)=c·g(s)·α_s(c⁻¹·1)=g(s)`; `δ₀⋆δ₀=cδ₀`, so at c=2 the unscaled `δ₀` satisfies `δ₀⋆g=2g` and `δ₀⋆δ₀=2δ₀`: not a unit, not idempotent. Multiplication is continuous, so the unit of the dense subalgebra is a unit of the completion; a unital C*-algebra is its own multiplier algebra, so u, v∈A_θ | true | none |
| Monomials (1250–1252): `of(c⁻¹δ_n z^m)=v^m u^n` | `(m,n)=(1,1)`, θ=0.3, `g=c⁻¹δ₀`; the reversed order | `(c⁻¹δ_n z^m⋆g)(s)=c·c⁻¹·z^m·α_n(g(s−n))=(i_A(z^m)i_G(n)g)(s)`, so left convolution is `i_A(z^m)i_G(n)=v^m u^n` (i_A, i_G are homomorphisms, `i_G(n)=u^n`); applied to the unit it gives `of(c⁻¹δ_n z^m)=v^m u^n`. The reversed order `i_G(n)i_A(z^m)` acts by `α_n(z^m g(s−n))=exp(2πiθmn)z^m α_n(g(s−n))`, which differs by `exp(2πiθ)=−0.309017+0.951057i` at (1,1) | true | none |
| Universal property (1253–1264): unital *-hom `A_θ→B` from unitaries `UVU*=exp(2πiθ)V`, unique | B=ℂ at θ∈ℤ, θ=1/2, irrational θ; θ=0 | B=ℂ: `UVU*=V`, so a pair exists iff `exp(2πiθ)=1` iff θ∈ℤ: `A_θ` has a character iff θ∈ℤ, consistent with `uv=−vu` at θ=1/2 forbidding one and with simplicity for irrational θ. θ=0: the action is trivial, `A_0=C(𝕋²)`, universal for commuting unitary pairs. The integrated form of `c⁻¹δ₀` is `c·c⁻¹·π(1)U_0=1`, so the hom is unital. Uniqueness: two such homs agree on `of(c⁻¹δ_n z^m)=v^m u^n`, hence by continuity on `of(C_c(ℤ,C(𝕋)))` (finite sums of `δ_n⊗z^m` are ℓ¹-dense), then `starAlgHom_ext` (345) | true | none |
| Coordinate copy injective (1265–1274) via `of_injective` | the Haar state; a non-faithful state (evaluation at 1) | `of_injective` needs `[μ.InnerRegularCompactLTTop]` (Lean `inferInstance` for Haar on ℤ), `H : Type v` (the GNS space of C(Circle, ℂ) : Type 0) and an injective `ρ`. Haar state φ: `φ(f*f)=∫|f|²=0` forces f=0 on every nonempty open set, so f=0; GNS: `‖π_φ(a)ξ_φ‖²=φ(a*a)`, so `π_φ(a)=0⇒a=0`. Evaluation at 1 is a state whose GNS representation is one-dimensional and kills `z−1`, so it does not qualify. `f↦c⁻¹δ₀f` is injective into `C_c`, so `f↦i_A(f)=of(c⁻¹δ₀f)` is injective | true | none |
| The expectation and trace (1275–1278, Check 1348–1352) | `v^m u^n`; `uvu*` against `vu*u` under evaluation at 1 | `E(v^m u^n)=δ_(n0)z^m`, `τ(v^m u^n)=δ_(n0)∫z^m=1` iff `(m,n)=(0,0)`; evaluation at 1 after E gives `exp(2πiθ)` on `uvu*=exp(2πiθ)v` and 1 on `vu*u=v`: a state, not a trace, for θ∉ℤ | true (r17 row, re-read against the new E) | none |
| Supplier row 354 | D1, D2, D4 on main | D1 205–208 (universal property into multiplier algebras), D2 245–252, 258–259, 276–278 (expectation, amenability, G=ℤ generator formulas), D4 333–351 (dual action, G=ℤ instance); the pin supplies the crossed product, multipliers and rotation (above) | true | none |
| `bijective_matrixExtension` (Lean 62), headline | r17 row (ι=∅; `M₂(ℚ)`, n=0…3) | r17: `HC=1,0,1,0` on both sides, `[Nonempty ι]` needed | true, not padding | none |
| N1–N5, N7 statements and the untouched N6 Checks | r17 rows (ground ring, N1.Tensor, SBI, exterior product, S normalization, signs, N2 pairings, product law, Chern constants, Bott pairing, product cocycle, p-summability, `Tr′`, character sign, character index theorem, Clifford reductions, quasi-ideal Checks, `Tr_ω`, N4 block operator, ω-dependence, partial-sum norm, N5 Checks, Hochschild class, τ-trace Check, Hochschild dimensions, HP, Fourier triple, Heisenberg module, trace/Chern values) | the values of r17's table, unchanged text | true | none |

**Headlines and padding.** Unchanged since r17: the five end theorems (Summary 8–12) are matrix Morita invariance (stated as `bijective_matrixExtension`), the character index theorem, the Hochschild-class theorem, the torus calculus with periodic cyclic cohomology, and the Heisenberg index; the docstring names what each of the last four lacks at the pins (no trace-class trace, no topology or derivations on `SmoothNoncommutativeTorus`, no Heisenberg module). The new `A_θ` changes none of this: no headline becomes statable through it, since the torus calculus needs the Fréchet topology and derivations the pin lacks.

**Overlaps.** `overlaps.md`: no id this README cites is dropped by an open pull request, none that only a revision defines, none this pull request drops; the only conflicting head is #1187 on `Suggested.lean` (R02 asks for its order). The closest open roadmaps (#866, #1158, #1145, #1137, #1077) were read for ownership: R01.

## Not verifiable

- Elaboration at #1187's Tau Ceti pin (ab00ba392): that pin is not checked out in this worktree. Only the order is asked for (R02).

## Source issues

- none

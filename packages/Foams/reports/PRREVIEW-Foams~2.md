# Review of Foams (pull request #1629 at f31846e)

**Verdict:** needs changes

Full review of the repaired head. The folder changed by 3742 lines since the head the previous review read, so every passage was reviewed, changed or not. The previous review's eight findings were checked first (status under "Verified sound"); the three findings below are new.

## R01 (P2) — The 2.7 hexagon and square relations hold only for one numbering of the boundary points, and the README does not say which

**Location:** `TauCetiRoadmap/Foams/README.md:1152`–1181. Claim: "number six boundary points 0,…,5 cyclically with even points incoming, odd points outgoing", then "H_R ⊕ [N−3] Q_01 ≅ H_L ⊕ [N−3] Q_34" and "Q_01 ≅ P_R ⊕ [N−2]R₀ and Q_34 ≅ P_L ⊕ [N−2]R₀".

**Witness:** Counting colourings (the MOY state sum at q = 1) with every boundary colour fixed, for N = 2,…,6. With the points numbered clockwise, all three relations hold at every boundary colouring for N ≥ 3 (and both square relations for N ≥ 2). With the points numbered counterclockwise, the same three statements fail: at N = 4 the hexagon relation fails on 120 of 4096 boundary colourings and each square relation on 96; closing Q_01 with the mirror of P_R gives 144 colourings, while P_R ⊕ [N−2]R₀ gives 64 + 2·16 = 96. Under that reading the true decompositions are Q_01 ≅ [N−2]P_R ⊕ R₀ and Q_34 ≅ [N−2]P_L ⊕ R₀.

The reason is that the direction of numbering decides which of the two square resolutions is joined along the 2-labelled edges. Every label listing in 2.7 ("successive edge labels 2,1,2,1,2,1", "labels 1,2,1,2 on the successive edges in the listed clockwise order") is consistent with both readings, because the in/out pattern forces the labels once the cycle direction is fixed; only the claimed coefficients pin the direction. A convention whose two readings make a stated isomorphism true or false needs its witness.

**Repair:** In the first paragraph of the cyclic switch write "number six boundary points 0,…,5 clockwise" (the reading under which the stated relations hold; equivalently, state that in each square relation the coefficient [N−2] multiplies the resolution joining the endpoints of the 1-labelled edges of the square, and the coefficient 1 the resolution joining the endpoints of its 2-labelled edges). Add a discriminating Check, for example: "In Q_01 give the boundary colours c₀ = c₁, c₂ = c₅ = a and c₃ = c₄ = b ≠ a. The square admits N − 2 colourings, which R₀ = (01)(25)(34) carries with coefficient [N−2]; the mirror numbering would give a single colouring and would exchange the coefficients of P_R and R₀." Tested: with clockwise numbering the counts for this boundary are Q_01 = N − 2, P_R = 0, R₀ = 1 (N = 4: 2 = 0 + 2·1).

## R02 (P3) — Four supplier contracts cite sections that do not contain the object consumed, and one pinned Tau Ceti object is not cited

**Location:** `TauCetiRoadmap/Foams/README.md:222`–225 (supplier table rows for DGAInfinity, ZigzagPreprojective, AlgebraicVectorBundles, GrothendieckEulerForms), 597–599, 650–652 (0.10), 1251, 1274 (2.8), 1389–1391 (2.11), and 509–513 (0.8).

**Witness:** Read on main at `ffac5139`:

- ZigzagPreprojective "Layer 8: braid complexes and spherical-twist comparisons" (its README lines 418–445) builds the two-term bimodule complexes B_i and the braid-group action. It states no associator, unit or endobimodule coherence of a graded tensor product; the words do not occur anywhere in that README.
- DGAInfinity Layer 0 (lines 263–291) packages signed graded modules and Koszul-signed tensor products; Layer 1 (293–315) is DG algebras and bimodules. The total grading of a tensor product of internally graded modules over a ring in degree zero is already at the pin: `TauCeti.InternalGrading.tensorProduct` (`TauCeti/Algebra/Module/GradedModule/TensorProduct.lean:196`, with `tmul_mem_tensorProduct` at line 231 and `isHomogeneous_assoc_symm` at line 240). A balanced tensor over a graded commutative 𝕜 with 𝕜 not in degree zero is at neither place; the pin has no monoidal structure on `GradedModuleCat`.
- GrothendieckEulerForms Layer 3 (lines 283–329) has graded finite resolutions and linear resolutions; it defines no "free internally graded module with specified generator degrees". Shifts of the regular module are at the pin (`TauCeti/Algebra/Category/GradedModuleCat/Shift.lean`, `shiftFunctorZeroIso` line 35, `shiftFunctorAddIso` line 51) and finite sums are biproducts there.
- AlgebraicVectorBundles L2A (lines 306–338) packages nonnegatively graded quasicoherent algebras over a scheme as commutative monoid objects in `GradedObject`, with the base in degree zero. The circle algebra A_(a,N) of 2.11 is a graded algebra over the graded ring Λ_N, that is, a monoid in GrMod_(Λ_N), whose tensor is 0.10's own construction; L2A's convolution hypotheses do not apply over a graded base.
- The pin has `LinearMap.IsFrobeniusFunctional` (`TauCeti/Algebra/Algebra/Frobenius/Basic.lean:90`, nondegeneracy of (a,b) ↦ φ(ab)) with `IsFrobeniusFunctional.isPerfPair` (line 188, under `[Field k] [FiniteDimensional k A]`), `toDualEquiv` and the Nakayama automorphism. Section 0.8 defines the same notion (perfect rather than nondegenerate, over a commutative ring) without citing it.

**Repair:** In the supplier table and in the `*Needs:*` lines of 0.10, 2.8 and 2.11: delete the ZigzagPreprojective row and state the associator, unit and symmetry coherence of ⊗_𝕜 on GrMod_𝕜 as 0.10 targets (the text already says the symmetry is proved here); replace the DGAInfinity row by a `From Tau Ceti` bullet citing `TauCeti.InternalGrading.tensorProduct` for the total grading over a degree-zero base and keep the balanced tensor over a graded 𝕜 as a 0.10 target; replace the GrothendieckEulerForms row by the pinned shift functor and biproducts of `GradedModuleCat`; restrict the AlgebraicVectorBundles row to the nonequivariant specialization (base ℤ or R in degree zero) or delete it, with the monoid packaging over Λ_N a 2.11 target. In 0.8 and the `From Tau Ceti` contracts, cite `LinearMap.IsFrobeniusFunctional` and say in one clause how the notion kept here differs (perfect pairing over a commutative ring; the two agree in finite dimension over a field by `IsFrobeniusFunctional.isPerfPair`; the form 2xy on ℤ of the 0.8 and 2.1 Checks is nondegenerate but not perfect). Tested: the 0.8 Check "ε(X) = 2 gives determinant −4" is exactly a nondegenerate non-perfect instance, so the clause is discriminating.

## R03 (P3) — Two Lean carriers are named nowhere in the README, and three form items

**Location:** `TauCetiRoadmap/Foams/Suggested.lean:37`, 48 and 3; `TauCetiRoadmap/Foams/README.md:1241`, 1983 and 851.

**Witness:** `EquivariantRing` and `EquivariantRing.grading` are declared in Suggested.lean and are the carriers of the stated headline `exists_homogeneous_basis_range_idempotent`; neither name occurs in README.md (the README names Λ_N by notation only). The rule is that every Lean name appears in the README. The module docstring is titled "Foams — algebraic acceptance statements" where the form is "<title>: target signatures". README line 1983 begins with "#W)", a wrapped continuation that a Markdown renderer treating "#" loosely turns into a heading. In 1.4 the README's unit η and counit ε are the reverse of Bar-Natan's names at the cited Definition 7.1 (`bar-natan line 1258`: ǫ : ℤ → V, 1 ↦ v₊ is his unit and η : V → ℤ, v₋ ↦ 1 his counit), so a reader checking "ε(X) = 1" against the source meets "η(v₋) = 1".

**Repair:** In 2.8 (or the Conventions table's "Equivariant ring" row) add one sentence: "In Suggested.lean, Λ_N is `EquivariantRing N` with `X i` the generator e_(i+1), and its grading is `EquivariantRing.grading N`." Retitle the module docstring "Foams: target signatures". Rewrap line 1983 so that it does not start with "#". In 1.4 add the clause "Bar-Natan writes ǫ for the unit and η for the counit; this roadmap uses η and ε." None of these changes the mathematics; the file still elaborates with its two `sorry` warnings.

## Verified sound

**The previous review's findings, at this head.**

- R01 (absent Tau Ceti modules claimed as supplied): repaired in substance. Every file now cited in `From Tau Ceti` exists at the pinned Tau Ceti `a91d3aaf`: `CategoryTheory/Preadditive/MorphismIdeal/Basic.lean` (356 lines; `MorphismIdeal` line 85, `Quotient` 194, `quotientFunctor_map_eq_zero_iff` 213, `lift` 306), `Algebra/Category/GradedModuleCat/Basic.lean`, `Projective.lean` (`projective_of_module_projective` line 43, from `Module.Projective`, as the README now says), `Algebra/Module/GradedModule/Nakayama.lean` (bounded-below generation criteria, lines 46–154), `RingTheory/MvPolynomial/Symmetric/Schur/Pieri.lean` (`hsymm_mul_diagramSchurPoly` 231, `hsymm_mul_schurPoly` 282; the elementary rule is correctly reassigned to SchurWeyl Layer 7, whose 7.2 states the vertical Pieri rule), `Combinatorics/PermutationTriple/Basic.lean`, `Combinatorics/RibbonGraph/Basic.lean` (`facePerm`, `eulerChar_def` line 238, `ConnectedComponent` 156). The residual drift in the replacement citations is R02 above.
- R02 (state the integral graded-freeness headline): repaired, `exists_homogeneous_basis_range_idempotent` at Suggested.lean line 57.
- R03 (four option overrides): repaired, none remain (gate `set_option=0`).
- R04 (API catalogue): repaired, the file is 70 lines with two theorems and two definitions; `circleTraceUnit_robertWagner` is gone and its identity survives as the 1.2 Check (values 1, σ, −σ², −σ³).
- R05 (locators and manifest): locators repaired (Carpentier Lemma 2 p. 4, proof pp. 4–7; Wu Theorem 2.4 p. 10, proof pp. 11–12, equations (2.3)–(2.6) on p. 12; KH3 cites Bar-Natan Definition 7.1/Proposition 7.2 p. 1470). No `sources.toml` was added to the folder; no roadmap folder on main carries one and the gate's `source-material` check passes, so this part is not re-raised.
- R06 (Checks and per-target dependencies): repaired. All 44 `### k.n` sections carry a `**Checks.**` list with at least three bullets (counted mechanically: 44 of 44) and a `*Needs:*` line (44 of 44); every layer ends with `### Examples` and `### Dependencies`.
- R07 (frozen commit links): repaired. TemperleyLieb is cited on main; SurfaceTopology and PlanarTopology are cited by roadmap name and section with a link to the branch of pull request #271 (a new-roadmap pull request by another author, an allowed supplier), not by commit or pull-request number. Gate `blob=0`.
- R08 (scanner false positive on the Neuchl URL): moot, the README now cites Baez–Neuchl on arXiv; gate `private-paths=0`.

**Build, gate, scope.** Head `f31846eef08f8837fb96a2c2ffda82d86d48cc7d`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/Foams'` is empty. The worker's gate reports every counter zero and OK. `lake env lean` on Suggested.lean gave exactly two warnings, `declaration uses sorry` at lines 28 and 57, in 24 s. The folder holds README.md, Suggested.lean and metadata.toml only. The dependency check returned exactly:

```text
depcheck: 242 roadmaps, 2368 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line. Foams is at line 380 of the merge order and TemperleyLieb, its only supplier in that order, at line 235; the other suppliers are on main (PivotalSpherical, KhovanovHomology, RepresentationTheory/SchurWeyl, DGAInfinity, ZigzagPreprojective, AlgebraicVectorBundles, GrothendieckEulerForms, all present at `ffac5139`) or in pull request #271. A target-level check parsed every `*Needs:*` paragraph into section references (44 sections, 170 internal edges after discounting supplier layers such as "TemperleyLieb Layer 2"): no cycle and no section needing a later section.

**Signatures.** `#check` of all four declarations was elaborated in a scratch copy; the elaborated types agree with the README: the Frobenius headline carries `[CommRing R] [CommRing A] [Algebra R A] [Module.Free R A] [Module.Finite R A]` and the perfect-pairing hypothesis on `(LinearMap.mul R A).compr₂ ε` as 0.8 states; the freeness headline quantifies over `N m : ℕ`, shifts `s : Fin m → ℤ`, a Λ_N-linear idempotent and the degree-zero condition in the shifted sense `v j ∈ grading N (d − s j)`, as 2.8 states, and allows N = 0 as 2.8 says. No section binder is lost (`signatures.md` agrees). `grading N d` is `MvPolynomial.weightedHomogeneousSubmodule ℤ (fun i => 2(i+1))`, so e_(i+1) has degree 2(i+1), matching deg e_i = 2i.

**Headlines and padding.** The README's headline list: RW evaluation polynomiality (1.1), planar decomposition into shifted empty webs (2.7–2.10), the concrete monoidal 2-categories (4.1–4.3), spatial duality (5.1), progressive spanning (6.6), the canopolis (7.3), KH1–KH4; none is statable at the pins (no foam, web or closure carrier exists in Mathlib or Tau Ceti), and the module docstring names each with what it lacks. The two stated headlines are the two algebraic theorems the README singles out (0.8, 2.8). One-tactic probe on a scratch copy: `simp` makes no progress on either; `exact?` finds nothing. Neither restates a definition, mirrors a Check or computes a value. Not padding. The pinned Mathlib has `Coalgebra.IsFrobenius` (`RingTheory/Coalgebra/IsFrobenius.lean`, class with field `left_eq_right`, lemmas `left_eq_comul_comp_mul'`, `compr₂_mul_counit_bijective`) but no construction of a coalgebra from a trace, and the pinned Tau Ceti has no graded-freeness theorem for retracts (searched `Algebra/Module/GradedModule/` and `Algebra/Category/GradedModuleCat/`), so neither headline duplicates the libraries. A remark, not a finding: the integral presentation and Schur basis of A_(a,N) in 2.11 is statable at the pins (MvPolynomial quotient, `Module.Free`, `TauCeti.schurPoly`) and would make a third acceptance statement if the author wants one.

**Seeded sample.** Sources read from the worker's cache; cache ids: `gmw` c6def817, `rw` 68b7a569, `bn` 7e8d5aad, `gw-cob` 7b8724ef, `bms` 732bca23, `qr-annular` 00cd15e4, `gw-annular` 2e8be60d, `etw` bf04543d, `kk` 54037c33, `wu-equivariant` d576f3ed, `wu-colored` e721bdcd, `carpentier` ceba48bb, `dw` aebbaf65, `erickson` e3c0e566, `sp` 5ced2cea and `baez-neuchl` ac35d433 (the last two fetched this round through the service, certified open-repository texts).

| Target | Locator read | Outcome |
| --- | --- | --- |
| 0.2 | GMW Def 2.1 p. 9 (`gmw line 357`), Def 3.1 p. 12 (line 498), Def 2.5 p. 10 (line 415); RW Def 2.1 p. 6 (`rw line 274`), Remark 2.2 p. 7 (301), Lemma 2.5 p. 8 (351) | Pages agree. RW's local models (three facets a, b, a+b at a binding with the stated orientation rule; six facets a, b, c, a+b, b+c, a+b+c at a singular point) match the README's three-sheet seam and six-corner vertex link. |
| 0.4 | GW Def 1, Ex 2 p. 1 (`gw-cob line 19`, 21), Lemma 8 p. 3 (133), Props 10–11 p. 4 (154, 184) | Lemma 8: a cobordism lies in the orientable-generated category iff each component has an even number of crosscaps; Ex 2 the Klein bottle; Cor 9 excludes the crosscap. Prop 11 sends the involution to the identity. All as the README states. |
| 0.7 | GMW Ex 2.10–2.11 p. 12 (`gmw line 481`, 488); RW Remark 2.13 p. 11 (`rw line 499`), Lemma 3.22 p. 25 (1360) | Labels ℕ₀ under addition, Dec(n) = ℤ[x₁..x_n]^{S_n}, equivariant version over ℤ[X₁..X_N]^{S_N}; zero-label removal. Agree. |
| 1.1 | RW Def 2.3 pp. 7–8 (`rw line 318`), Defs 2.11–2.12 p. 11 (469, 475), Lemma 2.5 p. 8, Prop 2.18 p. 12 (576); GMW Def 3.33 p. 27 (1159), (3.10) p. 27 (1175), Ex 3.39 p. 29 (1251) | RW's degree: −Σ a(N−a)χ(f) + Σ_interval bindings (ab + (a+b)(N−a−b)) − Σ_vertices (ab+bc+cd+da+ac+bd), d = N−a−b−c; the README's Conventions row is this formula (vertex term expands to (a+b+c)(N−a−b−c)+ab+bc+ca). Prop 2.18 states polynomiality. |
| 1.4 | BN Def 7.1 / Prop 7.2 printed p. 1470 (`bar-natan line 1258`, 1276; pdf page 28) | V free on v± of degrees ±1; Δ(v₊) = v₊⊗v₋ + v₋⊗v₊, Δ(v₋) = v₋⊗v₋, m as the README's table; torus value 2. Name reversal of unit/counit noted in R03. |
| 2.1 | GMW Lemmas 3.18–3.19 p. 20 (`gmw line 888`, 919); BHMV Prop 1.1 p. 886 | GMW: I₁ ⊂ I₂, both ideals; I₁(∅,W) = I₂(∅,W). Matches. BHMV not readable (below). |
| 2.2 | RW Remark 2.13 p. 11, Lemma 3.22 p. 25 | As 0.7. |
| 2.3 | RW Defs 2.11–2.12 p. 11 | Decoration and colouring definitions; a facet of label a > N has no a-subset of N colours, as claimed. |
| 2.9 | No external locator; a Foams transport result | Nothing to check against a source; the transport identities were checked by instance in the table below. |
| 3.3 | Mathlib `HasShift`, `ShiftedHom` at the pin; no external locator | Both declarations exist (`CategoryTheory/Shift/ShiftedHom.lean`); the sign convention was checked by instance below. |
| 4.2 | GMW Ex 4.30–4.31 p. 46 (`gmw line 2015`, 2028) | Hom(S,T) = eval(abs(Hom(S,T))){½(c(s)+c(t))}, c(s) = Σ c(x_i): the README's δ. |
| 5.1 | BMS Def 3.10 p. 45 (`bms line 2355`), Def 4.8 p. 91 (5023); GMW Thm 4.35 pp. 47–48 (`gmw line 2094`), Cor 4.37 p. 49 (2156), Constr 4.38–4.39 pp. 49–50 (2167, 2195), Remarks 4.40–4.42 pp. 51–53 (2226, 2334, 2340) | Thm 4.35 extends ∗ and # to a spatial duality in the sense of BMS Defs 3.10 and 4.8, with fold η_s and triangulator; Def 4.8 is the equality of the two natural transformations # → ∗#∗. Agree. |
| 6.6 | QR Prop 5.1 / Lemma 5.2 p. 19 (`qr-annular line 985`, 992), (5.4)–(5.5) pp. 19–20; GW Def 4.11 / Prop 4.13 p. 19 (`gw-annular line 1093`, 1101), Cor 4.20 / Remark 4.21 p. 21 (1218, 1230) | Lemma 5.2 is over ℂ[q,q⁻¹] and gives nested essential circles; Cor 4.20 is complex-linear, as the README says. The integral retract witnesses are correctly Foams targets. |
| 7.3 | ETW Def 2.10 p. 8 (`etw line 426`); BN Def 8.1 p. 1473 (`bar-natan line 1413`) | Canopolis of foams over disks; canopoly over a planar algebra. Agree. |
| 7.4 | BN Def 7.1 / Prop 7.2 p. 1470, Def 8.1 pp. 1473–1474; GW Lemma 8 / Props 10–11 pp. 3–4 | As above; Prop 7.2's proof kills S, T, 4Tu for this V. |

Other locators resolved on the way: RW Lemma 3.9 / Cor 3.10 p. 17, Prop 3.13 p. 19, relation (7) p. 16, Lemma 3.21 p. 24, Prop 3.32 with (8) and (10) p. 29, Thm 3.30 p. 27, Props A.13 p. 41 and A.16 p. 43; GMW Defs 3.9, 3.11–3.12 pp. 17–18, Prop 3.10 p. 17, Lemma 3.32 p. 26, Def 3.35 p. 28, Def 4.2 / Convention 4.3 p. 30, Constr 4.6 p. 32, Constr 4.9–4.11 pp. 33–34, Constr 4.13 p. 34, 4.17–4.18 pp. 35–36, Def 4.19 / Prop 4.20 p. 37, Constr 4.22 p. 39, Constr 4.28 p. 42, Thm 4.25 p. 40, Thm 4.29 p. 43; KK (13)–(16) p. 11 (`kk line 467`–488, with ⟨F⟩_RW = (−1)^{χ(F)/2}⟨F⟩ and χ(F) = Σ_i χ(F_i), the README's χ_lin); ETW Ex 2.5 / (2-1) p. 6 (`etw line 295`, 306: tr_a(s_α(A)s_β(A−S)) = (−1)^{C(a,2)}δ), Remark 2.24 p. 14 (761); Wu-equivariant Thm 2.10 / Remark 2.11 p. 9, Prop 3.13 p. 13 (proof to p. 22); Wu-colored Thm 2.4 p. 10, (2.3)–(2.6) p. 12; DW Def 5.1 p. 34, Remark 5.7 and (5.1.7)–(5.1.8) p. 37; SP Def 2.3 p. 90 (pdf 116), Defs 2.26–2.27 pp. 118–119 (pdf 144), Appendix C.1–C.2 pp. 271–282; Baez–Neuchl §2.1, Def 2, Lemmas 3–4 pp. 10–11 (`baez-neuchl line 461`–515); Erickson's notes (html). Every cited library declaration was opened at the pins: Mathlib `6b7abb3c`: `Coalgebra.IsFrobenius`, `LinearMap.IsPerfPair` (`LinearAlgebra/PerfectPairing/Basic.lean:39`), `MvPolynomial.weightedHomogeneousSubmodule` (`RingTheory/MvPolynomial/WeightedHomogeneous.lean:128`), `Bicategory.Strict`, `EnrichedOrdinaryCategory`, `ShiftedHom`, `GradedObject.Monoidal.tensorObj`, `MonoidalOpposite`, `Quotient.linear`, `MonoidalLinear`, `Bicategory.Adjunction` with `left_triangle`, `right_triangle`, `comp`, `MvPolynomial.esymmAlgEquiv`, `HasShift`; Tau Ceti as listed under R01 above and in R02.

**Ownership.** `roadmaps grep` over the 460 open pull requests and main for Robert–Wagner, prefoam, canopolis, gl(N) foam, foam evaluation and MOY finds no roadmap other than Foams building these objects (the "MOY" hits are Moy–Prasad). KhovanovHomology on main owns the rank-two object, circle tensors and formal surfaces, and Foams consumes them by section (K1 lines 92–166, K2 168–245, K3 247–341 read: the chosen coalgebra Δ(1) = 1⊗X + X⊗1, Δ(X) = X⊗X, degrees −1 for m, Δ and +1 for unit, counit, V⟨−1⟩ with X in degree −2, indexed tensors with unsigned braiding, enhanced-state basis, formal category with S, T, 4Tu and degree χ − r, and K3's closed evaluation Δ_q ∘ (mΔ)^g ∘ m_p killing S, T, 4Tu over ℤ). SurfaceTopology Layer 2 and PlanarTopology Layers 6–7 exist at the head of pull request #271 with the consumed content (permutation-triple and ribbon-graph comparisons; Euler characteristic and orientability; Schoenflies and tameness).

**Adversarial pass.** Coefficients ℤ unless stated; "pass" means the displayed instance agrees with the README, not a proof of the general target.

| Statement (README section) | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Headline 1, hypothesis (0.8) | A = ℤ[X]/(X²), ε(1)=0, ε(X)=1; ε(X)=2; ε(1)=1, ε(X)=0; R the zero ring | Gram matrices [[0,1],[1,0]] det −1 (perfect), [[0,2],[2,0]] det −4 (not), [[1,0],[0,0]] (not); zero ring: trivially perfect, unique zero coalgebra | pass; hypothesis excludes the two non-perfect traces |
| Headline 1, uniqueness (0.8) | A = R, ε = id; A = R×R, ε(x,y) = x+y | Δ(1) = 1⊗1; Δ(e_i) = e_i⊗e_i, forced by Δ(a) = (a⊗1)Δ(1) and (ε⊗id)Δ = id | pass |
| Headline 2 (2.8) | p = 0; p = id on Λ_N{3}; p = diag(1,0) on Λ_N{a}⊕Λ_N{b}; p(x,y) = (x, e₁x) on shifts (2,0) | empty basis; basis 1 of degree 3; basis (1,0) of degree a; p² = p and image basis (1, e₁) of degree 2 with second coordinate in Λ_{2−0} | pass, all three README Checks |
| Headline 2, N = 0 and m = 0 (2.8) | Λ₀ = ℤ, grading 0 d = ⊤ for d = 0 and ⊥ otherwise; m = 0 | basis of ℤ^m with degrees s_j; n = 0 for the zero module | pass; the theorem allows N = 0 as 2.8 says |
| Grading convention (Conventions, 0.10) | e₁ in Λ_N; weights 2(i+1) on X i | e₁ = X 0 has weight 2; a model with weights 2i would put e₁ in degree 0 | pass |
| Ordered labels (0.5) | (1,2) ↦ 3; S₃ rightmost-first | (12)(23) = (123), (23)(12) = (132) | pass |
| Quantum integers (0.9) | [0],[1],[2],[3]; [2]² | 0, 1, q⁻¹+q, q⁻²+1+q²; [2]² = q⁻²+2+q² = [3]+[1] | pass |
| Shift arithmetic (0.10, 3.3) | degree-3 element in M{2}; X{2}→Y{−1} degree 0; Hom⁰(f{2},g{−1}), Hom²(f{2},g{−1}) | 5; degree 3 map; Hom³, Hom⁵ via Hom^d(f{a},g{b}) = Hom^{d+a−b}, consistent with "degree-d map = degree-0 map to g{−d}" | pass |
| RW evaluation, N = 2 (1.1) | 1-sphere undecorated, decorated by x; 1-torus | colour 1: sign (−1)^1, Q = X₁−X₂; colour 2: sign +; sums 0, (−X₁+X₂)/(X₁−X₂) = −1; torus 1+1 = 2 | pass |
| Normalized evaluation (1.2) | same sphere at σ = 1; multiplier for sphere, torus, genus 2 of label a | (−1)^{χ_lin/2}·(−1) = +1 with χ_lin = 2; (−σ)^a, 1, (−σ)^{−a} | pass; matches KK (16) |
| Top-Schur traces (1.2, 2.11) | a = 0,1,2,3 | t_a(σ) = 1, σ, −σ², −σ³; at σ = ±1: 1,1,−1,−1 and 1,−1,−1,1; ratio t_{a+1}/t_a = (−1)^aσ; t_a(−1) = (−1)^{a(a+1)/2}, t_1(−1) = −1 equals the RW value of the x-dotted 1-sphere | pass |
| Repeated-incidence annulus (1.1) | a-annulus on one (a,0,a) seam with a zero disk, N = 2, a = 1; scalar r on the disk | erasure gives the a-torus: C(N,a) colourings each 1, so 2; r·2 | pass |
| Uncolourable local model (1.1) | positive a in both thin roles | S ⊔ S impossible for S ≠ ∅: no colouring | pass |
| Bar-Natan evaluation (1.3) | A = ℤ[X]/(X²), ε(X)=1: sphere, torus, genus 2; X-sphere; Klein bottle with identity involution | ε(1)=0, ε(2X)=2, h² = 0 so 0; 1; 2 | pass |
| Frobenius degrees (1.3, KH1) | c = 1, deg X = 2; c = −1, deg X = −2 | Δ(1) has degree 2 = 2c, ε degree −2; circle A{−1}: 1 in degree −1, X in degree 1; KH1: V = A{1}: degrees +1, −1; m(1⊗1): 2→1, Δ(1): 1→0, η: 0→1, ε(X): −1→0 | pass; agrees with BN v± degrees |
| Disk degrees (1.3, 4.2) | undecorated and X-decorated disk, c = 1 | −1 and +1; identity degree −c + δ = 0 with δ = c | pass |
| Handle (0.8) | h = mΔ(1) | 2X, ε(h) = 2, h² = 0; in characteristic 2, h = 0 | pass |
| Radical versus perfect (2.1) | B = 2xy on ℤ, then mod 2 | radical 0, not perfect; mod 2 radical 𝔽₂, quotient 0, while ℤ⊗𝔽₂ = 𝔽₂ | pass (negative control for base change) |
| Planarity test (2.4) | theta with τ = (aA)(bB)(cC), ρ = (abc)(ACB); ρ = (abc)(ABC) | faces (aC)(bA)(cB): 2−3+3 = 2; one 6-cycle: 2−3+1 = 0 | pass |
| Rescaling exponent (2.5) | birth and death of a counterclockwise 1-circle; composite sphere | E = (1+0−1)/2 = 0, (1+1−0)/2 = 1; factor r = (σ/τ)^1 | pass |
| Neck cutting (2.6) | dual numbers, a = b = 1 and a = 1, b = X | ε(a)ε(Xb)+ε(Xa)ε(b) = 0 and 1 = ε(ab) | pass |
| Hexagon relation (2.7), clockwise numbering | all boundary colourings, N = 3,4,5,6 (729, 4096, 15625, 46656) | failures 0, 0, 0, 0; N = 4 closed with mirror P_R: H_R 48 + Q_01 96 = H_L 108 + Q_34 36 = 144 | pass |
| Hexagon relation (2.7), counterclockwise numbering | same | failures 0 (N=3), 120, 240, 420 | fails: R01 |
| Square relations (2.7), clockwise | N = 2..6 | Q_01 = P_R + (N−2)R₀ and Q_34 = P_L + (N−2)R₀ fail on 0 colourings; N = 4 closures with mirror P_R: Q_01 96 = 64 + 2·16; with mirror R₀: Q_01 144 = 16 + 2·64 | pass |
| Square relations (2.7), counterclockwise | N = 2..6 | failures 8, 0, 96, 200, 360; reversed coefficients fail on 0 | fails: R01 |
| Hexagon at N = 2 (2.7) | 64 colourings | 12 failures of the N ≥ 4 form | not claimed by the README (separate N = 2 route) |
| Face identity (2.7) | planar cubic component | Σ(6 − len f) = 6F − 2E = 12 using 3V = 2E | pass |
| Retract to idempotent (2.7, 6.6) | vu = id; i(v) = (v,v), p(x,y) = x | p = uv has p² = p; pi = 1, ip = [[1,0],[1,0]] ≠ id | pass |
| Circle algebra N = 2, a = 1 (2.11) | x² = e₁x − e₂ | matrix of x: [[0,−e₂],[1,e₁]]; pairing [[0,σ],[σ,σe₁]], det −σ²; dual basis (σ⁻¹(x−e₁), σ⁻¹); at σ = ±1: (x−e₁,1), (e₁−x,−1) | pass |
| Complementary dual basis (2.11) | a = 2, N = 3, A = Λ₃[c₁,c₂]/(relations), basis 1, c₁, c₂, ζ₂ = coefficient of c₂, ε_σ = −σ²ζ₂ | s_(1)(A−S) = −b₁, s_(1,1)(A−S) = b₁²; claimed duals −σ⁻²b₁², σ⁻²(e₁−c₁), −σ⁻²; all nine pairings δ_ij using c₁² = c₂+e₁c₁−e₂, c₁c₂ = e₁c₂−e₃, c₂² = e₂c₂−e₃c₁ | pass; sign (−1)^{a(a−1)/2} = −1 confirmed |
| Top label (2.11) | a = N = 2 | A = Λ₂, ε_σ(1) = −σ², dual −σ⁻² | pass |
| Circle ranks (2.11) | (N,a) = (2,0),(2,1),(2,2),(2,3) | 1, 2, 1, 0 | pass |
| Boundary weight (4.1) | identity a-strand; merge a = b = 1, N = 3 | w = a(N−a) = half-sum of two ends; w = 2+2+2−3 = 3 = (2+2+2)/2; general identity w_N(merge) = a(N−a)+b(N−b)−ab = half the boundary sum | pass; δ integral |
| Identity degree (4.1) | a-strand closure | disk degree −a(N−a), shift δ = a(N−a), total 0 | pass |
| Hom-object versus underlying maps (3.1, 3.2) | V = GrMod_ℤ, ℤ{1}; End(Λ_N) | (ℤ{1})₁ = ℤ ≠ 0 but Hom(ℤ,ℤ{1}) = ℤ_{−1} = 0; End⁰ = ℤ, End• = Λ_N | pass |
| Adjunction degrees (5.1, 6.2) | a = b = 1; a = 1, b = 2 | zip/unzip ab = 1, blisters −1; unit of M ⊣ S{−1} in Hom⁰(id,(M≫S){−1}) = Hom¹; counit in Hom⁻¹; degrees 2 and −2 with S{−2}, M{2} | pass |
| KH2 degrees (2.13) | one and two circles | 1, −1; 2, 0, 0, −2; swap of 1⊗X and X⊗1 with +1 | pass |
| KH3 maps (6.1) | η, ε, m, Δ on 1, X | 1↦1; 1↦0, X↦1; (1,X,X,0); 1↦1⊗X+X⊗1, X↦X⊗X; split then merge 1↦2X, X↦0 | pass; equals BN Def 7.1 with v± = 1, X |
| KH4 degrees (7.4) | 2r ports identity; birth, death | χ = r, χ − r = 0; χ = 1, r = 0: degree 1 each | pass |
| Unoriented domain (0.4) | torus, Klein bottle, Möbius band | genus 1 / crosscap 2 both χ = 0 and allowed; crosscap 1 excluded (GW Cor 9) | pass |
| Zero-label erasure (0.7, 2.2) | (a,0,a) vertex; zero facet decorated by 3 | edges join; scalar 3 retained | pass |
| Specialisation gradedness (0.10, 2.9) | e₁ ↦ 1; e_i ↦ 0 | 1 ∉ degree 2: ungraded; 0 homogeneous: graded | pass |

**Not reviewed as findings.** The supplier links for SurfaceTopology and PlanarTopology point at the fork branch of pull request #271; the citations name roadmap and section, which is the rule. The README lists an unnamed "web-calculus" and "link-homology" roadmap as downstream consumers, which binds nothing.

**Manifest note for the worker.** The sources service, invoked with the brief's command, created an untracked `packages/Foams/sources.toml` in the board checkout while fetching the three uncached texts (`sp` arXiv 1112.1000v2 certified; `baez-neuchl` arXiv q-alg/9511013v2 certified; `bhmv` DOI 10.1016/0040-9383(94)00051-4 uncertified). This review edits no manifest, so that file was removed again; the fetched texts remain in the cache under the ids above.

## Not verifiable

- Blanchet–Habegger–Masbaum–Vogel, Proposition 1.1 and the universal construction, Topology 34 (1995) p. 886 (2.1): the service resolves the DOI only to a paywalled Elsevier page and records it `uncertified`; no bypass was attempted. GMW Lemmas 3.18–3.19 were read as the foam adaptation, which does not certify the BHMV numbering or page.
- The q-polynomial form of the 2.7 relations and their lifts to inverse foam identities: only q = 1 colouring counts were computed; the categorical witnesses are targets the README assigns to itself.
- The higher coherence equations of Layers 3 and 5 (Schommer-Pries Appendix C, BMS Definition 3.10 (c)–(d)) were located but not checked term by term against Goertz–Marino–Wedrich's convention; no error is alleged.

## Source issues

- none

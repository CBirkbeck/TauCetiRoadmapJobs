<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/521#issuecomment-6312937324 -->
Review (claude) of d209acf

Verdict: needs_changes

1. **F01** (P2) Two classical-group gaps ask for schemes Tau Ceti already has

   **Location.** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:75` (`gap:classical-group-points`: "supply the smooth connected classical group schemes, their isometry point functors and base changes"), line 77 (`gap:orthogonal-scheme-points`: "supply affine O_Q and determinant-one SO_Q schemes with the rank-zero and rank-one cases explicit … scalar-extension compatibility"), lines 13 and 49–53 (the "Already in the pinned libraries" list and the Tau Ceti contract, which cite neither); `plan.json:2728` and `plan.json:2742`.

   **Claim.** The symplectic and orthogonal affine group schemes, their point identifications, base change, smoothness, connectedness and the rank-0/1 special orthogonal cases are missing from every pin and must be supplied by ReductiveGroupsPartII.

   **Witness.** Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` has `TauCeti/Algebra/AlgebraicGroup/ConstantForm/Basic.lean` (subgroup scheme of `GL n` preserving an arbitrary constant matrix `C`, points `M C Mᵀ = C`, over any commutative ring including `n = 0`), `Orthogonal/Basic.lean` (`TauCeti.Orthogonal.groupScheme`, `pointsMulEquiv` onto `Matrix.orthogonalGroup`), `SpecialOrthogonal/Basic.lean` (`TauCeti.SpecialOrthogonal.groupScheme`, `inclusion`, `pointsMulEquiv` onto `Matrix.specialOrthogonalGroup`, `pointsMulEquiv_mapValue`), `SpecialOrthogonal/BaseChange.lean` (`coordinateHopfAlgebraBaseChangeIso`), `SpecialOrthogonal/Smooth.lean` (`instSmoothCoordinateHopfAlgebra`, needs `Invertible 2`), `SpecialOrthogonal/Connected.lean` (geometric connectedness away from characteristic 2), `SpecialOrthogonal/LowRank.lean` (`definingHopfIdeal_zero`, `definingHopfIdeal_one`, rank 0 and 1 reductive), `SpecialOrthogonal/Reductive.lean`; and `Symplectic/{Basic,Scheme,BaseChange,Smooth,Connected,Reductive}.lean` (`TauCeti.Symplectic.groupScheme`, `pointsMulEquiv` onto `TauCeti.GLSymplecticFin`, `schemePointsMulEquiv`, `coordinateHopfAlgebraBaseChangeIso`, smooth over every ring, geometrically connected and reductive over every field). `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean` proves every nondegenerate alternating form over a field has a symplectic basis, so the standard form is the only alternating form up to isometry. The design's duplication table (repair report, "Source and pinned-library checks") did not search `Algebra/AlgebraicGroup`.

   **Exact repair.** (1) Add these declarations to "From Tau Ceti" and to the "Already in the pinned libraries" sentence, with their hypotheses (standard form; SO smoothness and connectedness need 2 invertible; nothing assumed of `C` in the constant-form construction). (2) Rewrite `gap:orthogonal-scheme-points` to ask only for what is missing: for a nondegenerate quadratic `Q` with Gram matrix `C` over a field with 2 invertible, the identification of the points of the pinned constant-form scheme at `C` (and of its determinant-one cut, built as the pinned SO is built from `TauCeti.Orthogonal` by joining the determinant kernel) with the OrthogonalSpinGroups Layer 0 point groups, transport along Gram-matrix change, and the topological identification with the local isometry groups over every local field of characteristic different from 2. (3) Rewrite `gap:classical-group-points` to ask only for the unitary schemes of epsilon-Hermitian forms over quadratic étale `A/F` including split `A`, their point functors, base change and local topological identification, citing the pinned symplectic scheme and symplectic-basis theorem for the alternating case instead of requesting it. (4) In `gap:hermitian-witt` (line 73), name `TauCeti.LinearAlgebra.BilinearForm.SymplecticBasis` as the pinned alternating trivial-involution specialization beside the quadratic one. Mirror every change in `plan.json` (`gaps[].needs`, `detail`) and in the consumers' `*Needs:*` lines (§1.2, §1.4, §2.2, §3.7, §3.8, §6.1, §7.2).

2. **F02** (P3) §3.6 stops short of the two reductions the design now owns

   **Location.** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:399`: "for every irreducible smooth admissible representation of a Hermitian relevant pair of arbitrary odd codimension … or a symplectic/metaplectic relevant pair of arbitrary even codimension"; `plan.json:741`.

   **Claim.** The higher-codimension multiplicity-one theorem is stated for exactly the two types whose reductions are §3.3 and §3.4.

   **Witness.** §3.7 (SO Bessel induction, with Waldspurger's SO basic case in §3.1) and §3.8 (skew-unitary Fourier–Jacobi induction, with Sun's Theorem C in §3.1, sun line 102) give the same argument for special orthogonal pairs of arbitrary odd codimension and skew-Hermitian pairs of arbitrary even codimension; the auxiliary irreducible induction is already in `gap:bernstein-exclusions`. A general library states all four types; §3.5 line 371 itself says larger-codimension conclusions follow from "a proved reduction valid for that group and field".

   **Exact repair.** Extend `GGP.higherCodimensionMultiplicityOne` (or add two clauses with their own locators, ggp §19 line 2661–2700 and sun Theorem C) to special orthogonal pairs via §3.7 and to skew-Hermitian pairs via §3.8, with `*Needs:*` §3.7, §3.8 added, and two Checks: the SO(3)/SO(0)-type pair that §3.7 reduces to Waldspurger's codimension-one case, and the skew-Hermitian U(W) ⊂ U(W ⊕ hyperbolic plane) pair reduced to Sun's equal-rank case.

3. **F03** (P3) Spurious supplier dependencies on definition targets

   **Location.** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:218` (§1.3 `*Needs:*` … `gap:enhanced-classification`); line 456 (§4.1 `*Needs:*` … `gap:smooth-functors`, `gap:casselman-wallach`); `plan.json:152` and `plan.json:873`.

   **Claim.** Defining relevance of a marked pure inner twist needs the enhanced local classification, and constructing the component-group sign domain of a Weil–Deligne parameter needs the smooth and Casselman–Wallach categories.

   **Witness.** §1.3's statement uses only form data, Witt cancellation and the §1.2 subgroup ("define relevance by existence of a nondegenerate isometric inclusion W′ ↪ V′ whose complement is isometric to C"); its API `refl`, `transport`, `complement` mention no representation. §4.1's statement and API (`generator`, `determinant`, `transport`) concern `C_M`, `A_M` and eigenspaces of a parameter only. The two citations make Layer 1 and the first target of Layer 4 depend on the analytic suppliers without consuming anything from them.

   **Exact repair.** Delete `gap:enhanced-classification` from §1.3's prerequisites and `gap:smooth-functors`, `gap:casselman-wallach` from §4.1's, in README `*Needs:*`, layer Dependencies and `plan.json`; update the three gaps' `neededBy` lists. (The packet-marking remark in §1.3 belongs to §4.6, which already cites the classification.)

4. **F04** (P3) §5.1 omits the fixed norm datum of its primary source

   **Location.** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:580`: "a Hermitian relevant pair of any odd codimension … its labels agree with §§7.7 and 8.3 and §4.4 under the specified Whittaker/additive-character normalization"; `plan.json:1282`.

   **Claim.** The hypotheses of bp-refined Theorem 8.5.1 are the field, the relevant pair, temperedness and the §7.2 classification laws.

   **Witness.** bp-refined line 713 fixes "un élément ν0 ∈ Fˣ" for the whole article; the hypothesis 4.1(1) (bp-refined line 806–807) requires the residual line of the complement to have norm ν0 (resp. −ν0), and the sign μ(G) of the dichotomy (line 715–719) and the packet labeling of §§7.7, 8.3 depend on it.

   **Exact repair.** State in §5.1 that the normalization data include a fixed ν0 ∈ Fˣ with the complement's residual line of norm ±ν0 as in bp-refined 4.1(1), that μ(G) and the labeling are taken relative to it, and that every norm class is covered by varying ν0; carry the same clause into `gap:enhanced-classification`'s `needs` where it names "the labeling of §§7.7,8.3".

Files reviewed, read-only: `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md`, `packages/GanGrossPrasadConjecturesForClassicalGroups/design/plan.json`, `packages/GanGrossPrasadConjecturesForClassicalGroups/sources.toml`, against the round-1 review (ten findings) and its repair report `packages/GanGrossPrasadConjecturesForClassicalGroups/reports/FIX-DESIGN-GanGrossPrasadConjecturesForClassicalGroups~2.md`. Four findings: one P2, three P3. One blocking.

## Round-1 findings, checked one by one

| Id | Status | Repaired passage (README) |
|---|---|---|
| F01 (P1) unowned connected reductions | repaired | §3.7 `GGP.specialOrthogonalBesselInductionReduction` (line 377) and §3.8 `GGP.skewUnitaryFourierJacobiInductionReduction` (line 389) are owned theorem targets with groups, Bernstein exclusions, unnormalized induction, splitting data, proof routes and three Checks each; §4.8 line 560 "apply §3.7 for SO … §3.8 for skew-Hermitian U"; `gap:connected-reductions` is gone from plan and README. |
| F02 (P1) nonzero functional | repaired | §2.2 line 258: "an A-linear surjection ell : X → A (a unimodular functional)"; "In the split algebra both component functionals must be nonzero"; API `GGP.fourierJacobiQuotient_surjective`; Checks `fj_split_idempotent_rejected`, `fj_split_surjection`. |
| F03 (P2) degenerate split Bessel data | repaired | §2.1 line 240: "choose e generating the free residual A-line L (so B(e,e) ∈ Fˣ)" and "require psi_A(x) = psi_F(Tr(A/F)(c x)), with c ∈ Aˣ"; API `GGP.besselCharacter_simpleRoots`; Checks `bessel_split_vector_rejected`, `bessel_split_character_rejected`, `bessel_split_GL3_generic`. |
| F04 (P2) compound gaps | repaired | 40 named gaps (README lines 73–159, plan `gaps`), each with one `needs` sentence identical in plan and README and `neededBy` equal to its actual consumers (checked by script). |
| F05 (P1) orthogonal supplier drift | repaired as filed | Line 11: "OrthogonalSpinGroups Layer 0 supplies arbitrary-form orthogonal point groups; Layers 2–3 supply their ℝ/ℚ_p topology"; line 77 declares `gap:orthogonal-scheme-points` for ReductiveGroupsPartII. OrthogonalSpinGroups §3A (its README line 750) confirms the scheme comparison is not built there, and `OrthogonalTamagawaAndLatticeMass` exists nowhere (merge order, board, main). The new gap is, however, not minimal: see R01. |
| F06 (P2) two owners of P1 | repaired | §5.4 line 606: "imply equal-rank Fourier–Jacobi selection (FJ)… P1 is neither an output nor an enhancement prerequisite of this bridge"; line 13 keeps P1 with MetaplecticAutomorphicForms. |
| F07 (P2) local normalized sums out of domain | repaired | §8.1 line 878: "Separately, for tempered sigma_v in the ordinary normalization domain of §7.5, define J_v(fv)…"; "Global cuspidality is not a local temperedness hypothesis"; Check `relative_character_divergent_rejected`. |
| F08 (P2) ambient convolution measure | repaired | §8.1 line 878: "Fix dg_Tam on Gh(A), dt_Tam on Hh(A) and positive local measures with product dg_v = dg_Tam"; §8.5 line 946 gives the source conversion dK_Tam = (Delta_K^*)⁻¹ ∏ Delta_K,v dK_v^src and the special tensor (bpcz line 4891–4892); Checks `factorization_G_single_rescaling`, `factorization_G_compensated`. |
| F09 (P3) primary locator for §5.1 | repaired | §5.1 line 580 cites bp-refined Theorem 8.5.1, printed p. 71, bp-refined line 2891–2901, with §§7.2, 7.7, 8.3 and the precursor bp-unitary-tempered Theorem 18.4.1; both entries are in `sources.toml` as certified. |
| F10 (P3) ordering reservation prose | repaired | No "reservation" sentence remains in README or plan (grep); the gate now places the candidate after MetaplecticAutomorphicForms. |

No round-1 finding was marked "not actionable", so nothing is re-raised.

## Verified sound

**Principles.** No route-specific shortcut: dyadic and ramified places, split algebras, archimedean places, all codimensions and function fields (for the conjecture propositions) are in scope, and each proved theorem carries its source's field range. No existing roadmap is re-planned (no GGP, Bessel, Fourier–Jacobi, Jacquet–Rallis or Casselman–Wallach target on main, in the three open roadmap pull requests, or in the board; QWittVectors and ErdosProgressionPowers have no related term, ArithmeticDynamics only names GrossZagierAndArithmeticHeights). Supply direction: all twelve suppliers are on main (ReductiveGroups, OrthogonalSpinGroups, GlobalNumberFields, Completed/RestrictedProducts, with the cited layers present: ReductiveGroups Layers 0, 3, 5, 7; OrthogonalSpinGroups Layers 0, 2, 3; RestrictedProducts Layers 1–3; GlobalNumberFields Layers 0, 4, 5, 8, 9) or earlier in the merge order (positions 20, 21, 29, 58, 72, 74, 110, 111). No copied passage, no algorithm, no `set_option`, no sorry'd data, no LaTeX delimiters, no pull-request number, no machine path, no process word (the only "lemma" is "fundamental lemma"; "reservation" occurs only inside "preservation"). Gate output, exit 0:

```text
candidate: GanGrossPrasadConjecturesForClassicalGroups is not in the merge order yet; checked as if placed after MetaplecticAutomorphicForms (the intake inserts it when its design is accepted)
depcheck: 4 roadmaps, 29 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The package-stage candidate path named in the brief does not exist at design stage (`FileNotFoundError`), so the design README was used, as in round 1.

**Seeded sample, 15 targets, all verified at the cached text.** Page numbers are those of the recorded versions.

| Target | Checked at | Outcome |
|---|---|---|
| 2.4 Restriction functionals | ggp §14, pp. 57–58, line 2012–2059 | `Hom_H(π⊗ν,C)` is the source's space; the ν/ν∨ conjugacy remark (line 2051–2053) and the archimedean caveat (line 2054–2058) are both carried. |
| 3.8 Skew-unitary FJ induction | ggp line 2699–2700 ("we omit the details"), Theorem 16.1 line 2293–2301, mixed model line 2311–2317, splitting line 1823–1830 | Correctly an owned extension; unnormalized induction, Bernstein exclusion, Hom-to-oscillator form and μ-restriction match. |
| 4.1 Component signs | ggp §4, pp. 13–14, line 477–532 | `A = (Z/2)^k`, one generator per same-type summand, `M^{a_i} = M_i`; Checks `component_multiplicity_two`, `component_hyperbolic_pair`, `component_det_kernel` computed correctly. |
| 4.2 Conjugate-dual characters | ggp Theorem 6.1, p. 20, line 726–737 | Descent, triviality for equal signs, and the change law `η^{dim N}` with `η(a) = (−1)^{dim M^a}` match. |
| 4.4 Distinguished character | ggp §17, pp. 68–70, line 2413–2478 | SO: `χ_N × χ_M` on `A_M × A_N^+`; Hermitian: Whittaker datum scaled by `−2δ` (line 2430); Sp/Mp: `N1 = N ⊕ C`, restriction along an index-1-or-2 embedding (line 2447–2451); skew-Hermitian odd: `ψ0 = ψ(Tr(e·))`, `N(μ⁻¹)` (line 2463–2468); even: ψ-independence (line 2477). |
| 4.5 Normalization changes | ggp §18, pp. 71–75, line 2488–2630 | Hermitian `(−1)^{dim M^a}` (line 2513), skew-Hermitian odd `(−1)^{dim M^a + dim N^b}` (line 2608), form scaling, μ-change via `ν_{μ′} ≅ μ0·ν_μ` (line 2623). The source's line 2627 writes `π·μ0⁻¹`; the README's reassociation convention (Check `change_mu_two_terms`) is the correct one and does not copy the misprint. |
| 4.7 Split selection | ggp Theorem 17.2, p. 68, line 2394–2405 | Codimension 0 or 1 over any local field; all codimensions nonarchimedean; singleton packets, trivial character. |
| 5.3 Generic Bessel | gan-ichino Proposition 9.3, p. 50, line 2491–2501 and Proposition 9.4 line 2502–2510 | Generic parameters, ordered exponents `s1 ≥ … ≥ sr ≥ 0`, tempered remainders, `m(π,π′) = m(π0,π′0)`. |
| 5.4 Theta bridge | gan-ichino §1.4, p. 3, line 90–119 | Seesaw (line 97), (Θ), weak P1/P2 (line 103–114), Proposition 1.2 "Assume (B) and (P2). Then (FJ) and (P1)" (line 116); only FJ is taken. |
| 6.1 Adelic Bessel period | ggp §23, pp. 86–88, line 3036–3092; §22 line 2908 | Relevant global pair, non-split-plane exclusion (line 3044), `ν = ψ∘l_A` (line 3083), `F(ν)` (line 3087–3092), anisotropic-center finite-volume convention. |
| 6.3 L-representation | ggp §24, pp. 89–90, line 3151–3171; Lemmas 3.4–3.5 line 424–437; §22 table line 3019–3025 | `M⊗N`, `Ind(M⊗N)`, `Ind(M⊗N(μ⁻¹))`; symplectic sign by Lemmas 3.4–3.5; split product and `abs(L)^2` (line 3184–3188). |
| 6.5 Unitary period datum | bpcz §§1.1.2–1.1.5, pp. 2–3, line 81–134 | Norm line `h0`, `U(h) × U(h ⊕ h0)`, diagonal, `Ph`, weak base change at almost all split places (line 108–111), `S_Π` (line 103–107). |
| 7.5 Normalized unitary local form | bpcz §1.1.6, p. 4, line 148–169 | `L(s,σ)` quotient (the extraction flattens the fraction bar; at `s = 1/2` it is `∏ L(i,η^i) L(1/2,Π) / L(1,σ,Ad)`), temperedness for convergence and regularity (line 166–167), spherical value `vol(U′_h(O_v))` (line 169). |
| 7.7 Invariance | bpcz Theorem 1.1.6.1, pp. 4–5, line 179–192 | Tamagawa measures with global normalizing L-values (footnote line 184), `dTam_h = ∏ dh_v` (line 188), nonzero factorizable vectors, local pairings free; scaling computations (4 for `2i`, reciprocal `c, c⁻¹`) correct. |
| 8.3 Isolated comparison | bpcz §§10.1.3–10.1.6, pp. 87–88, line 4712–4767 | `S0`, `H°`, `S′0`, `X_h0`, the five test-function conditions 1–5 and `∑_h J = 2^{−dim a_P} I_Π = 2^{−dim a_P} I_{P,π}` match exactly; `2^{−dim a_P} = |S_Π|⁻¹` (line 4945). |

**Further locators spot-checked:** ggp §2 (relevance and Lemma 2.1, line 217–257), §12 (`H`, Bessel coordinates line 1624–1634, Heisenberg factor 2 line 1708–1722, FJ character line 1761–1767, split Bessel data line 1940–1956), Theorem 14.1 line 2068–2072, Theorem 15.1 line 2158–2162; bp-refined 4.1 (line 798–826), Theorem 8.5.1 (line 2891–2901); bp-arch §12.3 STAB/TRANS/WHITT (line 11151–11167) and Theorem 12.4.1 (line 11200–11205); ichino-ikeda `n ≥ 2` and non-hyperbolic `V0` (line 128–131), `Δ_{G_i}` (line 146–153), U1–U6 (line 181–188), `α_v` (line 231), Proposition 1.1 and Theorem 1.2 (line 234–239), Conjectures 1.4, 1.5, 2.1 (line 252–267, 395–400); harris Proposition 2.1 (line 250) and Theorem 2.12 (line 1289–1294, bad set includes even and archimedean places, line 172–174); sun Theorems B and C (line 31–42, 102–104); sun-zhu Theorems B and C (line 66–68, 94–96); waldspurger Theorem 1 (line 10–18); bplzz `n > 1`, Definition 1.5, Theorems 1.8 and 1.10 (line 127–186). All agree with the README's statements and hypotheses.

**Pinned declarations cited by the design** (read at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`): `Representation.IntertwiningMap` with `ext`, `isIntertwining` and `Module A` instance (line 488); `ContRepresentation`, `ContIntertwiningMap`, `toIntertwiningMap`, `ext`, `trivial` (line 431); `QuadraticMap.polar`, `polarBilin`, `polar_self` (`2 • Q x`); `LinearMap.IsSymm`, `IsAlt`; `Matrix.unitaryGroup`, `mem_unitaryGroup_iff` (`A * star A = 1`); `ContRepresentation.intertwiningMapEquiv` with exactly the stated hypotheses (`NontriviallyNormedField`, `CompleteSpace`, `T2Space V`, `FiniteDimensional 𝕜 V`, `ContinuousSMul`); `Representation.IsInvariantSesqForm` and `.apply`; `QuadraticForm.exists_equivalent_hyperbolicPresentation_prod`; `TauCeti.equivalent_of_equivalent_prod` (finite-dimensional nondegenerate common summand); `TauCeti.hilbertSymbol`, `hilbertSymbolOnSquareClasses`, `hilbertSymbolOnSquareClasses_squareClass`; `TauCeti.HeisenbergGroup`, `mul_z` (`z + z′ + x y′`), `commutatorElement_eq`; `TauCeti.Matrix.isCompact_unitaryGroup` (`RCLike`); `Matrix.UnitaryGroup.toLinearEquiv_apply`. All exist with the hypotheses the README states; the `z_half = z − xy/2` comparison in `gap:heisenberg-svn` is correct (the half-commutator law follows by direct computation).

**Adversarial pass.** Every target, API statement and Check was instantiated; conventions were recomputed from the witnesses. "Retained" means the stated domain survived; it is not a proof.

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| Conventions | `Q(x) = x²`, alternating plane, `a = i` on a hyperbolic Hermitian plane, split line `(a,a⁻¹)`, `q = 2, s = 1`, vector `2i`, measures `c, c⁻¹`, Asai degrees 1, 2, constituent totals 2, 3 | `B(1,1) = 2`; `(1,−1)`; both partners scale by `i`; `L = 2`; squares scale by 4; product invariant only under reciprocal rescaling; signs `+,−`; factors `1/4, 1/8` | none |
| 1.1 `RelevantPair` | zero skew pair, `0 ↪ ⟨1⟩` over ℝ, positive real plane, `i·diag(1,1)` over ℂ/ℝ, split `A` rank | parity and splitness distinguish; A-rank not doubled | R01 (cite pinned symplectic basis) |
| 1.2 `relativeSubgroup` | complement rank 0, 1; `j(1,g)`, `j(u,1)` | diagonal at the boundary; coordinates `(n·i(g),g)` as ggp line 250 | R01 (schemes) |
| 1.3 `IsRelevantInnerForm` | `C = 0`; `(3,1)` versus `(1,3)` with positive line; split GL | `(1,3)` has the same discriminant but complement `(0,3)`, not `(2,1)`: correctly rejected; GL has no pure twists (Lemma 2.1) | R03 (spurious Needs) |
| 1.4 `splitPairEquiv` | `V0 = F` with `a`; `V0 = 0` | `(a,a⁻¹)` forced by the pairing | none |
| 2.1 `besselCharacter` | `r = 0`; `(x1,z) = (1,−1)`, `(t,0)`; `e = (1,0)e0`; `ψ_F(x)`; GL3 | empty character trivial; both degenerate split inputs kill a root; generic control sees both | none |
| 2.2 `fourierJacobiQuotient` | `A = F`, rank 1, `B(e,f) = 1`; `W = 0`; `X = 0`; `ℓ = (1,0)·`; `ℓ = id` | commutator 2 (ggp line 1708); zero center map for the idempotent; identity surjects | none |
| 2.3 `fourierJacobiRepresentation` | `V = W`; genuine/nongenuine `π`; `W = 0` | sign product `(−1)(−1) = 1`; oscillator retained at equal rank | none |
| 2.4 `Model` | trivial group; zero representation; `Mp(0) = C2` with `ν = sign`; countable direct sum | dimensions 1, 0, 0 or 1 by genuineness, infinite (finrank would give 0) | none |
| 3.1 nonarchimedean basic | `ℚ_2`; SO(1)/SO(0); O versus SO | dyadic fields included; SO via Waldspurger, not by restriction from O | none |
| 3.2 archimedean basic | `p = q = n = 0`; algebraic dual | one-dimensional continuous dual; continuity essential | none |
| 3.3 Bessel induction | no `Y′` of the required dimension; forbidden support | vacuous exclusion; comparison not asserted on the bad component | none |
| 3.4 symplectic FJ induction | `X = 0`; missing `χ_ψ` | excluded; ill-typed Hom | none |
| 3.5 `MultiplicityOneAssertion` | SO(1)/SO(0); `C²` of the trivial group; undistinguished `π` | bound holds; irreducibility needed; zero multiplicity allowed | none |
| 3.6 higher codimension | basic boundary; `ℚ_2`; SO and skew-Hermitian pairs | Hermitian and symplectic ranges sound; SO and skew-Hermitian not stated though reducible by §3.7/§3.8 | R02 |
| 3.7 SO induction | SO(0) remaining factor; maximal isotropic `Y′`; Witt index below `dim Y` | orbit computation needed; exclusion empty when no `Y′` | none |
| 3.8 skew-unitary induction | Levi element with `det_E = a`; `μ′` on `W0` only; `X = 0` | `μ(a)μ(a)⁻¹` cancels leaving `abs(a)^{1/2}`; mismatched splitting leaves a twist; excluded | none |
| 4.1 `parameterSignDomain` | `M = 0`; `T ⊕ T`; `P ⊕ P∨`; two odd orthogonal summands | orders 1, 2, 1, 2 with `A^+ = {(1,1),(−1,−1)}` | R03 (spurious Needs) |
| 4.2 `conjugateRootCharacter` | `N = 0`; generators `−1, +1`; `dim M^a = dim N = 1` versus `dim N = 2` | `ε(0) = 1`; product `−1`; sign reverses only for odd `dim N` | none |
| 4.3 `selfdualRootCharacter` | `M = 0`; two symplectic; `P ⊕ P∨` with `P = sgn·abs^{it}`, `N = 1`; `M = 1 ⊕ sgn`, `a = −1`, `N = 1 ⊕ 1` over ℝ | trivial; trivial; `ε(M) = i² = −1` against `ε(0) = 1`, odd `N` rejected; `ε(M⊗N) = i⁴ … = −1`, `det(M^a)(−1) = −1`, `χ = +1` | none |
| 4.4 `distinguishedCharacter` | split GL; `N` the trivial line; eigenvalues `z, u` | trivial group; `N1` even, `A_{N1}^+` trivial; `z/u` not `zu` | none |
| 4.5 `selectionChangeData` | identity; nonnorm `t` with `dim M^a = 1`; scalar `κ = u` | identity maps; label reverses; reassociation `zu` (source line 2627 misprint not copied) | none |
| 4.6 `LocalSelectionAssertion` | singleton GL packet; two forms; nongeneric `φ` | existence and uniqueness across forms; nongeneric outside quantifier | none |
| 4.7 split selection | GL2 × GL1; higher codimension at ℝ | singleton, `χ = 1`; archimedean higher codimension correctly excluded | none |
| 4.8 reduction | each of four types; ℝ, ℂ | separate reductions used; archimedean excluded (Check) | none |
| 5.1 tempered Bessel | ramified quadratic extension of `ℚ_2`; both norm classes of the residual line | in scope; `ν0` datum implicit | R04 |
| 5.2 standard modules | `r = r′ = 0`; unordered exponents | identity; ordering required | none |
| 5.3 generic Bessel | non-tempered generic standard module | reduces to tempered remainders by §5.2 | none |
| 5.4 theta bridge | zero lift; nonzero lift | only the nonzero tower contributes; FJ only | none |
| 5.5 generic FJ | wrong `μ` restriction; `ℚ_2` extension; `r > 0` | rejected; included; §4.8 | none |
| 5.6 inner-form uniqueness | many real forms; `F = ℂ`; wrong Whittaker labeling | all signatures searched; split place via §4.7; WHITT needed | none |
| 6.1 global Bessel | `f = 0`; `ν = 1`; SO of a split plane; GL1 center | zero; diagonal; `G_m` quotient infinite volume; center quotient | none |
| 6.2 global FJ | `φ = 0`; cover kernel; `ψ` nontrivial on `F` | zero; signs cancel; no descent | none |
| 6.3 `distinguishedLRepresentation` | `M = 0`; `dim M = 2, dim N = 1`; split | `L = 1`; `dim R = 2` not 4; `abs(L)^2` | none |
| 6.4 `GlobalNonvanishingAssertion` | local models nonzero with `L(1/2) = 0`; one zero local model; zero vector | each clause necessary | none |
| 6.5 `UnitaryPeriodDatum` | `ℚ(i)` norm line at `1, i, 1+i`; zero form; two `h` | norms `1, 1, 2`; `Ph(0) = 0`; separate data | none |
| 7.1 `orthogonalDelta` | `d = 2, 3, 4`; `diag(1,−1)`; global split plane | `L(1,χ)`, `ζ(2)`, `ζ(2)L(2,χ)`; trivial `χ`; pole of `ζ(s+1)` at 0 | none |
| 7.2 `orthogonalLocalPeriod` | zero vector; `f0 ↦ i f0`, `f1 ↦ i f1`; singular quotient | `I = 0`; factors `−i`, `i`; no scalar `α` | none |
| 7.3 tempered/spherical | measure doubled | `α = 2` | none |
| 7.4 `OrthogonalRefinementAssertions` | centralizer orders 2, 4; `dt_v ↦ 3 dt_v`; ALG; zero vector | `1/8`; `α·C0` invariant; ALG is not temperedness; `0/0` excluded | none |
| 7.5 `unitaryNormalizedLocalPeriod` | `(0,g)`; `(if, ig)`, `(if, g)`; `2Cv`; split place `q = 2`, `s = 1` and `s = 0` | `0`; `1`, `i`; halves `α`; `L = 2`, pole at 0 | none |
| 7.6 convergence/spherical | compact volume 2; complex split place | `α = 2`; genuine `GL(n,ℂ)` integral | none |
| 7.7 invariance | `2i`; `c, 1/c`; one place doubled | 4/4; invariant; doubles | none |
| 7.8 `unitaryGlobalConstant` | `(r_n, r_{n+1}) = (1,1), (1,2)`; `n = 1`; zero central value | `1/4`, `1/8`; `L(1,η)L(2,1)`; `C = 0` defined | none |
| 8.1 `relativeCharacters` | basis vector `ie`; empty `X`; `Ph = 0`; trivial representation on split `F_vˣ`; rank-one operator | phase cancels; `0`; `0`; divergent, rejected; `α_v(f,f)` | none |
| 8.2 linear contribution | irrelevant datum; 2 and 3 constituents | `0`; `1/4`, `1/8` | none |
| 8.3 isolated comparison | `f = 0`; enlarging `S0` | both sides 0; factors must move with `S0` | none |
| 8.4 endoscopic nonvanishing | degrees 1, 2; fixed unrelated `h`; function field | `As^+`, `As^−`; existential in `h`; excluded | none |
| 8.5 factorization | zero local model; constants `k, k⁻¹`; one `dg_v` doubled; compensated | `0`; product 1; excluded; invariant | none |
| 8.6 GGP.8 | stable/endoscopic totals; `Ph(f) = 0`; `2i f` | `1/4`, `1/8`; equality of zeros; invariant | none |
| 8.7 stable specialization | `n = 1`; opposite Asai sign conventions | outside bplzz, inside bpcz; conventions compared by the pole dichotomy | none |

**Duplication audit by object** at the pins: searched the Tau Ceti tree (10 906 Lean files) for forms, classical groups, Witt theory, Heisenberg, Weil/oscillator, smooth or admissible representations, Langlands parameters, L-functions, Bessel/Whittaker/Jacquet–Rallis objects, Tamagawa measures and adeles. Beyond the declarations the design already cites, the only overlaps are the affine classical group schemes and the symplectic-basis theorem of R01. `TauCeti/Algebra/Lie/Heisenberg.lean` is the Lie algebra, `RepresentationTheory/ClassicalGroups` is Weyl's highest-weight theory, `RepresentationTheory/Compact` and `Continuous` are compact-group and generic continuous representation theory, `NumberTheory/LocalField/QuadraticForm` and `NumberTheory/QuadraticForm/Global` are quadratic-form arithmetic (consumed through the cited Hilbert symbol and Witt theory), and `NumberTheory/NumberField/Global/Adeles` is the scalar adele ring cited through GlobalNumberFields: none duplicates a target of this design.

**Gaps.** 40 gaps, all with a named supplier earlier in the merge order, each `section` explicitly `missing`, each `needs` a single sentence with its hypotheses, identical in `plan.json` and the README, and each `neededBy` equal to the set of targets citing it (script). None names a supplier later than this roadmap. Minimality fails only for the two gaps of R01 (and the alternating clause of `gap:hermitian-witt`).

**Shape.** Title and Summary; Scope and ownership; Conventions; Exact supplier contracts (Mathlib, Tau Ceti, four main-branch roadmaps, eight gap suppliers); How to read the build; eight layers with `### Examples` and `### Dependencies`; Downstream consumers; References. 50 targets (25 theorems, 12 definitions, 12 constructions, 1 verification), 80 API statements, 143 Checks; every definition and construction has at least three Checks; every target has a locator and its own `*Needs:*` line; no internal forward reference; every plan name and Check name occurs in the README and conversely.

## Not verifiable

- **Lean elaboration:** not available. The package has no `Suggested.lean` at the design stage and the brief gives no elaboration command; no signature, binder or example claim is certified.
- **Supplier contents:** ReductiveGroupsPartII, SmoothRepresentationsOfLocalGroups, EndoscopicTransferAndUnitaryTraceComparison, AutomorphicLFunctionsAndLocalFactors, MetaplecticAutomorphicForms, AdelicAlgebraicGroups, AutomorphicFormsOnReductiveGroups and AutomorphicSpectralTheory have no text on main or on the board; their gaps are declared contracts and were checked only for precision, minimality and declaration.
- **Overlines in the extraction:** the cached bpcz text drops fraction bars and some complex-conjugation bars (bpcz line 155, 4230, 4888); the README's `L(1,σ,Ad)` denominators and the conjugate on `β_η` were checked against the surrounding derivations (bpcz line 4943–4945, 1.1.6.1) rather than read directly.
- **Published pagination:** Ichino–Ikeda is cited by the recorded author revision; journal page numbers were not checked.
- **Proofs of the planned targets:** statements, hypotheses, sources, dependencies and conventions were checked; the harmonic analysis, classification and orbit computations behind them were not constructed.

No missing-reference request was needed; `sources.toml` was not changed.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d209acfd09644b996813c18de2d942d954b1aa4b", "job": "REV-DESIGN-GanGrossPrasadConjecturesForClassicalGroups~2", "model": "fable", "worker": "chris-f"} -->

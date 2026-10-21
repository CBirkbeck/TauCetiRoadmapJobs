<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/521#issuecomment-6314760208 -->
Review (claude) of 05472e3

Verdict: needs_changes

1. **F01** (P2) SmoothRepresentationsOfLocalGroups gaps request its own Layers SR.0, SR.2, SR.3; Casselman–Wallach has the wrong owner

   **Location.** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:93` to `:101` (`gap:smooth-functors`, `gap:casselman-wallach`, `gap:induction-jacquet`, `gap:bernstein-exclusions`, each ending "Section binding: missing"); `design/plan.json` gaps with the same slugs.

   **Claim.** The smooth category, admissibility, contragredients, smooth and compact induction, modulus and Jacquet functors, cuspidal support and the Bernstein decomposition are missing from the supplier, and Casselman–Wallach globalization belongs to SmoothRepresentationsOfLocalGroups.

   **Witness.** SmoothRepresentationsOfLocalGroups README (head 0d37c3f4): SR.0.1 smoothness, SR.0.4 `Representation.IsAdmissible` and duals, SR.2.1 `SmoothRep.indFunctor`, `SmoothRep.res`, SR.2.2 `δ_P` and Jacquet functors, SR.3.1 cuspidal support, SR.3.2 Bernstein components. Casselman–Wallach: AutomorphicFormsOnReductiveGroups §2.7 `SFRepresentation`, AutomorphicSpectralTheory §0.49.

   **Repair.** In the SmoothRepresentationsOfLocalGroups contract cite SR.0.1, SR.0.4, SR.2.1, SR.2.2, SR.3.1, SR.3.2 by section for the smooth category, admissible and finite-length subcategories, restriction, contragredient, unnormalized and compact induction, modulus `δ_P` with `q^{1/2}` as a coefficient choice, Jacquet functors, reciprocity, cuspidal support and Bernstein components. Narrow `gap:smooth-functors` to finite covers of classical point groups and the tensor-functor intertwiner comparison; narrow `gap:induction-jacquet` to the mirabolic generic quotient and the restriction filtrations of ggp §§15–16; narrow `gap:bernstein-exclusions` to Ext-vanishing between disjoint blocks and the support-avoiding supercuspidal existence with irreducible auxiliary induction. Move `gap:casselman-wallach` to AutomorphicFormsOnReductiveGroups, bound to §2.7 (and AutomorphicSpectralTheory §0.49), and narrow it to the Jacobi oscillator extensions and the completed projective tensor universal property. Update the `*Needs:*` lines of §§2.1, 2.3, 2.4, 3.1–3.8, 4.7, 4.8, 5.2, 5.5, 7.2, 7.5 and the plan's `prerequisites` and `neededBy` together.

2. **F02** (P2) MetaplecticAutomorphicForms gaps request its own Layers 0–5; generic standard modules have the wrong owner

   **Location.** `design/README.md:137` to `:147` (`gap:heisenberg-svn`, `gap:oscillator-splittings`, `gap:global-theta`, `gap:theta-seesaw`, `gap:theta-parameter-laws`, `gap:generic-standard-modules`), and `design/plan.json`.

   **Claim.** The Heisenberg extension and Stone–von Neumann, the metaplectic cover and genuine oscillator, unitary splittings with `mu|Fˣ = omega(E/F)`, the adelic Weil representation and theta kernel with growth, Howe duality, the see-saw identity and the equal-rank parameter laws of gan-ichino Theorems 4.1 and 4.4 are missing from MetaplecticAutomorphicForms, and generic standard-module irreducibility belongs to it.

   **Witness.** MetaplecticAutomorphicForms README (head 297a40c9): §0.1–0.6 Heisenberg factor sets with the half-alternating convention (§0.5), §1.1 `smooth_stoneVonNeumann`, §1.2 `unitary_stoneVonNeumann`, §2.4b `metaplecticCover`, §2.4c `weilRepresentation`, §2.7 character change and dual models, §3.3 `unitaryWeilRepresentation` with `χV|F×=ωE/F^dimV`, §3.7 `howeDuality`, §3.8 `localSeeSaw`, §3.18 `unitaryTheta_equalAlmostEqualRank` (gan-ichino Theorems 4.1, 4.4), §4.4–4.5 rational splitting and `adelicWeil`, §5.1 `thetaKernel`, §5.2 `theta_uniformModerateGrowth`. Standard modules: AutomorphicSpectralTheory §2.7 `generic_packet` (unitary pure inner forms) and §2.9 `generic_standard_module`.

   **Repair.** Bind `gap:heisenberg-svn` to §§0.1–0.6, 0.15–0.16, 1.1–1.2 and delete it unless a residual (the product central term `b/2` versus §0.5, or the `TauCeti.HeisenbergGroup` comparison) is genuinely absent; bind `gap:oscillator-splittings` to §§2.4b, 2.4c, 2.7, 3.3, 3.12 and narrow it to the mixed-model Levi multiplier `mu(det_E)⁻¹ abs(det_E)_E^(1/2)` and the compatible smaller-space splitting; bind `gap:global-theta` to §§4.4, 4.5, 5.1, 5.2 and AutomorphicLFunctionsAndLocalFactors AL.0 (adelic Poisson summation), keeping only the zero-vector and dual zero-vector asymptotics for §6.2a; bind `gap:theta-seesaw` to §§3.6–3.8 and keep only the tempered big-lift irreducibility of gan-ichino Proposition 1.1 if §3.18 does not already state it; bind `gap:theta-parameter-laws` to §3.18 and keep only the enhanced P2 label law and the `psi_E(x) = psi(Tr(delta x)/2)` identification. Reassign `gap:generic-standard-modules` to AutomorphicSpectralTheory §§2.7, 2.9 with SmoothRepresentationsOfLocalGroups SR.3.3, keeping for MetaplecticAutomorphicForms only the theta comparison of gan-ichino Propositions 9.1–9.2. Propagate to §§2.2, 2.3, 3.1, 3.2, 3.4, 3.7, 4.5, 5.3–5.5, 6.2, 6.2a and the plan.

3. **F03** (P2) EndoscopicTransfer and AutomorphicLFunctions gaps request stated sections; the Whittaker central period is misassigned

   **Location.** `design/README.md:105` to `:133` (`gap:parameter-carriers`, `gap:enhanced-classification`, `gap:tempered-stability`, `gap:tempered-transfer`, `gap:global-base-change`, `gap:factor-change-laws`, `gap:global-completed-factors`) and `:171` (`gap:eisenstein-periods`); `design/plan.json`.

   **Claim.** Tempered unitary packets with inner-twist pairings and endoscopic character identities, extended packets by normalized positive-exponent induction, the generic global classification and multiplicity formula, weak base change, L-groups and Weil groups, epsilon-factor change laws and completed Rankin–Selberg or adjoint factors are missing from their suppliers, and the local Whittaker Rankin–Selberg period of §8.1 is an Eisenstein-period interface of AutomorphicSpectralTheory.

   **Witness.** EndoscopicTransferAndUnitaryTraceComparison README (head f8f8c2b0): §11.2 tempered packets, nonarchimedean bijection, real union, normalized endoscopic identity with `e(G)` and transfer factors; §11.3 `ExtendedUnitaryPacket`; §11.4 generic classification with multiplicity one; §13.1 `UnitaryWeakBC`; §1.6 `TauCeti.InnerTwist`; §1.13 `TauCeti.kottwitzSign`. AutomorphicLFunctionsAndLocalFactors README (head 691b4b33): "Local epsilon factors and Gauss sums" states `ε(s,ω,ψ_β) = |β|^{s−1/2}ω(β)ε(s,ω,ψ)`; AL.4 "Weil–Deligne normalization and factor operations"; AL.3 "Central periods" states the normalized adjacent-rank period `λ_v♮` with tempered convergence for `Re(s) > −1/2`. bp-arch line 11182 derives STAB and TRANS from the same KMSW classification.

   **Repair.** Bind `gap:enhanced-classification` to §§11.2–11.4 and reduce its `needs` to the bp-refined §7.2 labeling relative to `nu0` and the comparison with ggp p. 67 and §4.4; bind `gap:tempered-stability` and `gap:tempered-transfer` to §11.2's normalized character identity and keep only what that identity does not state (empty packets, the source transfer normalization); bind `gap:global-base-change` to §§13.1, 11.4, 13.6 and keep the constituent-form description with the Asai sign `(−1)^(m+1)` as the residual; bind `gap:parameter-carriers` to ReductiveGroupsPartII RG2.5.1–2.5.2 (L-groups), AutomorphicFormsOnReductiveGroups §2.5 (Weil groups and archimedean parameters) and AutomorphicSpectralTheory §2.7, keeping conjugate-dual pairings, signs and determinant-one component groups as the residual; bind `gap:factor-change-laws` to AL.1 "Local epsilon factors and Gauss sums", AL.4 and MetaplecticAutomorphicForms §2.2 (Weil index and Hilbert symbol); bind `gap:global-completed-factors` to AL.2 (standard and adjoint L-series), AL.3 (Rankin–Selberg) and "Global distributions and completed Euler products", keeping Asai and the base-change adjoint comparison as the residual. Split `gap:eisenstein-periods`: the local `lambda_v` and its normalization go to AutomorphicLFunctionsAndLocalFactors AL.3 "Central periods" and "Mirabolic Eisenstein series and unfolding"; the Eisenstein continuation and truncation to AutomorphicSpectralTheory §§1.14–1.15, 2.4, 3.2; keep the regularized Flicker–Rallis period as the residual. Update §§4.1–4.6, 5.1, 5.3–5.6, 6.3–6.5, 7.1–7.2, 7.4–7.8, 8.1–8.5 and the plan.

4. **F04** (P2) AdelicAlgebraicGroups, AutomorphicFormsOnReductiveGroups and AutomorphicSpectralTheory gaps request stated sections

   **Location.** `design/README.md:151` to `:173` (`gap:adelic-points`, `gap:quotient-integration`, `gap:tamagawa-factorization`, `gap:cuspidal-tensors`, `gap:petersson-pairings`, `gap:period-growth`, `gap:schwartz-trace`, `gap:endoscopic-isolation`); `design/plan.json`.

   **Claim.** Adelic points with rational diagonals, quotient integration, Tamagawa normalization, cuspidal realizations with restricted tensor factorization, rapid decay and theta growth, Schwartz convolution and spectral multipliers are missing from their suppliers.

   **Witness.** AdelicAlgebraicGroups README (head 7b84aae1): §1.1 `AdelicPoints`, `AdelicPoints.diagonal`, §1.2 restricted product, §1.3 discreteness and functoriality, §2.1 split centre, §2.3 rational quotients with `IsFundamentalDomain.quotientMeasure_eq`, §2.4 `GaugeForm` and Tamagawa normalization. AutomorphicFormsOnReductiveGroups README (head bc8af0ce): §0.3 `AdelicSchwartzFunction`, §0.4 uniform moderate growth, §0.5 smoothing, §3.4 `RestrictedTensor`, §4.2 `cuspidalTensorFactorization`, `cuspidalCentralTwist` with rapid decay via ArithmeticLocallySymmetricSpaces ALS.F.6. AutomorphicSpectralTheory README (head 7d326fdb): §0.50 unitary restricted tensor identification with unit spherical vectors, §3.4 rapid decay, §6.3 `spectral_multiplier`, §6.4 `automorphic_kernel`; MetaplecticAutomorphicForms §5.2 theta growth.

   **Repair.** Bind the three AdelicAlgebraicGroups gaps to §§1.1–1.3, 2.1–2.4 and keep only the odd-characteristic global function-field extension and the unitary convergence factors of bpcz §2.3 as residuals (AdelicAlgebraicGroups is stated over number fields). Bind `gap:cuspidal-tensors` to AutomorphicFormsOnReductiveGroups §§3.4–3.5, 4.2 and AutomorphicSpectralTheory §0.50, keeping genuine covers as the residual; bind `gap:petersson-pairings` to §4.2 and §0.50 (the unitary occurrence and unit reference vectors), keeping the Tamagawa normalization of the pairing as the residual; bind `gap:period-growth` to §0.4, §4.2 (ALS.F.6) and MetaplecticAutomorphicForms §5.2, keeping only the locally uniform center-quotient estimates for §6.2a; bind `gap:schwartz-trace` to §§0.3, 0.5 and AutomorphicSpectralTheory §6.4; bind `gap:endoscopic-isolation` to AutomorphicSpectralTheory §6.3 and keep the bplzz Schwartz-multiplier isolation as the residual. Update §§6.1, 6.2, 6.2a, 6.5, 7.2, 7.4–7.6, 8.1–8.6 and the plan.

5. **F05** (P2) The ε-Hermitian carrier and local point topology already exist upstream and are not cited

   **Location.** `design/README.md:81` (`gap:hermitian-witt`), `:83` (`gap:classical-group-points`), `:19` (Conventions, "Against a Mathlib star-first form H use B(x,y) = H(y,x)"), §1.1 `*Needs:*` at `:191`.

   **Claim.** No earlier roadmap supplies nondegenerate ε-Hermitian forms on finite modules over a field with involution, nor the topology of local points of affine groups.

   **Witness.** GeometryOfNumbersAndQuadraticArithmetic README (head 01c64f0c) §2.9: `SignedHermitianSpace K V ε` "apply to any commutative field with involution and finite-dimensional V", with `signedHermitianAdjoint`, determinant class modulo norms (2.9.2), `signedHermitianTwist` (2.9.3); MetaplecticAutomorphicForms §3.3 builds its unitary splittings on this carrier. ReductiveGroupsPartII RG2.0.1–RG2.0.2: Hausdorff, locally compact, totally disconnected point topology over local fields.

   **Repair.** Add GeometryOfNumbersAndQuadraticArithmetic §2.9 to the supplier contracts and to §1.1's `*Needs:*`; define relevance on `SignedHermitianSpace` (its pairing is conjugate-linear in the first variable, so add a one-line comparison `B(x,y) = h(y,x)` with a computed Check beside the Mathlib star-first witness), and narrow `gap:hermitian-witt` to orthogonal sums and complements, conjugate duals and Hermitian Witt decomposition and cancellation with isometry transport. Bind the topological clause of `gap:classical-group-points` to RG2.0.1–RG2.0.2 and keep the unitary group schemes, point functors and the identification with isometry groups as the residual. State in Scope and ownership that the ε-Hermitian carrier is imported, not redefined.

6. **F06** (P3) `gap:endoscopic-isolation` has a second planned owner on the board

   **Location.** `design/README.md:173`.

   **Claim.** The bplzz Schwartz-multiplier cuspidal isolation is requested from AutomorphicSpectralTheory.

   **Witness.** `packages/AutomorphicSpectralTheoryPartII/design/README.md:1279`: "SM.5. Mixed multipliers and isolation of cuspidal components", with SM.5/global-isolation at line 1347.

   **Repair.** Keep the gap on AutomorphicSpectralTheory (Part II is not in the merge order and cannot be cited), but word the residual `needs` so that it names the bplzz isolation exactly as AutomorphicSpectralTheoryPartII SM.5 plans it, so the intake can route the contract to one owner instead of two.

7. **F07** (P3) The algebraic Bessel functional has no global-field statement

   **Location.** `design/README.md:261` ("Work with ... F is a local field of characteristic different from 2"), used at `:679` ("global nontrivial additive character of `A_A`/A and its Bessel nu").

   **Claim.** §6.1 composes the adelized functional `l` with a global additive character, but `l` is only constructed under the local hypotheses of §2.1.

   **Witness.** ggp line 1624–1627 defines `f(u) = (x_1,…,x_{n−1},z)` over any field `k`; ggp line 3078–3083 defines the global `nu = psi ∘ l_A` from the same algebraic `l`.

   **Repair.** Split §2.1 into the algebraic functional `l : N → A` over any field with 2 invertible (API: coordinate formulas, `G(W)`-invariance, base change) and the local unitary character `nu = psi ∘ l`; let §6.1 need the algebraic part and GlobalNumberFields Layer 5 for `psi`. Mirror the split in the plan.

The mathematics of the design is in good shape: the three round-3 findings are repaired, all 15 seeded locators and every flagged passage check against the cached texts, the plan and README agree exactly, the target graph is acyclic and the dependency gate is clean. The blocking findings of this round concern the declared supplier gaps. The eight gap suppliers are not on main, but their READMEs are recorded on the board (`other-prs.json`, by roadmap folder and head commit), and reading them shows that roughly 25 of the 40 gaps are bound `Section binding: missing` for objects those roadmaps already state in named sections. The brief classes a gap that asks for what an earlier roadmap already provides as P2. The repair is mechanical: cite the existing sections in the supplier contracts and `*Needs:*` lines, and narrow each gap's `needs` sentence to what is genuinely absent.

## Verified sound

**Round-3 repairs.** All three findings are repaired.

| Finding | Repaired passage | Verification | Status |
|---|---|---|---|
| F01 split equal-rank divergence | README line 696: "Prove absolute convergence ... when A is not the split quadratic algebra, or when A = F × F and rank V > rank W, or when V = W = 0"; §6.2a (line 713–728); line 163 and line 748 propagate | liu-relative line 1179–1189 (n > m absolutely convergent; equal rank deferred to Remark 3.6), line 1492–1543 (θ*, convergence for Re(s) > 1, holomorphy at 1/2, center-quotient pairing, poles only at `s = −iσ, 1−iσ`). Computed: the `a`-integrand is `abs(a)^{n(s+b)}` times a lattice sum of size `abs(a)^{−n}` near 0, so convergence needs `Re(s)+b > 1`; θ* has central character `χ⁻¹`; translation law `abs(det k)^{−(s−1/2)}` by right invariance of `dbar_g`; `split_fj_GL1_Tate` is the Tate integral with poles at 0 and 1; `split_fj_polar_twist` is the Tate integral at `s−1/2` with a pole at 1/2 and finite-part shift `−R·log abs(det k)`; `split_fj_row_transport` gives `2^{1/2}Φ̂(2x)` for the normalized and `2Φ̂(2x)` for the unnormalized action. | Repaired |
| F02 Asai sign degree | README line 115: "degrees d_i with sum_i d_i = m; every Pi_i has an Asai sign (−1)^(m+1) pole at 1, independently of d_i"; line 33, line 967, Check `unitary_Asai_endoscopic_partition` | bpcz line 95–100 (ambient `n` in every constituent's sign), line 112–118 (generic Arthur parameter), line 148–151 (everywhere tempered σ has a strong base change). Plan `detail` and `needs` equal. | Repaired |
| F03 milestone order | §3.6 SO reduction, §3.7 skew-unitary reduction, §3.8 milestone with `*Needs:* §3.1, §3.3, §3.4, §3.6, §3.7` (line 441) | Script over `plan.json`: every `target:` prerequisite precedes its consumer; no forward edge. Gap consumers and §4.8 references remapped. | Repaired |

**Principles.** No route-specific shortcut (dyadic, ramified and archimedean places are retained at every proved endpoint; proofs stay general). No existing roadmap is re-planned: the relative constructions, selection characters, periods and refined identities occur in no roadmap on main, in none of the four named open pull requests (ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers, ArithmeticDynamics) and in none of the supplier roadmaps read (grep for Gross–Prasad, Bessel period, Fourier–Jacobi model, Ichino–Ikeda, Jacquet–Rallis across the supplier texts found only citations and the unrelated G₂ and classical-Jacobi objects). Supply is downward (gate below). No copied passage, no algorithm, no Lean file, hence no sorry'd data or `set_option`. No fetched text contained instructions.

**Seeded sample.** All 15 targets verified at their locators; no author-flagged unverified locator exists (grep for "unverified", "uncertified" in README and plan).

| Target | Locator read | Outcome |
|---|---|---|
| 1.2 | ggp line 244–257, 1541–1557 | `H = N ⋊ G(W)`, inclusion on the first factor, projection on the second; connected `G(V)`. Matches. |
| 1.3 | ggp line 217–226 (Lemma 2.1), 255–257 | Pure inner forms by forms of `V`; relevance = complement isomorphic to `W⊥`; `GL`, `Sp` have none. Matches. |
| 2.3 | ggp line 1761–1769, 1796–1813, 1823–1845 | `λ = ψ(Tr Σ x_i)`, `ν = ω ⊗ λ`, genuine cover in the symplectic case, `µ` with `µ|k₀ˣ = ω_{k/k₀}`, `X = 0` gives `ν = ω`, `W = 0` gives a generic character. Matches. |
| 3.2 | sun-zhu line 28–46 (lists (1), (2) including `SO(p,q+1)`, `SO_{n+1}(ℂ)`), 55–68 (Theorem B), 80–97 (Theorem C) | Continuous bilinear functionals on Casselman–Wallach spaces; ψ-representations `V₀ ⊗̂ ω_ψ`. Matches. |
| 3.4 | ggp line 2282–2301 | Theorem 16.1: `X ≠ 0`, supercuspidal `τ`, genuine `π₀`, Bernstein exclusion, displayed Hom isomorphism. Matches. |
| 3.5 | ggp line 2064–2078 | "basic conjecture `d(π) ≤ 1`"; Theorem 14.1 ranges. The design correctly calls it a proposition. |
| 4.2 | ggp line 726–737 | `χ_N(a) = ε(M^a ⊗ N, ψ₀)`, trivial for `b(M)b(N) = +1`, change by `η^{dim N}`, `η(a) = (−1)^{dim M^a}`. Matches. |
| 4.7 | ggp line 2394–2400 | Theorem 17.2 (i) codimension 0 or 1 for any local field, (ii) nonarchimedean in general; singleton packets. Matches. |
| 6.1 | ggp line 2908 (anisotropic-center convention), 3036–3093 | Period `∫ f(h)ν(h)dh`, split-plane exclusion (line 3044–3046), rational-trivial `ψ`. Matches. |
| 6.5 | bpcz line 81–90, 108–111, 124–134 | Norm line `h₀`, `U_h = U(h) × U(h ⊕ h₀)`, diagonal `U'_h`, weak base change at almost all split places. Matches. |
| 7.1 | ichino-ikeda line 138–150, 209 | `K_Q = k(√((−1)^{dim V/2} det Q))`; `Δ` products with `L(l,χ)` in the even case; continuation assumed. Matches. |
| 7.3 | ichino-ikeda line 179–192 (U1–U6), 234–239 | Proposition 1.1 (tempered: convergent, nonnegative), Theorem 1.2 (nonarchimedean, U1–U6, `α_v = 1`). Matches. |
| 8.4 | bpcz line 93–104, 124–134, 4835–4842 | Hermitian Arthur parameter with ambient-degree Asai sign; Theorem 1.1.5.1 existential in `h` and `σ`. Matches. |
| 8.5 | bpcz line 679–700, 4866–4946 | Source measures `dh = (Δ_H^*)⁻¹ ∏ Δ_{H,v} dh_v`; (10.3.2.1) with `(Δ^{S₀}_{U'_h})²`; `κ_v` with product 1 (line 4939–4941); `L^{S₀}(s,Π,As) = L^{S₀}(s,σ,Ad)`. Matches. |
| 8.6 | bpcz line 148–169, 179–192, 4889 | `L(s,σ)` quotient, `P♮ = L(1/2,σ_v)⁻¹ ∫`, Theorem 1.1.6.1 with Tamagawa measures and `dh_v` factoring `dTam_h`. Matches. |

Further passages read: gan-ichino line 85–142 (Propositions 1.1–1.2, Theorem 1.3, Corollary 1.4), 2476–2510 (Propositions 9.2–9.4) for §§5.2–5.5; bp-refined line 713–719 (`ν₀`, (QD), `µ(V,h)`), 806–807 (4.1(1)), 2877–2901 (Theorem 8.5.1 under conjectures 7.2 and the labelings 7.7, 8.3) for §5.1; bp-arch line 11119–11131, 11180–11205 (Theorem 12.4.1; STAB and TRANS from Mok and KMSW) for §5.6; harris line 243–250 (Proposition 2.1), 1289–1294 (Theorem 2.12) for §7.6; ggp line 759–783 (Theorem 6.2 with the determinant corrections), 2413–2478 (§17 recipes, `N₁ = N ⊕ ℂ`, `µ⁻¹` twist, `ψ(Tr(ex))`), 1618–1634 (`ν = ψ(Σ x_i + z)`), 3151–3188 (`R`, Conjecture 24.1, split case `|L(1/2)|²`), 1992–2004 (unnormalized split action) for §§2.1, 4.3, 4.4, 6.2, 6.3, 6.4; waldspurger line 10–18 and sun line 31–42, 102–104 for §3.1.

**Structure.** README and plan agree: 51 targets (8 layers), 85 API entries, 157 Checks; every `GGP.*` name in the plan occurs in the README and conversely; every Check name agrees; every `*Needs:*` line contains exactly the plan's prerequisites; the 40 gap slugs occur identically in README and plan with equal `needs` and `detail` and consumer lists equal to the actual prerequisite sets; all 25 definitions and constructions have a named API and at least three Checks; every layer ends with Examples and Dependencies. No LaTeX delimiters, process words, pull-request numbers or machine paths. The main-branch suppliers' cited layers exist: ReductiveGroups Layers 0, 3, 5, 7; OrthogonalSpinGroups Layers 0, 2, 3; RestrictedProducts Layers 1–3 (Completed); GlobalNumberFields Layers 0, 4, 5, 8, 9.

**Pins.** The local checkouts are at the manifest pins (Tau Ceti a91d3aaf, Mathlib 6b7abb3c). All 34 declarations named in the Mathlib and Tau Ceti contracts were found in the cited files (`intertwiningMapEquiv`, `IsInvariantSesqForm.apply`, `isCompact_unitaryGroup`, `toLinearEquiv_apply`, `exists_equivalent_hyperbolicPresentation_prod`, `equivalent_of_equivalent_prod`, `hilbertSymbol`, `hilbertSymbolOnSquareClasses(_squareClass)`, `ConstantForm.groupScheme` (abbrev at line 339), `inclusion`, `mem_definingPointsSubgroup_iff`, `Orthogonal.groupScheme`/`pointsMulEquiv`, the SpecialOrthogonal and Symplectic Basic/Scheme/BaseChange/Smooth/Connected/Reductive/LowRank declarations, `exists_basis_toMatrix_eq_J`, `even_finrank`, `HeisenbergGroup.mul_z`, `commutatorElement_eq`, `IntertwiningMap` with `isIntertwining` and `ext`, `ContIntertwiningMap.toIntertwiningMap` (abbrev, line 96), `ContRepresentation.trivial`, `polar_self`, `IsAlt`, `mem_unitaryGroup_iff`).

**Dependency gate.** The brief's command names `packages/GanGrossPrasadConjecturesForClassicalGroups/README.md`, which does not exist at the design stage (FileNotFoundError). With the design README as candidate and the same configuration, roadmap selection and order it exited 0 with:

```text
candidate: GanGrossPrasadConjecturesForClassicalGroups is not in the merge order yet; checked as if placed after MetaplecticAutomorphicForms (the intake inserts it when its design is accepted)
depcheck: 5 roadmaps, 35 edges, 0 problem(s)
```

No UPWARD or CYCLE line. All eight gap suppliers and the four main-branch suppliers precede the insertion point in `merge-order/ORDER.txt` (lines 20, 21, 29, 58, 72, 74, 110, 111). The two consumers are not cited as suppliers.

**Adversarial mathematics pass.** Each row records instances tried against the stated hypotheses; "pass" means no defect beyond the findings above.

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| Conventions (forms, polar, alternating basis) | `Q(x) = x²`; alternating plane; char 2; `ℚ₂`; zero ring | `B(1,1) = 2`; `B(e,f) = 1 = −B(f,e)`; char 2 and the zero ring excluded, `ℚ₂` allowed | None |
| Conventions (duals, twists, Frobenius, measures) | `z, u⁻¹` tensor; `q = 2, s = 1`; `s = 0`; reciprocal rescalings | `z/u`; value 2; pole not a value; product-one invariance | None |
| §1.1 `RelevantPair` | `W = V = 0` both signs; `0 ↪ ⟨1⟩`; `i·diag(1,1)` over `ℂ/ℝ` | parity and isotropic rank both needed; `SignedHermitianSpace` already exists upstream | R05 |
| §1.2 `relativeSubgroup` | empty flag; `j(1,g)`, `j(u,1)`; `diag(1,4)` with `M = [[0,1/2],[−2,0]]` | `det M = 1`, `MCMᵀ = C`, `MᵀCM = diag(16,1/4)`, `(Mᵀ)⁻¹` is a column isometry | None |
| §1.3 `IsRelevantInnerForm` | `C = 0`; signatures (3,1)/(1,3); split GL | complement isometry, not dimension, decides; GL has no pure twists (ggp Lemma 2.1(1)) | None |
| §1.4 `splitPairEquiv` | `V₀ = F`, `a = 2`; `V₀ = 0` | `(2,1/2)` preserves, `(2,2)` fails | None |
| §2.1 `besselCharacter` | `r = 0`; `(x₁,z) = (1,−1)`; split `e = (1,0)e₀`; `ψ_A(x,y) = ψ_F(x)` | empty sum trivial; degenerate split data rejected; `l` is algebraic over any field | R07 |
| §2.2 `fourierJacobiQuotient` | `X = 0`; `W = 0`; `rank X = 1`; `ell = (1,0)·` | commutator `2B`; zero branches separate; non-unimodular `ell` not onto | None |
| §2.3 `fourierJacobiRepresentation` | cover kernel; `X = 0`; `W = 0`; one changed splitting | signs cancel; `ν = ω`; generic character; comparison requires equal data | None |
| §2.4 `Model` | `H = 1` with `ℂ`, `0`, `ℂ^{(ℕ)}`; `Mp(0) = C₂` with sign | dimensions 1, 0, infinite; genuineness detected | None |
| §3.1 nonarchimedean basic | `ℚ₂`; `SO(1)/SO(0)`; rank-zero oscillator | char-0 theorems include dyadic fields; Sun's Theorem B removes ggp 14.1(iv)'s supercuspidal hypothesis | None |
| §3.2 archimedean basic | `p = q = n = 0`; algebraic dual | SO cases are in Sun–Zhu's list (1); continuity essential | None |
| §3.3 Bessel reduction | no `Y′`; forbidden support; O versus SO | vacuous exclusion legitimate; no SO inference | None |
| §3.4 FJ reduction | `X = 0`; dropped `χ_ψ` | basic case excluded; Hom ill-typed without the genuine twist | None |
| §3.5 assertion | `ℂ²` over the trivial group; undistinguished irreducible | irreducibility needed; dimension 0 allowed | None |
| §3.6 SO reduction | `SO(3)/SO(0)`; two maximal-isotropic components; Witt index below `dim Y` | `V⁺` split of dimension 4; components retained; empty exclusion | None |
| §3.7 skew-unitary reduction | `det_E = a`; changed `µ` on `W₀`; `X = 0` | `µ(a)µ(a)⁻¹ = 1` leaves `abs(a)^{1/2}`; mismatch rejected | None |
| §3.8 higher codimension | four families; `ℚ₂`; basic boundaries | each family has a reduction; no good-prime condition | None |
| §4.1 `parameterSignDomain` | `M = 0`; `T ⊕ T`; `P ⊕ P∨`; two odd orthogonal lines | component groups 1, `C₂`, 1, `C₂²` with `A⁺` of order 2 | None |
| §4.2 `conjugateRootCharacter` | `N = 0`; generators `−1, +1`; `dim N = 1, 2` under nonnorm scaling | values 1, −1; sign flips exactly when `dim M^a · dim N` is odd | None |
| §4.3 `selfdualRootCharacter` | `M = 0`; two symplectic; `P ⊕ P∨` with `N = 1` over `ℝ`; `M = 1 ⊕ sgn`, `N = 1 ⊕ 1` | even domain needed (ggp line 764–771); `χ_N(−1) = (−1)(−1)(1) = +1` | None |
| §4.4 `distinguishedCharacter` | split GL; `N` a trivial line; eigenvalues `z, u` | trivial; `N₁` of dimension 2; `z/u` | None |
| §4.5 `selectionChangeData` | identity; nonnorm with `dim M^a = 1`; `κ = u` | identity maps; sign reversal; `zu` under reassociation | None |
| §4.6 `LocalSelectionAssertion` | singleton; two inner forms; nongeneric | uniqueness across relevant forms; nongeneric excluded | None |
| §4.7 split selection | `GL₂ × GL₁`; archimedean higher codimension | Theorem 17.2 scope respected | None |
| §4.8 reduction | `ℝ`, `ℂ` | nonarchimedean only | None |
| §5.1 tempered Bessel selection | `ℚ₃(√3)` with `−1` nonnorm; generator times 2; ramified `ℚ₂` | `+ν₀`/`−ν₀` differ; norm times 4; bp-refined 4.1(1) and `µ(G)` from `ν₀` | None |
| §5.2 standard modules | `r = r′ = 0`; unordered exponents | identity; ordering required (gan-ichino line 2506) | None |
| §5.3, §5.5 generic selection | tempered boundary; wrong `µ|Fˣ`; ramified dyadic | irreducibility input; rejection; included | None |
| §5.4 theta bridge | zero lift; equal rank | unique nonzero tower; only (FJ) taken from Proposition 1.2 | None |
| §5.6 packet uniqueness | many real signatures; `F = ℂ` | union over `H¹(F,H)`; split place via §4.7 | None |
| §6.1 `globalBesselPeriod` | codimension 1; `f = 0`; split plane; `GL₁` norm direction | diagonal; zero; excluded; no finite-volume claim | None |
| §6.2 `globalFourierJacobiPeriod` | nonsplit; split `n > m` (Liu's exponent `(r*−r)/2` vanishes for `r = r*`); `n = 0`; `GL₁` Gaussian | convergence domains correct; Gaussian lower bound `t^{−1/2}` diverges on positive measure | None |
| §6.2a `splitEqualRankFourierJacobiPeriod` | `n = 1` Tate; `β = abs^{−1/2}`; `Φ(0) = Φ̂(0) = 0`; `da ↦ 2da`, `dbar_g ↦ dbar_g/2`; `n = 0` | computed above under F01; agreement needs both zero-vector ends; `cd = 1` | None |
| §6.3 `distinguishedLRepresentation` | `M = 0`; dims 2, 1; split | `L = 1`; `dim R = 2`; `|L(1/2)|²` (ggp line 3188) | None |
| §6.4 `GlobalNonvanishingAssertion` | one zero local model; zero central value; polar split family | functional existential; Laurent family only at a pole | None |
| §6.5 `UnitaryPeriodDatum` | `ℚ(i)` norms of `1, i, 1+i`; zero form; two `h` of the same rank | 1, 1, 2; zero allowed; separate data | None |
| §7.1 `orthogonalDelta` | `d = 2, 3, 4`; `diag(1,−1)`; global split plane | `L(1,χ)`, `ζ(2)`, `ζ(2)L(2,χ)`; trivial discriminant; pole at `s = 0` | None |
| §7.2 `orthogonalLocalPeriod` | zero vector; `f₀ ↦ if₀`; singular quotient | `I = 0`; factor `−i`; no scalar | None |
| §7.3 tempered and spherical | doubled compact volume | `α = 2`; U6 essential | None |
| §7.4 refinement assertions | centralizer orders 2, 4; `dt_v ↦ 3dt_v`; zero vector; ALG | `1/8`; `C₀/3` compensates; excluded; ALG ≠ tempered | None |
| §7.5 `unitaryNormalizedLocalPeriod` | zero vector; `if, ig`; `2C_v`; `q = 2` | sesquilinear; halves `α`; `L_v(1,1) = 2` | None |
| §7.6, §7.7 | volume 2; complex split place; `2i f`; `c, 1/c`; one doubling | `α = 2`; archimedean integral kept; ratio invariant; product preserved only with product 1 | None |
| §7.8 `unitaryGlobalConstant` | totals 2, 3; `n = 1`; zero central value | `1/4`, `1/8`; `L(1,η)L(2,1)`; `C(σ) = 0` not undefined | None |
| §8.1 `relativeCharacters` | basis phase `i`; empty `X`; `P_h = 0`; split `n = 1` trivial | phase cancels; zero; zero; divergent without temperedness | None |
| §8.2, §8.3 | two/three constituents; irrelevant datum; enlarged `S₀`; zero functions | `1/4`, `1/8`; zero; measure factors move together; `0 = 0` | None |
| §8.4 `unitaryEndoscopicNonvanishing` | `m = 1, 2`; partition `1+1`; function field | ambient parity; both constituents Asai−; number fields only | None |
| §8.5 factorization | one zero model; `k, k⁻¹`; single and compensated `dg_v` rescaling | both sides zero; product 1; single rescaling excluded | None |
| §8.6 GGP.8 | totals 2, 3; `P_h(f) = 0`; `2i f` | `1/4`, `1/8`; zero identity; invariant | None |
| §8.7 stable specialization | `n = 1`; opposite Asai convention | bplzz needs `n > 1`; pole dichotomy compares conventions | None |

**Duplication audit (library and roadmaps).** The pinned objects listed under "From Mathlib" and "From Tau Ceti" are consumed, not restated, and their hypotheses are recorded correctly (star-first forms, `polar_self`, Witt decomposition with invertible 2, `IsAlt` basis `J`, constant-form points over every commutative ring, SO smoothness needing `Invertible 2`, `GLSymplecticFin`). The relative objects of this roadmap occur in no roadmap on main, in none of the four named open pull requests and in none of the supplier texts; the only overlaps found are the supplier-side foundations recorded in R01–R05 and the Part II isolation of R06.

## Not verifiable

- Lean elaboration: not available. The design has no `Suggested.lean`; the configured elaboration command (`lake env lean {file}`) has nothing to run. No Lean command was executed.
- The brief's gate command as written fails because the package-stage `README.md` does not exist; the design README was substituted with identical configuration, roadmap selection and order.
- The supplier roadmaps of R01–R05 were read from the board's recorded pull-request READMEs at the heads listed; their own acceptance status and any later revision are outside this review. The residual `needs` proposed in the repairs are what those texts do not state; the fix worker should confirm each against the same texts before narrowing.
- The planned proofs of the owned SO and skew-unitary reductions (§§3.6–3.7), of the §6.2a function-field extension and of the 40 contracts are not artifacts; their declared status is not a finding.

No file of the design, the manifest, the library pins, the content repository or the merge order was changed. Only this report, `packages/GanGrossPrasadConjecturesForClassicalGroups/design/review.json` and scratch notes were written.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "05472e3520327115e6363ad7a3b6ebf193a1a4eb", "job": "REV-DESIGN-GanGrossPrasadConjecturesForClassicalGroups~4", "model": "fable", "worker": "chris-f"} -->

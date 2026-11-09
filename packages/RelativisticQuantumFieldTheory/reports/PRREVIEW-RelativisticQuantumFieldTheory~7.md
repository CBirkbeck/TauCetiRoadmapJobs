# Review of RelativisticQuantumFieldTheory (pull request #1772 at ed01009)

**Verdict:** needs changes

This is a full review of head ed01009, the same head the previous review read. Nothing in the folder or outside it changed since then.

- The gate passes, `Suggested.lean` elaborates with 14 `sorry` warnings and nothing else, and the dependency check reports no problem.
- There are 11 findings, all P3: three false Checks, one wrong locator, two restatements of library theorems, a truncated target, a missing locator, a *Needs:* mismatch, and the two manifest records carried from the previous review.
- Nothing is P1 or P2.

## R01 (P3) — §9.4: the one-photon term in the second Check has the wrong sign

Location: `TauCetiRoadmap/RelativisticQuantumFieldTheory/README.md` line 5104: "Expanding `|Dφ|²` gives the one-photon term `ieA^μ(φ̄∂_μφ−∂_μφ̄φ)` … the vertex rules `−ie(p+p′)^μ` … follow".

Claim: with `D_μ=∂_μ+ieA_μ` (line 5099), the expansion of `|Dφ|²` contains the displayed term, and the vertex `−ie(p+p′)^μ` follows from it.

Witness:
- `(∂_μφ̄−ieA_μφ̄)(∂^μφ+ieA^μφ)` contains `ieA^μ(φ∂_μφ̄−φ̄∂_μφ)`, the negative of the displayed term.
- With incoming `e^(−ipx)` and outgoing `e^(ip′x)`, the correct term gives `−e(p+p′)·A`, hence the vertex `−ie(p+p′)^μ`. The displayed term gives `+ie(p+p′)^μ`.
- The correct term equals `−eA_μj^μ` with the line 5105 current. That matches §1.6's `L_J=−J·A` (line 399).

Repair: write the one-photon term as `−ieA^μ(φ̄∂_μφ−∂_μφ̄φ)=−eA_μj^μ`. The vertex rules stay as written.

## R02 (P3) — §4.15: a Check claims that vanishing of `Kf` forces `f=0`

Location: README line 1363: "`Kf` is the restriction of an entire function to the shell, so its vanishing on an open set forces `f=0`: Reeh–Schlieder holds for one-particle vectors".

Claim: if `Kf` vanishes on an open subset of the shell, then `f=0`.

Witness: take a nonzero `g∈C_c^∞(O)` and put `f=(□+m²)g`. Then `f≠0`, but `Kf=(m²−η(p,p))Kg` vanishes on the whole shell. Analyticity only gives `Kf|_shell≡0`. Neither statement is the density that Reeh–Schlieder asserts.

Repair: state the one-particle argument in this form. If `h` is orthogonal to `K(f(·−x))` for every `f` supported in `O` and every small `x`, then `x↦⟨h,K(f(·−x))⟩` is the boundary value of a function holomorphic in the forward tube that vanishes on an open set. So it vanishes identically, and `h=0` by density of `K(𝒮)` in `h_m`. The `f=(□+m²)g` example can stay as a negative control.

## R03 (P3) — §6.38: the fourth Check fails for the negative coefficient weights the section allows

Location: README line 4251: "`wt(c)+0+q+4≤4`, forcing `wt(c)=q=0`".

Claim: on the `φ⁴` bubble with `wt(a_v)=0`, the budget forces a weight-0 residual coefficient with no derivatives.

Witness:
- Lines 4232 and 4242 allow negative coefficient weights.
- The third Check (line 4250) uses the stage `k[g]/(g^(N+1))` with `wt(g)=−1`.
- In that stage, `c=g` with `q=1` gives `−1+0+1+4=4≤4`, which is admitted.

Repair: write "with nonnegative coefficient weights this forces `wt(c)=q=0`; with `wt(g)=−1` the pair `(wt c,q)=(−1,1)` is admitted".

## R04 (P3) — §6.35 cites the wrong questions of Borcherds–Barnard §8.3

Location: README line 4121: "Questions 1–2 of Borcherds–Barnard §8.3 (p. 65) ask for these results".

Claim: the questions cited ask for G-equivariant prescriptions and for transitivity of renormalizations.

Witness: borcherds-qft lines 2422–2428 (p. 65):
- Questions 1–2 ask for the symmetry group of `L` and whether `L` is the most general Lagrangian it fixes.
- Questions 3–4 ask for invariant prescriptions and for transitivity under finite renormalizations.

Repair: "Questions 3–4 of Borcherds–Barnard §8.3 (p. 65)".

## R05 (P3) — §5.6 builds the symmetric-algebra Hopf structure that the pinned libraries already have

Location: README line 1461: "Build the polynomial field algebra … as the symmetric algebra on all formal field-jet generators … Make every jet generator primitive, with counit0 and antipode minus". The section opens with "This roadmap owns the proof route below."

Claim: this roadmap owns the ungraded Hopf structure on the jet symmetric algebra.

Witness, at both pins (f6090c7/358314d and 1b1ccf4b/2fd255d9):
- Mathlib `SymmetricAlgebra.instBialgebra`, `comul_ι` and `counit_ι` (`Mathlib/RingTheory/Bialgebra/SymmetricAlgebra.lean` lines 27, 39, 44) give primitive generators with counit `0`.
- Tau Ceti `TauCeti.SymmetricAlgebra.instHopfAlgebra` and `antipode_ι` (`TauCeti/Algebra/HopfAlgebra/SymmetricAlgebra/Basic.lean` lines 67, 82) give the antipode `ι x↦−ι x`.

Repair:
- For the even jets, consume these four declarations and list them under "From Mathlib" and "From Tau Ceti".
- Own only the ℤ/2-graded extension with odd jets and Koszul signs, the commuting total derivations `D_i` with `ΔD_i=(D_i⊗1+1⊗D_i)Δ`, and the multinomial port allocations.

## R06 (P3) — §5.4 restates a Mathlib theorem

Location: README line 1435: "This roadmap owns the proof route below. … prove for each x the equivalence `IsGroupLikeElem ℂ x ↔ ∃!g:G, x=MonoidAlgebra.single g 1`".

Claim: the characterisation of group-like elements of `ℂ[G]` is owned here.

Witness:
- `MonoidAlgebra.isGroupLikeElem_iff_mem_range_single_one` (`Mathlib/RingTheory/Bialgebra/MonoidAlgebra.lean` line 236, at both Mathlib pins) proves `IsGroupLikeElem R x ↔ x ∈ Set.range (single · 1)`. It holds over any commutative domain `R` and any type `M`.
- `MonoidAlgebra.single_left_injective` (`Mathlib/Algebra/MonoidAlgebra/Defs.lean` line 245) gives uniqueness of `g`.

Repair: consume these two declarations, keep the UEA warning and the product identity as Checks, and drop the owned proof route.

## R07 (P3) — §9.1 promises a bridge and never states it

Location: README line 5029: "Use LVF's Maxwell/Dirac Lagrangian and Noether identities, then build the quantum model-specific bridge:". The **Checks.** heading follows immediately at line 5031.

Claim: §9.1 owns a quantum bridge from the LocalVariationalFieldTheory Lagrangians.

Witness: the colon introduces nothing. Neither Check (Kummer values, the Noether current up to `i`) says what the bridge maps, from where to where, or under which hypotheses.

Repair: either state the bridge as a target, or end the sentence after "Noether identities". An example target would be the identification of LocalVariationalFieldTheory's `U(1)` Noether current with the normal-ordered current of §9.13 on the finite-particle domain, with its hypotheses.

## R08 (P3) — §3.4 (sampled) states the free Dirac field with no locator

Location: README line 866: "use CAR on the positive/negative energy spinor mass-shell space … and prove the anticommutator distribution and causal support". The section refers to "the lecture notes" without a page.

Claim: the CAR Dirac field, its spin sums and its causal anticommutator are targets.

Witness: §3.4 names no source and no theorem, and it does not say that this roadmap owns the route, as §5.3–§5.6 do. These are textbook results. I checked the spin sums: `Σ_sū_su_s=tr(γ·p+m)=4m`.

Repair: add a locator for the CAR construction and the causal anticommutator. Weinberg (`weinberg95`) and Bogoliubov–Shirkov (`bs80`) are already in the manifest, cited by locator. Also give the UNSW page meant by "the lecture notes", or delete that phrase.

## R09 (P3) — §4.5: the *Needs:* line disagrees with the body on Bostelmann

Location: README line 1050, the *Needs:* line: "Bostelmann, Definitions 2.1 and 4.1, Theorems 3.3, 3.6 and 4.3, (4.6)–(4.8)".

Claim: the route needs (4.8) and does not need Lemma 3.5.

Witness:
- The body (line 1041) says "the equivalence (4.8), which the paper expects but does not prove, is not invoked". The source agrees: bostelmann05 lines 464–465 say only that it "should be possible to show".
- The body (line 1035) uses "Bostelmann, Lemma 3.5". Lemma 3.5 is at bostelmann05 line 334.

Repair: "Bostelmann, Definitions 2.1 and 4.1, Lemma 3.5, Theorems 3.3, 3.6 and 4.3, (4.6)–(4.7)".

## R10 (P3) — The manifest entry `bm23` still records the wrong title and locator

Location: board manifest `packages/RelativisticQuantumFieldTheory/sources.toml`, entry `bm23` (lines 394–408): `title = "Fermionic Bogoliubov transformations"`, `locator = "Theorem 2.8"`, `version_note = "arXiv, latest version"`.

Claim: the record names the work and the locator that the README cites (README line 5603).

Witness:
- The cached text is v7 of 22 April 2026 (bm23 line 40). Its title is *Quadratic Hamiltonians in Fermionic Fock Spaces* (bm23 line 5).
- v7 has no Theorem 2.8. The README cites Theorem 3.2 and Proposition 2.12 (bm23 line 1004).
- The manifest's last change is the commit of 8 November (f79894f7), before the reviews of 8–9 November that raised these records.

Repair: the worker sets
- `title = "Quadratic Hamiltonians in Fermionic Fock Spaces"`;
- `locator = "Theorem 3.2; Proposition 2.12 (44)–(46)"`;
- `version_note = "numbering of v7 (22 April 2026); Theorem 3.2 is Theorem 2.8 in v2 (3 October 2023)"`.

## R11 (P3) — The manifest still certifies a bot-block page as Osterwalder–Schrader II

Location: board manifest entry `os75` (lines 464–477): `status = "certified"`, `licence_class = "open-repository"`, sha256 `b6013daa…`.

Claim: the OS II text was fetched, so its locators can be checked.

Witness: the cached `os75` is five lines long. Its only content is an Incapsula "Request unsuccessful" page (os75 line 5). The previous review found that the DOI 10.1007/BF01608978 resolves only to a paywalled page.

Repair: the worker records `os75` as `status = "uncertified"` with `doi = "10.1007/BF01608978"`, and drops the `sha256` and `fetched_from` of the block page. The README's OS II locators stay as written.

## Previous findings

- R01 (manifest `bm23`): not repaired. The entry still reads `title = "Fermionic Bogoliubov transformations"` and `locator = "Theorem 2.8"` (now R10).
- R02 (manifest `os75`): not repaired. The entry is still `status = "certified"` on the Incapsula page (now R11).
- The README repairs that the previous review verified are unchanged at this head, since the head is the same: the §10.1 letters `P`/`β` (line 5415), the (46) misprint note (line 5455), the v7/v2 numbering note (line 5603) and the §4.2 *Needs:* line (line 991).

## Verified sound

**Gate, build and dependency check.**
- My rerun of the gate on ed01009 exits 0. Every check is 0, including `outside-folder`, `stray-files`, `statement-hygiene`, `readme-ids-missing`, `sorry-data` and `depcheck`. My rerun prints no `build` field; the worker's gate at this head reports `build=0`.
- `lake env lean TauCetiRoadmap/RelativisticQuantumFieldTheory/Suggested.lean` exits 0 in 7 s. Its only output is 14 `declaration uses sorry` warnings, at lines 92, 101, 133, 141, 160, 188, 202, 245, 289, 309, 316, 337, 347 and 358.
- `gate --depcheck … --movable` prints `depcheck: 238 roadmaps, 2320 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Merge-order positions: VonNeumannAlgebras 5, SmoothBundlesConnections 12, PseudodifferentialOperators 13, GlobalHolomorphicFunctions 97, NoncompactQuantumSymmetry 155, QuantumFoundations 209, StochasticCalculus 210, this roadmap 211.
- LocalVariationalFieldTheory is at position 222, but it is on main, which is allowed. OperatorAlgebraDynamics, OperatorTheory, ComplexKahlerGeometry, Hyperfunctions, RepresentationTheory, PDE, Completed/HopfRinow and Completed/OrthogonalSpinGroups are also on main.
- UnboundedOperators is a new folder added by the OperatorTheory pull request at cfd0df5. The description names it under "Depends on".
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only README.md, Suggested.lean and metadata.toml. `overlaps.md` and `citations.md` list nothing.

**Lean side.**
- I ran `#check @name` on all 44 declarations in a scratch copy; it exits 0. Every theorem carries its hypotheses in its own signature, and no section binder is lost. Examples: `existsUnique_shell_decomposition` keeps `0 < m`, `hU` and `hinv`; `existsUnique_extension_of_scalesBelow` keeps `σ < ↑n`.
- The types match their README statements in §1.1, §1.9, §5.16, §6.9, §7.3 and §7.6. The README is slightly more general in one place: Lean's `m : ℝ` covers the README's `m ≥ 0`, with the same `m²`.
- Padding probe on a scratch copy: each `sorry` was replaced by `first | (rfl; done) | (infer_instance; done) | (simp; done) | (norm_num; done) | (fun_prop; done) | (positivity; done) | exact?`. All 14 fail, ending with "`exact?` could not close the goal". Nothing is padding.
- The file has no `set_option`, no sorried data and no `lemma`. `toOneParticle` is data built from a real function and a sorried `MemLp` proof. Its imports are `import Mathlib` plus `TauCeti.Analysis.PDE.HeatKernel.Basic`.
- The module docstring names the non-statable headlines and the carrier each lacks: Fock spaces; a Poincaré representation, which is needed for Wightman fields and nets; wavefront sets; the graph Hopf algebra; distributions on a torus; and the Einstein–Hilbert jet algebra.

**Headline theorems** (Summary, line 3), each stated in `Suggested.lean` or named in its docstring as not statable:
- causal Green operators (§1.1);
- the four boundary values, their relations and the invariant classification (§1.9);
- quartic asymptotics and continuation (§5.16);
- extension below the scaling degree (§6.9);
- reflection positivity and one-particle density (§7.6);
- the zero-mass limits (§7.3);
- free fields and Shale's theorem, RQFT3 and RQFT10 (docstring: Fock spaces);
- Reeh–Schlieder, spin–statistics, PCT, OS reconstruction, Haag–Ruelle and LSZ (docstring: Poincaré representation and nets);
- the forest formula and the RG action, RQFT6 (docstring: wavefront sets and the graph Hopf algebra);
- graviton power counting, RQFT11 (docstring: Einstein–Hilbert jet algebra).

**Library declarations opened** (branch pin unless stated):
- `TauCeti.heatKernel`, `(4πt)^(−n/2)exp(−‖x‖²/(4t))` (`TauCeti/Analysis/PDE/HeatKernel/Basic.lean` line 68);
- `TauCeti.exists_isCompl_of_isKilling` (`…/HighestWeight/CompleteReducibility.lean` line 259);
- `TauCeti.exists_unit_conj_of_algEquiv` (`…/CentralSimple/SkolemNoether.lean` line 139);
- `TauCeti.UniversalEnvelopingAlgebra.instHopfAlgebra` (`…/UniversalEnveloping/HopfAlgebra.lean` line 162; line 161 at main's pin);
- the R05 and R06 declarations;
- `meromorphicOrderAt_ne_top_iff`, `tendsto_cobounded_of_meromorphicOrderAt_neg`, `tendsto_nhds_of_meromorphicOrderAt_nonneg` and `MeromorphicAt.analyticAt` (`Mathlib/Analysis/Meromorphic/Order.lean` lines 129, 172, 225, 333; declared with `lemma`, but present);
- `Distribution` (`…/Distribution/Distribution.lean` line 165, real-valued tests);
- `TestFunction.monoCLM` (`…/TestFunction.lean` line 467);
- `GaussianFourier.integral_cexp_neg_sum_mul_add` (`…/Gaussian/FourierTransform.lean` line 276).

**The Tau Ceti revision.** The README reads Tau Ceti at main's manifest pin, 2fd255d9. The branch's own manifest pins 358314d.
- `…/LeviCivita/Nondegenerate/`, `…/HilbertSchmidt/` and `TauCeti/Algebra/Lie/Whitehead.lean` exist at 2fd255d9 and not at 358314d. The README names its revision, so this is not a defect.
- The Mathlib names that `Suggested.lean` uses (`monoCLM`, `compCLMOfContinuousLinearEquiv`, the `𝓓'` and `𝓢'` notations, `IsVonNBounded`) also exist at main's Mathlib pin, 1b1ccf4b.

**Cross-roadmap citations resolved.**
- QuantumFoundations at 824bab8: §6.3 (line 724), §6.4 (740), §8.1 (873), §8.2 (890), §9.4 (995), §9.5 (1013) and §9.9 (1077).
- NoncompactQuantumSymmetry at 4e793e8: P.4 (543; its Whitehead bullet consumes Tau Ceti's `LieModule.Cohomology` lemmas), P.5 (628), M0 (840, items at 1150–1160 with `Q_N`), M2 (1884), M4 (2393) and the `ε_E` labels (2426, 2639).
- UnboundedOperators at cfd0df5: UO-A01, A08, B01, B05, D06, D07, E01, E03 (§5.3, line 954), E05, F01 and F04 are all present.
- On main: OperatorTheory SA-B05, OI-B32, OI-B40, OI-C01 and OI-C14; OperatorAlgebraDynamics D8 (line 12, which excludes Bogoliubov implementability, so RQFT10 owns Shale); PseudodifferentialOperators P1.0 (line 164); ComplexKahlerGeometry K3.MeromorphicGermField, K3.HolomorphicStalk, K5a.DistributionLocalStructure and K5a.SmoothSectionMontel; Hyperfunctions HF3 and HF5; VonNeumannAlgebras V2.RectangularL2, V4.Core and V10.Affiliation; PDE §6.3.
- GlobalHolomorphicFunctions Layer 4 (GH2, line 1436 at its head) and StochasticCalculus §1.2 (line 893 at its head).

**Ownership.**
- QuantumFoundations line 27 and NoncompactQuantumSymmetry line 23 name this roadmap as owner of free fields, the axioms, spin–statistics and Shale, and of the conventions and Green operators.
- SpinRepresentations line 932 names RQFT2 for its phase-cochain twists and P, C, T.
- `roadmaps grep` over main and the 469 open heads finds no second owner of the infinite-dimensional Haar obstruction (§0.5), the group-algebra group-likes (§5.4), Shale (§10), or the Wightman, OS, Haag–Ruelle and Connes–Kreimer objects. The only duplications found are the library ones in R05 and R06.

**Sources checked at their locators.**
- bostelmann05: Definition 2.1 (line 180), Theorem 3.3 (217), Lemma 3.5 with (3.15) (334–340), Theorem 3.6 (374), Definition 4.1 (410–413), (4.6) (444), Theorem 4.3 (448), (4.7) (460), (4.8) (465). The "weak closure" of (3.12) is at line 323.
- dang14: Theorem 3.4 (1227–1231, with the same Ξ as the README) and Theorem 3.5 (1233–1238).
- bf00: §5.1 and (33) (1040–1060), Theorem 5.2 (1118), Theorem 5.3 (1188).
- borcherds-qft: §8.3 (2421–2428, p. 65).
- bm23: Proposition 2.12 (1004–1009, p. 18).
- hw01: Lemma 4.1 (982), (70) (1041), (75) (1066).
- tener16: Definition 2.12 (410), Theorem 2.13 (422).
- cp17: Theorems 1.1–1.3 (359, 366, 422), Proposition 1.7 (509).
- lms17: Theorem 2.2 (173).
- bd05: §3.1 (339), Theorems 3.2 (363) and 3.4 (390).
- dybalski05: Theorem 1.1 (96), Lemmas 2.1–2.2 (145, 190).
- ck00: (6) (363), Theorem 1 (418).

**Sampled targets with no external source.** §1.5, §4.13, §5.10 and §6.38 are this roadmap's own elementary estimates and constructions, each with a complete proof route; the rows below compute them. §5.3 says it owns its route.

**Adversarial table.** H rows cover the headlines, S rows the seeded sample, F rows the findings.

| # | Statement | Instances and computed values (each side) | Result |
|---|---|---|---|
| H1 | `existsUnique_retardedSolution`, `existsUnique_advancedSolution` (§1.1) | `f=0`: `J⁺(∅)=∅`, so `u=0` and `kleinGordon m 0=0=f`. `m=0` is allowed and `m<0` gives the same `m²`. Uniqueness: the difference solves the homogeneous equation with past-compact support, so it is `0` (bgp08 Thm 3.1.1). | sound |
| H2 | `exists_prescription_distributions` | For `ε>0`: `|(p⁰+iε)²−ω²|=|p⁰+iε−ω||p⁰+iε+ω|≥ε²` and `|h+iε|≥ε`, so every pairing is integrable against Schwartz tests. | sound |
| H3 | `prescription_relations` | Using `1/(x±i0)=PV∓iπδ`: `G_R=−Q+iπ(D₊−D₋)`, `G_A=−Q−iπ(D₊−D₋)`, `G_F=−Q+iπ(D₊+D₋)`, `G_aF=−Q−iπ(D₊+D₋)`. Then `G_F−G_A=2πiD₊` (Lean `G 2 − G 1`), `G_F−G_R=2πiD₋` (`G 2 − G 0`), and both sums are `−2Q`. | sound |
| H4 | `existsUnique_shell_decomposition` | At `m=0`, `δ₀` is invariant with `p²δ₀=0`; `hm` excludes it. `D₊` and `D₋` have disjoint supports, so `(a,b)` is unique. `G_R` has `b=conj(a)=−iπ` (real), while `G_F` has `b=a`. | sound |
| H5 | `norm_quarticIntegral_sub_sum_le` | `N=0`: `|Z|≤∫e^(−φ²/2+Re j φ)`. For `Re x≥0`, the remainder is `(−x)^N/(N−1)!∫(1−s)^(N−1)e^(−sx)ds`, of modulus `≤|x|^N/N!`. `b₁=3/24=1/8` and `b₂=105/1152=35/384`. | sound |
| H6 | `quarticContinuation_continuation` | `t=ζφ` gives `F(ζ,j)=Z(j,ζ⁴)` for `ζ>0`. `t↦−t` gives `F(−ζ)=−F(ζ)`. The limit at `0⁺` is `√(2π)e^(j²/2)` and at `0⁻` its negative, so `F` is not meromorphic at `0`. At `ζ=ir` the integrand peaks at `e^(3/(2r⁴))`. | sound |
| H7 | `existsUnique_extension_of_scalesBelow` | `n=0`: the punctured space is empty and `u=cδ`; for `d∈(σ,0]`, `s^d·c·f(0)↛0` unless `c=0`, so `u=0` is unique. `δ` on `ℝⁿ`: `s^(d−n)f(0)→0` iff `d>n`, so the scaling degree is `n>σ`. This matches bf00 (33) and Theorem 5.2. | sound |
| H8 | `reflectedCovariance_eq_inner` | `G_m(t,x)=∫d³p/(2π)³ e^(ip·x)e^(−ω|t|)/(2ω)`. For `x₁,y₁>0`, `|−x₁−y₁|=x₁+y₁`, so the kernel factorises into `conj(Kf)·Kg` against `dμ_m`. The heat kernel at line 68 has `n=4`. | sound |
| H9 | `memLp_laplaceSpatial`, `denseRange_toOneParticle` | `|K_Ef(p)|²≤∫|f̃|²dt/(2ω)`, so `‖K_Ef‖²≤‖f‖²/(4m²)` by Plancherel. | sound |
| H10 | `greenOne_sub_const_tendstoUniformlyOn` | With `u=m|x|`: `(e^(−u)−1+u)/(2m)≤u²/(4m)=m|x|²/4`, which tends to `0` uniformly on bounded test sets. | sound |
| H11 | `greenTwo_sub_const_tendstoUniformlyOn` | Frullani: `(4π)⁻¹∫(e^(−r²/4t)−e^(−1/4t))dt/t=−log r/(2π)`, and `|G_m(r)−G_m(1)|≤|log r|/(2π)`. | sound |
| H12 | `multiplier_tendstoUniformlyOn` | The difference is `m²/(4π²|ξ|²(4π²|ξ|²+m²))`. For `n=3`, `∫_0^1 m²dr/(r²+m²)=O(m)→0`. `n=2` diverges logarithmically and is excluded by `3≤n`. | sound |
| S1 | §1.5 KleinGordonNonrelativisticLimit | `x=r²/(m²c²)`: `0≤1+x/2−√(1+x)≤x²/8` (squaring holds for `x≤8`; the right side is negative for `x>5.47`). At `r=mc` the middle is `0.0858mc²` and the bound `0.125mc²`. `ℏ²∂_t²φ=−H²φ` gives the KG equation. | sound |
| S2 | §2.13 Gamma realizations | `{α^i,α^j}=−{γ^i,γ^j}=2δ^(ij)`, so `(α·n)²=I`. `U_R(2π)=cos π·I=−I`. `det[[c,−s],[s,c]]=cosh 2θ>1`. `γ⁰(−γ^i)γ⁰=γ^i`. | sound (UNSW waived) |
| S3 | §3.4 free Dirac field | `(γ·p−m)(γ·p+m)=p²−m²=0` on the shell. `Σ_sū_su_s=tr(γ·p+m)=4m=2·2m`. `{ψ,ψ̄}` is the c-number of §1.3. | math sound; R08 |
| S4 | §4.5 Net-to-point-field | Trivial net: rank 0 fails since `r^(−γ)|τ(1)|↛0`, so `N_γ=1` and `Φ_γ=ℂ1`. `‖L^nσL^n‖=‖R·L^(n+1)σL^(n+1)·R‖≤‖L^(n+1)σL^(n+1)‖`. `P_mσP_m∈E_∞`, so `‖τ_m−τ‖_n=‖P_mσP_m−σ‖₁→0`. | sound; R09 |
| S5 | §4.13 NullSector | `[Ω,Ω]=1`; `E` and `E†` are isotropic. `A(g)(0,w,0)=(0,0,0)`. Hermiticity: both sides equal `β(w_μ(f))`. At `p=(1,0,0,1)`, `p₁=0` and `F₀₁(f)Ω=i f̂(p)[e₁]` with `[e₁]∉ℂp`. | sound |
| S6 | §5.3 MarkedMetricRealization | Theta graph with equal lengths: 4 isometries = 4 half-edge automorphisms; with lengths `1,2`: 2. Marked loop: `ℤ/2`, against `O(2)` for the circle. | sound |
| S7 | §5.6 FieldJets | `Δ(u²)=u²⊗1+2u⊗u+1⊗u²`. `Δ³(φ⁴)` has coefficient `4!=24` on `φ⊗φ⊗φ⊗φ`. `(1⊗ψ₁)(ψ₂⊗1)=−ψ₂⊗ψ₁`. | math sound; R05 |
| S8 | §5.10 FiniteOddPolarization | `B(x+y,x+y)−B(x,x)−B(y,y)=2B(x,y)`. `Λ^k` on `M` generators is `0` for `k>M`, so fresh generators are needed. | sound |
| S9 | §5.19 torus Born rate | The `b_kb_k†` terms give `Û(t,0)Σ(2ω_kL³)⁻¹`. Plancherel: `∫|χ̂_T|²=2π∫|χ_T|²`. `|M|²=|Û|²/(4ωω′L⁶)` and `Σ_(p′)→L³∫d³p′/(2π)³` give `dℛ=2πδ|Û|²/(4ωω′)d³p′/(2π)³`. `ω_k+ω_q≥2m`. | sound (UNSW waived) |
| S10 | §6.9 ControlledExtension | The README's `Ξ_ψ` matches dang14 Thm 3.4 (line 1230). `sd(G_F²)=4`, so the ambiguity is `cδ`; the sunset has degree `6`, so `|α|≤2`. Translation-invariant `Γ` has `η=0`, so `Ξ_tan=∅`. | sound |
| S11 | §6.35 | Borcherds–Barnard §8.3 items 1–4 (lines 2423–2428): the README's results are items 3 and 4. | R04 |
| S12 | §6.38 FiniteEngineeringClosure | `φ⁴` bubble: `4−4−0=0`. `φ³` bubble: `4−2−2=0`. Proca is `O(1)`. `g^jx^j` has weight `0`. Check 4 with `c=g`, `q=1`: `−1+0+1+4=4≤4`. | R03 |
| S13 | §7.5 OSConstruction | `‖T_sf‖²=⟨f,T_(2s)f⟩≤‖f‖‖T_(2s)f‖`. Iterating gives `‖f‖^(1−2^(−k))‖T_(2^ks)f‖^(2^(−k))→‖f‖` under polynomial growth. The generator count is `4+6=10`. | sound (OS II unreadable) |
| S14 | §9.1 | `M(−n,b,z)` has leading coefficient `(−1)^n/(b)_n≠0` for `b∉−ℕ`, hence degree `n`. | R07 |
| S15 | §9.7 QuantitativePauliComparison | `|r−1/(2m)|=|V−ε|/(2m(2m+ε−V))≤δ/(2(2−δ)m)`. `‖Jf‖²=(R+m)/(2R)+(R−m)/(2R)=1`. `H_DJ=JR`, row 1: `(m(R+m)+R²−m²)/√(2R(R+m))=R√((R+m)/(2R))`. Residuals `r_f=QD_t(QF)/(4m²c²)` and `r_g=−D_t²(QF)/(4m²c³)` check. `(σ·Π)²=Π²−(eℏ/c)σ·B`. | sound |
| F1 | §9.4 one-photon term | `(∂φ̄−ieAφ̄)(∂φ+ieAφ)⊃ieA^μ(φ∂_μφ̄−φ̄∂_μφ)`. With `e^(−ipx)` in and `e^(ip′x)` out, the vertex is `−ie(p+p′)`. The Check's sign gives `+ie(p+p′)`. | R01 |
| F2 | §4.15 Check | `f=(□+m²)g≠0` has `Kf=(m²−p²)Kg=0` on the shell. | R02 |
| F3 | §5.4 group-likes | Mathlib line 236 covers any type `M` over a commutative domain; `single_left_injective` gives uniqueness. Check: `½([e]+[g])` has `Δ=½(e⊗e+g⊗g)≠x⊗x`. | R06 |
| F4 | §4.15 nearby Checks | Jost `n=3`: `ξ₁+ξ₂` timelike is excluded. `η_(1,0)=i`, `η_(0,1)=−i`, `η_(1,1)=−1`, and `conj(η)η*=(−1)^(k+l)`. | sound |
| F5 | §9.8–§9.11 values | `Z=69` gives `69/137.04=0.5035>1/2`. Rutherford: `4Z²α²m²/(16m⁴v⁴sin⁴)=Z²α²/(4m²v⁴sin⁴(θ/2))`. Dirac–Coulomb: `γ=√(1−a²)≥1/2` iff `a≤√3/2`. | sound |
| F6 | §6.23, §6.26 coefficients | Tadpole: `π²κ^(2z)m^(2−2z)/(z(z−1))`, equal to `π²m⁴κ^(−2)/2` at `z=−1`. Bubble `p²` coefficient: `−π²∫x(1−x)dx/m²=−π²/(6m²)`, and `−1/(96π²m²)` with `(2π)⁻⁴`. | sound |
| F7 | §7.4, §7.7 values | Circle kernel: jump `−1`; mean `L/12−L/4+L/6=0`. `I₄=2π²·½B(2,1)=π²/2`. Perfect matchings: `1,1,3,15`. | sound |
| F8 | §10.2 squeezed state | `c₀²ΣC(2n,n)κ^(2n)/4^n=c₀²(1−κ²)^(−1/2)=1`. `S_s⁻¹S_t=cosh(t−s)I+sinh(t−s)C`. | sound |

**Remarks on Checks swept outside the sample (no change requested).** I recomputed the numeric Checks of Layers 0–2 and 5–11 (lines 118–811, 1486–2614, 2708–4456 and 4477–5514). Apart from R01–R03, all of them hold. Examples:
- the unit lattice determinant `1` and `ℏ/(mc)`;
- the shifted-Gaussian pairing `√2·π·e^(−(a²+b²)/4)e^(−iab/2)`;
- Cl(3,1) is `M₄(ℝ)` and Cl(1,3) is `M₂(ℍ)`;
- the Legendre `Γ=…−λφ²/4−λ/8`;
- the circle kernel `(π/m)cosh(m(π−|x|))/sinh(mπ)`, with jump `−2π` and mean `1/m²`;
- graviton `ω=2L+2`.

## Not verifiable

- Osterwalder–Schrader II (`os75`): the cached copy is a bot-block page and the DOI is paywalled (R11). The §7.1, §7.2 and §7.5 OS II locators are taken as stated.
- UNSW course notes (`unsw-qft`, waived): §0.1 p. 8 (line 112), §2.13 pp. 17–19, §5.19 pp. 36–38, §9.4 pp. 24–25, 41 and 61, and §9.7 p. 27 are cited by locator only. The §2.13 claim that the pp. 18–19 boost block is not Lorentz holds on the block itself (`det=cosh 2θ`); the page itself was not read.
- Streater–Wightman, Haag, Reed–Simon II, Hörmander I, Bogoliubov–Shirkov, Weinberg, Tong, and Strocchi 1967 and 1970 are settled as uncertified and cited by locator only.
- Epstein–Glaser (`eg73`), Greenberg, Borchers–Yngvason, Fewster, Collins, Strocchi 2023, Conti–Doplicher–Roberts, van Suijlekom, Bergbauer–Brunetti–Kreimer, Donoghue and DLMF are cached, but I did not open them this round. Earlier reports checked them.

## Source issues

- **Misprint** in bm23 at Proposition 2.12, equation (46), printed page 18 (bm23 line 1009): the source says `u` times its adjoint minus `v` times its adjoint equals the identity; it should say plus, since with `u=0` the printed form gives `−vv*=1`, which is impossible; affects a stated result.
- **Gap** in bostelmann05 at equation (2.6), printed page 3 (bostelmann05 lines 131–137): the source evaluates a map defined only on the damped functionals `C∞(Σ)` at `R^ℓσR^ℓ` for arbitrary `σ∈Σ`; it should first extend the map by continuity to `R^ℓΣR^ℓ` for `ℓ` beyond its continuity index; affects nothing.

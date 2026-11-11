<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13862#issuecomment-6800570506 -->
Review (claude) of b8df66d

Verdict: needs_changes

1. **F01** (P3) the composition of direct images on schemes is cited to the wrong section

   **Location.** `packages/GaloisActionOnEtaleCohomology/README.md` line 336 (§2.4): "the composition isomorphism `Rf′_* ≅ Rf_* ∘ Rg_*` that of SchemeAndStackFoundations §2.2"; line 345: "SchemeAndStackFoundations §§2.1, 2.2 (composition of direct images), 2.15".

   **Claim.** SchemeAndStackFoundations §2.2 states the isomorphism `R(f ∘ g)_* ≅ Rf_* ∘ Rg_*` on `D⁺`.

   **Witness.** SchemeAndStackFoundations on main: §2.2 states `leray_spectral_sequence` with its relative form for a composite and `cech_to_cohomology` only. The isomorphism is §2.1, `derivedPushforward_comp` (`R(g∘f)_* ≅ Rg_* Rf_*`), next to `Sheaf.derivedPushforward`.

   **Repair.** Line 336: "… that of SchemeAndStackFoundations §2.1 (`derivedPushforward_comp`)". Line 345: "*Needs:* §§1.4, 2.2; SchemeAndStackFoundations §§2.1 (`higherDirectImage_iso_sheafify`, `derivedPushforward_comp`), 2.15." Tested on `k = ℝ`, `X = Spec ℝ`, `X′ = Spec ℂ`, `M = ℤ/2`: `derivedPushforward_comp` for `id ∘ g` is the identity of `Rg_*`, the unit `ℤ/2 → g_*ℤ/2` has stalk the diagonal `ℤ/2 → (ℤ/2)²`, which is `g_C^*`. No dependency edge changes (§2.1 is already in the line, §2.2 stays in §2.5 and in the layer's Dependencies).

2. **F02** (P3) the rigid–adic correspondence is cited to the section that only names Tate's rigid spaces

   **Location.** `packages/GaloisActionOnEtaleCohomology/README.md` line 49 (Conventions): "Tate's rigid spaces correspond by §R1.1, *rigid-analytic-space*".

   **Claim.** AdicSpacesPartII §R1.1, target *rigid-analytic-space*, gives the correspondence between Tate's rigid spaces and adic spaces locally of finite type over `Spa(K, 𝒪_K)`.

   **Witness.** AdicSpacesPartII on main: *rigid-analytic-space* (§R1.1) is the category of Tate's rigid spaces, "Supplied by RigidAnalyticGeometry §§6.1–6.2". Huber's functor to adic spaces locally of finite type is §R1.7, *rigid-adic-comparison-functor*.

   **Repair.** Line 49: "Tate's rigid spaces (§R1.1, *rigid-analytic-space*) are carried to these by Huber's functor of §R1.7, *rigid-adic-comparison-functor*". Add "§R1.7 (*rigid-adic-comparison-functor*)" to the AdicSpacesPartII lists of line 27 (Scope) and line 86 (Exact supplier contracts). Tested: `Sp K⟨T⟩` goes to `Spa(K⟨T⟩, 𝒪_K⟨T⟩)`, the closed unit disc used in §§3.1, 4.3 and 4.4. Same supplier, on main: no new edge.

3. **F03** (P3) the cited proof assumes overconvergence, which the locator does not say

   **Location.** `packages/GaloisActionOnEtaleCohomology/README.md` line 283 (§2.1): "(in particular any abelian sheaf, with no torsion hypothesis) … (dejongvanderput1996, Corollary 3.7.5 and its proof, page 39, lines 1594–1605; huber1996, §2.4, Corollary 2.4.6)"; line 355 (§2.5) cites the same corollary for the `E_2` term.

   **Claim.** The cited corollary and its proof give the identification of `H^q(X_C, ℱ_C)` with the stalk of `R^q p_* ℱ`, as Galois modules, for every abelian sheaf.

   **Witness.** dejongvanderput1996 line 1596 states the corollary for any abelian sheaf, but lines 1601–1603 of its proof make that identification "if S is overconvergent". The general statement on the adic étale site rests on huber1996 (uncertified) and the route through ClassicalAdicEtaleCohomology §1.5.

   **Repair.** Line 283, after "lines 1594–1605": "where the proof makes the identification for overconvergent sheaves (line 1602); for every abelian sheaf on the adic étale site it is huber1996, §2.4, Corollary 2.4.6, and the route below". Line 355: "(dejongvanderput1996, Corollary 3.7.5, page 39, whose proof treats overconvergent sheaves; serreGC1997, Chapter I, §2)". The statements do not change: the route of §2.1 (colimit theorem of ClassicalAdicEtaleCohomology §1.5 with AdicEtaleGeometry A1.14) and of §2.3 (stalk formula of §1.5, for arbitrary `g`) assume no overconvergence. Tested on `ℱ = 𝒪_{X_ét}` over `X = Spa(K, 𝒪_K)`: the colimit is `K^sep`, as the third Check of §2.1 says.

Three findings, all P3 (none blocking): two supplier citations that name the wrong section of the right roadmap (one of them in the passage the last repair added), and one source locator whose proof carries a hypothesis the target does not mention. The finding of the previous round is repaired. The Lean file elaborates with `sorry` as its only warning, the dependency check is clean, the mathematics of every statement recomputed below holds, and the declared gap is precise and minimal.

## Previous round, finding by finding

| Id | State | Repaired passage |
|---|---|---|
| F01 (P2), §2.3 third consequence had no hypothesis on `X′` | repaired | `packages/GaloisActionOnEtaleCohomology/README.md` line 323: "For a morphism `g : X′ → X` of quasi-compact quasi-separated rigid `K`-spaces, with `f′ := f ∘ g`, the morphism `R^i f_* M → R^i f′_* g^{-1} M` induced by the unit … corresponds to the pullback `g_C^*`". Line 330 adds the negative-control Check; line 336 gives §2.4 the same hypothesis ("one of quasi-compact quasi-separated `k`-schemes") and line 343 its own Check. |

The repaired pattern (a dictionary or discreteness statement applied to a second space with no hypothesis on it) was searched in §§1.3 (a), 2.5, 3.2, 4.2, 4.3 and 4.4: each either assumes quasi-compactness or does not need it (§1.3 (a) and the fourth bullet of §3.2 use no colimit over finite levels). The adversarial pass on the changed passages gave R01.

## Adversarial table

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `exists_galois_continuousAut_equiv` (§0.2, Lean) | `K = C`; `𝔽_p((t))`; `S₃` over `ℚ_2`; transcendental swap on `ℂ_p`; joint continuity | Both sides one point. `K̄ ≠ K^sep`, roots of a minimal polynomial in `C` lie in `K̄`, so a continuous endomorphism restricts to `K̄`. With `r(α) = ζα`, `s(ζ) = ζ⁻¹`: `sr(α) = ζ⁻¹s(α) ≠ ζs(α) = rs(α)`. Swap of `t₁, t₂` with norms `1, p⁻¹` is not isometric. `|σ̂y − σ̂₀x| ≤ max(|y − a|, 0, |a − x|)` on `σ₀·Fix(K(a))` | true | none |
| §0.1 density, uniqueness of the norm | `X^{p^e} − tX − b`; `X^p − sX − t`; `max(|a|, |b|)` on `ℚ_p(√p)` | Derivative `−t ≠ 0`. `(b_s − t^{1/p})^p = s b_s`, `|b_s|^p ≤ max(|s||b_s|, |t|)` bounded. The max norm is submultiplicative, `|√p|² = 1 ≠ p⁻¹` | true | none |
| §0.3 neighbourhoods and `P^op` | `ℚ_3(√3)`; `μ_4`; `V = Spa K ⊔ Spa K`; `𝔽_2((t))(t^{1/2})` | One arrow `(Spa L) → (Spa K)`, none back. `μ_4(K^sep)` order 4, `μ_4(ℚ_3)` order 2. Germ of `(s_1, s_2)` is `s_1`. `T² − t = (T − t^{1/2})²`, one embedding | true | none |
| §1.1 `a^♮`, composition, degree zero | `μ_n = h_V`; `S₃` cover; `ℤ/4`, `ℤ/2`; `M_2(𝔽_2)` | `T ↦ ζ` composed with `σ̂` is `T ↦ σ(ζ)`. `δ_1 ↦ δ_s ↦ δ_{rs}`, wrong order `δ_{sr}`; `(τσ)_Y = σ_Y ∘ τ_Y`. `Tor_n = ℤ/2` for all `n ≥ 0`. `BAe_1 = 0`, `ABe_1 = e_1` | true | none |
| §1.2 rigid action | `X = Spa L`; cubic `ℚ_2(2^{1/3})`; `𝒪_{X_ét}` | `φ_τ ∘ (id ⊗ σ̂)` has the kernel of `φ_{σ⁻¹τ}`; indicator `τ₀ ↦ στ₀`. Rank 3, trace 1 at a transposition; regular: 6, 0. `H⁰ = K^sep` | true | none |
| §1.3 (c), (e), (f) | Kummer on `Spa K`; `K(t^{1/p})`; `τ ∈ G_K` | `0 → μ_n(C) → (K^sep)^× → (K^sep)^× → 0` exact; `G_L = G_K`; `ρ(τ)⁻¹ρ(τστ⁻¹)ρ(τ) = ρ(σ)` | true | none |
| §1.4 scheme action | `k = ℝ`, `μ_4`; `𝔽_q`; `k = 𝔽_p(u)`, `Spec k(u^{1/p})` | `i ↦ −i`; `ζ ↦ ζ^q`; `X_{k^sep}` a field, `X_{k̄} = Spec k̄[T]/(T − u^{1/p})^p`, `H⁰ = ℤ` on both | true | none |
| §2.1 discreteness | `⊔_m Spa K` with `μ_{ℓ^m}`; `𝒪_{X_ét}` | Stabiliser `ker χ_ℓ` not open; colimit `K^sep`, not `C` | true; locator | R03 |
| §2.2 finite levels | `Spec ℚ(2^{1/3})` | `H⁰` at `ℚ`, `ℚ(α)`, `ℚ̄`: `ℤ`, `ℤ²`, `ℤ³` | true | none |
| §2.3 dictionary, third consequence (repaired) | `X′ = ⊔_m Spa(ℚ_2(μ_{3^m}))`; `X′ = Spa(L_1)`; `g = id`; `X′ = ∅` | Orders of 2 mod 3, 9, 27: 2, 6, 18; stabiliser `G_{K(μ_{3^∞})}` not open, excluded by the hypothesis. `(ℤ/3)²`, order 9, diagonal map. Identity. Zero maps | true | none |
| §2.4 dictionary for schemes (repaired) | `ℝ`, `Spec ℂ`, `μ_4`; `⊔_m Spec ℚ(μ_{ℓ^m})`; `⊔_m Spec ℚ` | `(i, 1) ↦ (1, −i)`. Factor sizes `ℓ^{m−1}(ℓ − 1)`, stabiliser `G_{ℚ(μ_{ℓ^∞})}`. Constant family: `∏ ℤ/ℓ` equals the stalk | true; citation | R01 |
| §2.5 point identification and Hochschild–Serre | `K = C`; `ℚ_3`, `μ_4`; `ℚ_2`, `μ_5` | `0 = 0` in positive degree; orders 2 against 4; `2² = 4 ≢ 1 (mod 5)` gives `H²(ℤ/5(−1)) = 0` against `H²(μ_5) = ℤ/5` | true; locator | R03 |
| §2.6 Frobenius normalisation | `F_{X_{k̄}} = (F_X × id) ∘ φ_X`; `q = 2`, `ℓ = 7`; `ℙ¹` | `(F_X × id)^* = ρ(φ)⁻¹`; scalars 2 and 4, product `8 ≡ 1`; `q⁻¹` and `q` on `ℤ/ℓ^n(−1)` | true | none |
| §3.1 groups, Milnor, reduction | `ℤ ← ℤ` by `ℓ`; `⊔_m Spa K`; disc over `𝔽_p((t))` | `lim = 0`, `lim¹ = ℤ_ℓ/ℤ`; base `ℓ^n ∏ ℤ_ℓ`, quotient `∏ ℤ/ℓ` infinite discrete; `C⟨T⟩/{g^p − g}` infinite | true | none |
| §3.3 rational topology | filter axioms; `G_K`-stable basics; `ℤ_ℓ/ℓ`; `∏ ℤ_ℓ`; indiscrete `ℚ_ℓ` | `Ω₁ ∩ Ω₂`, `ℓΩ`, `ℓ⁻¹Ω` basic (`j⁻¹(ℓ⁻¹Ω) ⊇ j⁻¹(Ω)`); `⋂_σ σ(Ω)` absorbing by compact orbits, open preimage by a finite subcover. `V = 0`. `e_m ∈ j⁻¹(ℓΩ)` gives `ℓ⁻¹e_m ∈ Ω ∖ j(A)`. Only `Ω = V` | true | none |
| §4.1 twisting | elliptic curve, `n = 7`, `ℚ_2`; `ℙ¹` | `χ·χ⁻² = χ⁻¹`: `2⁻¹ ≡ 4`; wrong direction `2³ ≡ 1`; `1 = 4·2` | true | none |
| §4.2 comparison | `Y = Spec L`; `ℙ¹`; `Y = ∅` | `Λ^{Hom_K(L, K̄)}` three times; `q⁻¹` on each `H²`; zero | true | none |
| §4.3 packaging | disc over `𝔽_2((t))`; disc, `char K = 0`, `ℓ = p`; Enriques | `a_{2s} = a_s²`, `a_{2m+1} = c_m`, so `a_{2^k(2m+1)} = c_m`, forcing `c_m = 0`. `|p||h| < |h|^p` when `|h| > |p|^{1/(p−1)}`, so the reduction of `(u − 1)/a` is a `p`-th power, against monomials `T^m`, `p ∤ m`. `ℤ_2^{10} ⊕ ℤ/2`, rational dimension 10 | true | none |
| §4.4 instances and the gap | (a)–(d) against the suppliers; `ℙ^d` | §9.7 smooth proper, `n` invertible in `𝒪_C`; §8.4 any `n > 0`; §AI.3.1 finite and zero above `2 dim X`; §11.1 locally algebraically of finite type; huber2007 Corollary 5.6: quasi-separated of finite type, torsion prime to the residue characteristic. `H^{2m} = ℤ_ℓ(−m)` | true, conditional on the gap | none |
| Conventions, rigid `K`-spaces | `Sp K⟨T⟩` | AdicSpacesPartII §R1.7 sends it to `Spa(K⟨T⟩, 𝒪_K⟨T⟩)`; §R1.1 has no functor | citation | R02 |

## Verified sound

- **Elaboration.** `lake env lean` on `packages/GaloisActionOnEtaleCohomology/Suggested.lean` from the content checkout: one warning, `declaration uses sorry` at line 119; no error. Single `import Mathlib`, no `TauCeti.*` import, no `set_option`, no sorry'd data, no `#eval`, `#print` or `lemma`.
- **Signatures.** `#check @name` on the 3 declarations in a scratch copy: `SpectralAlgClosure : (K : Type u) → [Field K] → Type u`; `CompletedAlgClosure` and `exists_galois_continuousAut_equiv` carry `NontriviallyNormedField`, `CompleteSpace`, `IsUltrametricDist`, as Conventions and §0.2 state. Nothing changed. Proved in the same scratch file by `rfl` or `inferInstance`: `CompletedAlgClosure ℚ_[p] = PadicComplex p`; `NormedField` and `CompleteSpace` on `CompletedAlgClosure K`; `algebraMap K C` factors through `K̄`; `algebraMap K̄ C` is the completion coercion; the topology on `Field.absoluteGaloisGroup K` is `krullTopology K (AlgebraicClosure K)`.
- **Padding probe.** The one sorried theorem with `first | simp | rfl | infer_instance | exact? | aesop`: none closes it. It restates no definition and mirrors no Check; the file has no `example`.
- **Headlines.** Five end theorems in the Summary; the first is stated; the module docstring names the rest in nine entries with the missing carrier. Checked at the pins: no étale site under `TauCeti/AlgebraicGeometry/AdicSpace` (the only file there mentioning étale maps is `Spa/FiniteAlgebra.lean`, on finite étale maps of Huber pairs); `ContinuousAlgEquiv` has no group instance in `Mathlib/Topology/Algebra/Algebra/Equiv.lean`.
- **Library pins, 40 declarations opened at the cited file and line**, all present with the stated hypotheses: Mathlib `Field.absoluteGaloisGroup` (:42), `mapOfAlgebra` (:59), `IntermediateField.fixingSubgroup_isOpen` (:170), the six spectral-norm declarations (:381, :755, :809, :573, :699, :451), `Completion.map`, `map_id`, `map_comp`, `map_unique`, `ext` (:477, :496, :506, :491, :414), `instField` (:148), the completion instances (:82, :86), `NormedField.instCompletableTopField` (:24), `IsAlgClosed.of_denseRange` (:46, with `CharZero`), `exists_roots_norm_sub_lt_of_norm_coeff_sub_lt` (:52), `ContinuousAlgEquiv` (:45), `SeparableClosure` (:348), `TopRep` (:31), `TopRepEquivActionTop` (:212), `continuousSMul_iff_stabilizer_isOpen` (:299), `smallEtaleTopology` (:50), `Sheaf.H` (:57), `H.map` (:112), `PadicAlgCl` (:54), `PadicComplex` (:137), `isAlgClosed` (:244). Tau Ceti, all in namespace `TauCeti` except the two noted: `absoluteGaloisGroupRestrictEquiv` (:340), the `CompactSpace` instance (:374), `CategoryTheory.Sheaf.H.pullback` (:69) with its four lemmas, `continuousLocalCyclotomicCharacter` (:54), `IsArithFrobeniusLift.coe_localCyclotomicCharacter` (:61, coprimality hypothesis), `PadicTateTwist` (:88), `Module.Finite.of_quotient_smul_top` (:164), `ContinuousRep` (:82), `toContRepresentation` (:150), `isMittagLeffler_of_surjective` (:104), `subsingleton_limOne_of_isMittagLeffler` (:191), `AdicSpace` (`PreAdicSpace/Adic.lean` :249).
- **Supplier citations resolved at main or the open head.** AdicEtaleGeometry A1.1, A1.6, A1.7, A1.14 with the six italic targets and four `AdicSpace.*` names; AdicSpacesPartII §§R0.6, R0.7, R1.2 (R1.1: R02); AdicSpacesPartIV R4; ClassicalAdicEtaleCohomology §§1.1, 1.3 (a), 1.4, 1.5, 7.1, 8.2, 8.4, 9.7, 11.1, statements compared; SchemeAndStackFoundations §§0.23a, 1.10, 2.1, 2.15, 2.16 with nine names (§2.2: R01); EtaleCohomologyFoundations §§F.0.3, F.0.4, F.1, F.2.1, F.3.0, F.3, F.4.0, F.4.1, F.4.6, F.10.2, F.10.2b with seven names and the three Checks the README quotes; ProfiniteCohomology Layers 0, 1, 10, §§10.3–10.4; EnhancedDerivedSheaves §§0.1–0.4 with five names; DerivedModuleAlgebra §1.T.1; ArithmeticGaloisRepresentations §§1.1, 1.2; AInfCohomology §AI.3.1; PadicDifferentialEquationsAndRigidCohomology §RD.0.33; PadicPeriodRings §1.1, §2; DiamondsAndVStacks §D6.7. The 14 leads of `scratch/citations.md` are supplier names found in those READMEs. Consumers PadicHodgeTheory §2.7 and Layer 8, WeightsInEtaleCohomology §§1.7–1.8 and Layer 2, ClassicalAdicEtaleCohomologyPartII §§5.3, 5.9, 7.5 exist at their heads; PadicHodgeTheoryPartII and ProetaleCohomologyOfPAdicCurvesAndTowers are board packages; all consumers are later in the merge order.
- **Duplication and ownership.** `roadmaps grep` over main and every open head: no roadmap declares the three Lean names, constructs `σ_X` or `c_σ`, or cites huber2007; the only other mention of continuous `K`-automorphisms of `C` (HodgeTateAndCanonicalSubgroups) uses them and constructs nothing. ClassicalAdicEtaleCohomology §1.1 still lists `H^n(Spa(K, 𝒪_K), F) ≅ H^n_cont(G_K, F_ξ)` under its Checks, so §2.5 is its only owner. `scratch/overlaps.md`: no other pull request changes this roadmap, no dropped id, no id defined only by a revision.
- **Dependency check.** Output: `depcheck: 207 roadmaps, 1919 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line; the roadmap is at line 121 of the merge order.
- **Declared gap.** `gap:proper-rigid-finiteness`: the same slug, supplier (ClassicalAdicEtaleCohomology) and section (§9.7) in `design/plan.json` and README line 100; one sentence with its hypotheses; not provided by §9.7 (smooth) or §11.1 (locally algebraically of finite type); huber2007 lines 953–965 support it. An acceptance would be conditional on it.
- **Sources, the seeded sample (15 targets), every locator read.** dejongvanderput1996 lines 1159–1204 (pages 28–29), 1477–1488 (page 36), 1571–1587 (page 38), 1594–1606 (page 39). stacks03N1 lines 3733, 3745–3746, 3963–3969, 4216, 4229, 4241. milneLEC lines 3237 (page 81), 3834–3866 (pages 96–97), 3940 (page 99), 4133 (page 105), 4534 (page 116), 4781–4783 (page 123), 4860 (page 125). zavyalov2025 lines 3798–3806 (page 78). hansenzavyalov2023 lines 1684, 1706, 1708 (page 39). berkovich1993 lines 4584, 5110, 5339 (printed pages 128, 143, 150; hypotheses as the README describes them). scholze2013 line 1279 (page 28). huber2007 lines 953, 963 (printed page 996). stacks01FQ lines 1451, 1515, 1525. All 13 cited works are in `sources.toml`.
- **Shape and policy.** Five layers named by their mathematics, each ending in Examples and Dependencies, the order forced by the dependency lines; 20 subsections, each with a `*Needs:*` line and 3 to 6 Checks. No LaTeX delimiters, process words, pull-request numbers, dates or machine paths. The three backticked names of the roadmap's own are declared in `Suggested.lean`.
- **Remark, no change needed.** In the route of §2.6 the parenthesis "EtaleCohomologyFoundations §F.0.4" reads as the source of the coefficient identification along the absolute Frobenius (which §F.0.4 supplies), and the triviality of its action as sga4half; §F.10.2 states the resulting inverse relation directly.

## Not verifiable

- huber1996, huber1994, sga4half, serreGC1997: recorded as uncertified; their locators were not read. Target 2.6 rests on sga4half alone for a literature locator, and the general-sheaf form of 2.1 on huber1996 (R03).
- zavyalov2025: the Annals pagination was not compared with arXiv v3; the manifest says so and the README cites the arXiv numbering.
- Ownership against open pull requests was checked through `roadmaps grep` over main and every open head and by reading the suppliers named above, not by reading all 202 listed roadmaps in full.

## Source issues

- **Gap** in dejongvanderput1996 at the proof of Corollary 3.7.5, printed page 39: the source says the cohomology of the geometric fibre equals the stalk of the direct image when the sheaf is overconvergent, while the corollary is stated for any abelian sheaf; it should be either an overconvergence hypothesis in the statement or an argument for general sheaves; affects the proof.
- **Misprint** in dejongvanderput1996 at the proof of Corollary 3.7.5, printed page 39: the source says the comparison with Galois cohomology uses a Lemma 3.3.2; it should be Corollary 3.3.2, since §3.3 has Lemma 3.3.1 and Corollary 3.3.2 only; affects nothing.
- **Misprint** in stacks03N1 at Example 59.3 (Tag 03QV), items (3) and (4): the source says the sheaves `𝔾_a` and `μ_n` are restricted to the spectrum of the separable closure; it should be the small étale site of `Spec(K)`, as in item (2); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b8df66d78d4d0543435058f136cc7df58ff0e0c4", "job": "REV-PKG-GaloisActionOnEtaleCohomology~3", "model": "fable", "worker": "chris-x8"} -->

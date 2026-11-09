# Review of FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (pull request #1843 at 006b950)

**Verdict:** accepted

This is a full review of the folder at the same head as the previous review (the folder diff is empty).

- The folder has no finding: the gate passes, the 15 sampled targets agree with their sources at the cited locators, every supplier citation resolves, and the adversarial pass found no false statement.
- Two items of the previous review remain, both outside the folder. The last repair reply marked them as not editable by the repair job, and that reason is correct, so they are settled and not raised again. They are listed under "Carried items" for the human who gives final approval, because each still needs a human edit.

## Previous findings

- **R01 (the plan's `gaps` do not match the README's contracts)** — not repaired, settled.
  - README lines 102–108 still state four contracts for GeometricSatakeAndFusion ("What GeometricSatakeAndFusion must provide (gap:scheme-local-model-representative), extending its §4.17: …"); `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/design/plan.json` still lists 11 `gaps`, none for that supplier, and keeps the older `needs` sentences for `full-fixer-cutting-tensors` and `ordinary-levi-full-fixer`.
  - The reply says the only plan edit open to the repair job is removing an entry. I have no evidence against that, and the README side needs no change, so the finding is settled as not actionable in this package.
- **R02 (the pull-request description says p>2 for Layer 0 and "Fourteen" contracts)** — not repaired, settled.
  - The description still reads "Over complete Noetherian local rings with perfect residue field and p>2, it constructs the Zink ring Ŵ(R)" and "Fourteen supplier extensions"; README line 26 states Layer 0 at every prime and the README has 15 contracts.
  - The description is not a file of the folder, so this is settled as not actionable in this package.

## Verified sound

### Carried items outside the folder, for the human approver

These are not findings on the folder. The acceptance is conditional on the declared supplier gaps, and the first item is what makes four of them declared.

- **`plan.json`.** Add four `gaps` entries and replace two `needs` sentences, so that the intake announces the four local-model contracts on GeometricSatakeAndFusion's job:

  | Slug | Supplier | Section | `needs` |
  |---|---|---|---|
  | `scheme-local-model-representative` | GeometricSatakeAndFusion | 4.17 | the sentence after the colon of README line 102 |
  | `scheme-local-model-hodge-immersion` | GeometricSatakeAndFusion | 4.17 | the sentence after the colon of README line 104 |
  | `schubert-curve-spanned-tangents` | GeometricSatakeAndFusion | 0.29 | the sentence after the colon of README line 106 |
  | `local-model-curve-spanned-tangents` | GeometricSatakeAndFusion | 4.17 | the sentence after the colon of README line 108 |
  | `full-fixer-cutting-tensors` (replace `needs`) | ReductiveGroupsPartII | RG2.3.5 | the sentence after the colon of README line 88 |
  | `ordinary-levi-full-fixer` (replace `needs`) | ReductiveGroupsPartII | RG2.3.3 | the sentence after the colon of README line 94 |

- **Pull-request description.** Replace "perfect residue field and p>2" by "perfect residue field and at every prime (p>2 from Layer 1 on)", "p-frames" by "frames with constant θ (p-frames for odd p)", and "Fourteen" by "Fifteen".

### Gate, build and form (run at 006b950)

- My own run of the gate ends `… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` with every counter 0. The worker's gate, with the targeted build, also passed (`build=0`).
- `lake env lean` on `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/Suggested.lean` exits 0 with no output.
- The dependency check with `--movable` prints `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Merge order: FiniteFlatGroupsAndIntegralPadicHodgeTheory 65, PrismaticCohomologyPartIII 84, ShimuraVarieties 105, PELModuli 115, PadicHodgeTheory 122, VectorBundlesAndIsocrystals 123, GeometricSatakeAndFusion 130, this roadmap 131.
- The outside-folder diff against `origin/main` is empty.
- Shape: 92 numbered targets in Layers 0–6; a script found no `*Needs:*` edge pointing to a later target; every layer ends with `### Examples` and `### Dependencies`; every definition I read has an API list and at least three Checks.

### `Suggested.lean` and the headline theorems

- The file declares nothing, so the `#check` comparison and the one-tactic probe have nothing to act on, and nothing is padding.
- The README's headline theorems are the 21 groups the module docstring lists (the perfect-ring and complete-local anti-equivalences §§0.2 and 0.13, the universal display §1.8, the torsors of §§2.4 and 2.6, the criteria §§3.7 and 3.9, the existence theorems §§3.11–3.17, §§4.4 and 4.14, the versal theorem §4.12, §4.13, §§5.1, 5.7, 5.8, 5.3, 5.11–5.12, 5.16–5.18, 5.17, §6.0, §§6.3–6.5 and §6.6).
- None is statable at the pins. I searched the pinned Mathlib and Tau Ceti for p-divisible or Barsotti–Tate groups, displays or a Zink ring, Breuil–Kisin modules, parahoric group schemes and divided-power envelopes: 0 files each. The 35 Tau Ceti files matching "Dieudonn" are author citations (Cartan–Dieudonné, Grothendieck–Dieudonné), not Dieudonné modules.
- The docstring names the missing carrier for each group and states nothing in its place.

### Library declarations opened at the pin (10)

- Mathlib: `WittVector` (`RingTheory/WittVector/Defs.lean:52`), `WittVector.frobenius` and `WittVector.frobeniusEquiv` with `[PerfectRing R p]` (`Frobenius.lean:218` and `:283`), `WittVector.verschiebung`, an additive map (`Verschiebung.lean:109`), `WittVector.Isocrystal`, a class with no finiteness field (`Isocrystal.lean:113`), `DividedPowers` (`RingTheory/DividedPowers/Basic.lean:77`), `Module.Grassmannian` and `Module.Grassmannian.functor` (`RingTheory/Grassmannian.lean:62` and `:185`), `Ideal.iInf_pow_smul_eq_bot_of_le_jacobson` with `[IsNoetherianRing R] [Module.Finite R M]` and `I ≤ Ideal.jacobson ⊥` (`RingTheory/Filtration.lean:415`), `IsLocalization.algebraMap_mem_map_algebraMap_iff` (`RingTheory/Localization/Ideal.lean:76`).
- Tau Ceti: `TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme` (`TauCeti/AlgebraicGeometry/GroupScheme/FiniteFlat.lean:20`).
- README line 44, "Representability of this functor is not at the pin", is true at this pull request's Tau Ceti pin 358314d: it has no `AlgebraicGeometry/Grassmannian` folder. (Main's later pin has one; that is a matter for the rebase, not for this head.)

### Sources: the seeded sample (15 targets, 24 passages read)

| Target | Locator in the README | What the text has there | Result |
|---|---|---|---|
| 0.6 | KPZ26 §5.1.2, pp.48–49, line 2101; Lau14 §2A, p.2214, lines 560–564 | pairs with a normal decomposition L⊕T, L⊕IT, ranks d and n−d, morphisms preserving M₁ (lines 2102–2107); Lau's normal decomposition for an arbitrary frame (lines 562–564) | agrees |
| 1.4 | KP18 Lemma 3.1.17, p.169, line 2011; KPZ26 §7.3.1(2), pp.85–86, line 3790 | A complete local, p-torsion-free, m_Aᴺ⊂pA, unique Frobenius-equivariant rational map; the erratum replaces the topology by the p-adic one and uses p>2 (lines 3790–3804) | agrees |
| 2.1 | KPZ26 Definition 3.4.4 and §3.4.3, lines 1234–1255; §5.2, line 2291; KZ25 §3.2.1–3.2.3, line 969 | "good" is a closed immersion of local models; chain form equivalent to ρ^⊕r on tot(𝓛) (line 1255); cutting on all O-algebras (lines 2294–2296) | agrees |
| 2.5 | KP18 Lemma 3.2.9 and (3.2.10), pp.172–173, line 2139; Hoff23 Lemma 2.7, p.18, line 857 | u↦[π]; E([π]) a non-zero-divisor; the E-block becomes the p-block (lines 2148–2165) | agrees |
| 2.7 | KPZ26 (5.2.2), pp.53–54, line 2330 | a_G=m_G²+π_E R_G and c(s̃_(a,0)⊗1)=s̃_a⊗1 (lines 2330–2333) | agrees |
| 2.10 | KPZ26 Definition 5.2.5, p.54, line 2345 | very good at x; equivalent to c descending to 𝒢-torsors (lines 2347–2350) | agrees |
| 3.1 | KPZ26 Lemma 5.3.13, pp.57–58, line 2514 | pM_𝔖⊂M_(𝔖,1)⊂M_𝔖, free; W[[u]][1/p]∩W(K)=W[[u]] (lines 2510–2543) | agrees |
| 3.2 | KPZ26 Lemma 5.3.2, pp.54–55, line 2374 | a 𝒢-fixed endomorphism preserves the universal filtration and is horizontal | agrees |
| 3.5 | KPZ26 §5.3.19–Proposition 5.3.20, pp.61–62, lines 2663–2672 | 𝒢 smooth affine, G° reductive, closure 𝒢⁰ a smooth stabilizer scheme, E°⊃E, μ° minuscule; proof by equal congruence kernels (lines 2695–2698) | agrees |
| 3.10 | KPZ26 Lemma 5.3.7(b) and Remark 5.3.8, pp.55–56, lines 2412 and 2439 | intertwining isomorphism gives very-goodness of the copy and of the diagonal; unrelated sums left open | agrees |
| 3.15 | KPZ26 §6.3.4–Corollary 6.3.5, p.71, line 3133 | W=V⊕V̄, ξ with τ(ξ)=−ξ, G₁=(G×G)∩GSp(W,ψ), trace/different form (lines 3115–3146) | agrees; see Source issues |
| 4.6 | KZ25 §§3.2.5–3.2.6, pp.23–24, lines 1055–1063; KP18 §3.2.12, pp.173–174, line 2189; KPZ26 Remark 7.1.4(1), p.73 | a section of the torsor constant modulo a_E exists by assumption (C), then lifts to a GL section (lines 1055–1063); the omitted assumption is recorded at line 3208 | agrees |
| 4.9 | KP18 proof of Proposition 3.2.17, p.176, line 2290; Hoff23 Lemma 2.34, p.28, line 1317 | O_K[[T]]→O_K×_k O_K, T↦(0,π), surjective; lift of (Ψ,Ψ′) (lines 2308–2313) | agrees |
| 5.12 | Kisin17 Proposition 1.1.10, p.9, line 386; Errata E.2–E.4, p.96 | a formally smooth quotient R_G through which exactly the adapted lifts factor; A′_G=A_G (lines 4263–4280) | agrees |
| 5.17 | Kisin17 Proposition 1.1.19, pp.11–12, line 484 | finite K′/K, lift over O_K′, quasi-isogeny, D(𝒢′)=g·D(𝒢), g⁻¹bσ(g) in the double coset, gG_W g⁻¹-adapted (lines 484–494) | agrees |

- Page numbers were checked against the page markers of the cached texts (KP18 text page n is printed page n+120).
- Also read for the conventions: Kisin17 lines 433–440 (§5.7's c=σ⁻¹(b)μ₀(E(0))) and lines 688–721 (§§5.16 and 5.18: the dual-lattice action and κ_G(g₀)=κ_G(g)).
- The README flags no locator as unverified.

### Cross-roadmap citations resolved (14 roadmaps, 54 sections)

- **On main:** ReductiveGroupsPartII §§RG2.1.5, RG2.2.4 (*division-algebra-building*, line 3615), RG2.3.3 (*parahoric-kottwitz-characterization*, line 4335), RG2.3.5, RG2.3.7, RG2.4.3; SchemeAndStackFoundations §§0.6, 1.15, 2.3, 4.1–4.4, 4.7, 4.8, 4.12; ModularCurves §0G (it owns the relative Grassmannian of a finite locally free module).
- **At open heads:**
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.1, R07.1.6–R07.1.8, R07.1.22, R07.2.10–R07.2.12, R07.2.27 (`deJongBoundedFormalFunctions`, line 4203), R07.3.2–R07.3.3, R07.4.1, R07.4.13, R07.4.16, R07.4.17, R07.4.20 (stated for finite K/ℚ_p, so the perfect-residue contract asks for something not yet provided), R07.4.21, R07.4.25.
  - PrismaticCohomologyPartIII §6.0, target "Perfect-base Dieudonné comparison": its Checks give M(ℤ/pʳ)=W_r with F=p·Frob and M(μ_(pʳ))=W_r with F=Frob, as README line 54 and the first Check of §0.2 say.
  - AbelianSchemesAndArithmeticModuli §§A4.CR.7.2 and A4.10; CrystallineCohomology Layer CR.1 and §CR.7.1; DerivedDeRhamCohomology §PD.7, which declares `Crystalline.fontaineEnvelope_initial` and `Crystalline.fontaineEnvelope_periodPDEnvelope` (the two leads of `scratch/citations.md`; they are that roadmap's names, not library names); PadicPeriodRings §§3, 4.1 and 4.3; PELModuli §M2.15 (displays over W(R) in characteristic p); ShimuraVarieties §7.0i; VectorBundlesAndIsocrystals Layer 1 and Layer 6 with the two quoted subsection titles; PadicHodgeTheory §5.5; GeometricSatakeAndFusion §§0.29, 0.31, 0.37, 4.17 (connected parahoric, v-closure, no scheme representative) and 4.18.
- None of the never-cite roadmaps is cited as a supplier.

### Duplication and ownership

- `scratch/overlaps.md`: no open pull request changes this roadmap, no cited id is dropped, no id is defined only by an open revision.
- `roadmaps grep` for very-good embeddings, the Zink ring, Dieudonné displays, (𝒢,μ)-displays and adapted lifts finds no second owner of the objects this roadmap owns.
- GeometricSatakeAndFusionPartII (open, merge order 207) states the good-embedding definition and the four local-model theorems that this roadmap requests from GeometricSatakeAndFusion (its lines 311, 478, 573 and its curve-spanning layer). This roadmap is earlier in the order, plans none of the four, and states Definition 3.4.4 in §2.1; the citation is owed by the later roadmap. Settled in an earlier round, unchanged.
- Declared gaps: the 11 slugs of the plan read the same in the README. Each `needs` I read is a single statement with its hypotheses. The four GeometricSatakeAndFusion contracts are precise and carry locators, and are the carried `plan.json` item above.

### Adversarial table

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §0.1, V versus ṽ at p=2 | R=ℤ₂ | V(1)−2 has ghost (−2,0,0,0); Witt coordinates −2, −2, −6, −54 (from 4+2x₁=0, 16+8+4x₂=0, 256+32+144+8x₃=0), all ≡2 mod 4 | V(1)∉Ŵ(ℤ₂), as stated | none |
| §0.2/§0.5 perfect-ring modules | R=𝔽_p, rank 1; R=𝔽_p×𝔽_p; M=0 | F=p gives V=1, F=1 gives V=p, F=4 at p=2 gives V=1/2 (excluded); ranks (1,0) allowed | holds | none |
| §0.3 frame constant | D_(ℤ₂); W(k)[[u]] | θ=F(2−[2])=2−[4], ghost 2−4^(2ⁿ)=(−2,−14,−254); φ₁(pu)=uᵖ | holds | none |
| §0.4 logarithmic coordinates | p=3, 𝔽₃[x,y]/(x³,y³) | second coordinate of [x]+[y] is ((x³+y³)−(x+y)³)/3=−x²y−xy²≠0 | Teichmüller splitting not additive, as stated | none |
| §0.6 normal pair (sampled) | d=0, d=h, S² with e₁↦e₂, S=0 | M₁=IM; M₁=M; lower-left entry 1∉I; quotient 0 | holds | none |
| §0.8/§0.10 tilde functor and j | block matrix | φ(f)·diag(1,θ) and diag(1,θ)·f̃ agree entrywise since φ(C)=θφ₁(C); image of φ*M₁ is φ*L⊕θφ*T | holds | none |
| §0.13 displays (headline) | μ_(p∞), ℚ_p/ℤ_p, p=2 over ℤ₂ | (Φ,Φ₁)=(θφ,φ) with M₁=M; (φ,ṽ⁻¹) with M₁=ÎM; Φ=(2−[4])φ | ranks 1 and 0 equal dim H | none |
| §1.4 rational section (sampled) | A=O_K; A=W[[t]]; A=k[ε] | m^e⊂pA holds; tᴺ∉pA, excluded; p-torsion, excluded | hypotheses exclude the divergent cases | none |
| §2.0 σ-centralizer | b=diag(p,1); b=[[0,1],[p,0]] | σ(a)=a, pσ(x)=x, σ(y)=py, σ(d)=d, so x=y=0; isoclinic slope 1/2 gives quaternion units | holds | none |
| §2.1 tensor datum (sampled) | empty family; identity in Λ⊗Λ∨; Borel closure | fixer GL(Λ); g·id·g⁻¹=id; a B-fixed vector has highest weight 0, so the fixer contains GL₂ | holds; negative control present | none |
| §2.5 lattice comparison (sampled) | rank 1, Fil¹=0 and full; E=u−p | image φ(E([π]))Ŵ=pŴ·unit; identity; reduction σ(E(0))=−p, not a unit | holds | none |
| §2.7 horizontality (sampled) | torus cut by E₁₁, p=3; c=1+εE₂₁ on k[ε] | R_G=W, a_G=(3), c=id; cE₁₁c⁻¹=E₁₁+εE₂₁; (d/a)E₂₁ with (a,d)=(2,1) is (1/2)E₂₁, 1/2≡2 mod 3 | holds | none |
| §2.10 very good (sampled) | GL, empty family; torus; basis swap | c fixes nothing to check; c=id fixes E₁₁; swap sends (E₁₁, diag(z,1)) to (E₂₂, diag(1,z)) | holds | none |
| §3.1 curve lattice (sampled) | Fil=0, full, split rank 2 | pM_𝔖; M_𝔖; 𝔖e₁⊕p𝔖e₂; u/p∈W[[u]][1/p] but ∉W(K) | holds | none |
| §3.2 endomorphisms (sampled) | t=id; t=E₁₁ for the torus | preserves every filtration; preserves ke₁ | holds | none |
| §3.4 products | G_m×G_m on ℤ₃², r=1 | c=1⊕1; r=1 is the hypothesis | holds | none |
| §3.5 neutral closure (sampled) | 𝒢=O(q), 𝒢⁰=SO(q), q split of rank 2, p>2 | both smooth of relative dimension 1; equal kernels of reduction on a square-zero ideal | holds; smoothness of 𝒢⁰ is a hypothesis | none |
| §3.10 copies (sampled) | G_m on ℤ₃, n=0,1,2; weights 1 and −1 | GL(0)={1}, kernel G_m; a↦a; a↦diag(a,a) cut by a=b; 2≠2⁻¹ | n≥1 needed and stated | none |
| §3.14 pairing | quaternions over ℚ₃, i²=−1, j²=3 (Hilbert symbol −1) | i⊗1 and 1⊗i both give Trd=−2; reversed φ₀ gives +2 and −2 | balanced only in the stated order | none |
| §3.15 symplectic enlargement (sampled) | D=K, m=1; m=2 | ψ((1,0),(0,1))=−1; dual of p⁻ⁱ(e⊕f) is pⁱ(e⊕f); same-index terms ℤ_p² and p⁻¹e⊕pf incomparable; (1,diag(1,2)) has multipliers 1 and 2 | holds | none |
| §3.16 different | ℚ_p(π), π²=p, δ=2π, M=πO_L e⊕O_L f | (M^Γ)^∨=ℤ_pe⊕p⁻¹ℤ_pf=(δ⁻¹M^♯)^Γ; without δ⁻¹: ℤ_pe⊕ℤ_pf | holds | none |
| §4.2 component counterexample | dilatation of GL₂ along {a^(p−1)=b^(p−1)} | component group μ_(p−1); image diag(1,χ_cyc) has unit determinant, reduction diag(1,ζ) | second conclusion needs the stabilizer hypothesis, as stated | none |
| §4.6 rigid section (sampled) | empty tensors; torus with c=id; hypothetical c=1+εE₂₁ | GL lift; Ψ₀c⁻¹ in the torus; [E₁₁,E₂₁]=−E₂₁≠0 | very-goodness is used exactly where stated | none |
| §4.9 interpolation (sampled) | (a,b) with a≡b mod π; (0,1) | f=a+T(b−a)/π has f(0)=a, f(π)=b; (0,1) not in the fibre product | holds | none |
| §4.12 versal theorem (headline) | torus cut by E₁₁ on μ_(p∞)⊕ℚ_p/ℤ_p | R_E=W[[t]], R_G=W; line K(e₁+te₂) is E₁₁-stable iff t=0 | adapted iff factors | none |
| §5.7 explicit lift | b=h·p^(υ₀), E(0)=ap | c=σ⁻¹(h)μ₀(a)∈G(W); with a≠1, μ₀(p) in place of μ₀(E(0)) changes the residue | holds | none |
| §5.10–§5.12 loci (sampled) | W[[t]], F=(1+tE₂₁)diag(p,1); GL₂; torus | N(0)=−E₂₁; n(t)=1+t^(p−1)n(tᵖ)=Σt^(pʳ−1); h=Σt^(pʳ)/pʳ, (h)=(t); dim G/P=1 and 0 | A′_G=A_G in the example; dimensions match | none |
| §5.16/§5.18 specialization | G_m, g=p | lattice pL, crystal pW, κ=1 at both ends; g₀∉G(W) | holds | none |
| §5.17 isogenous lift (sampled) | G_m, b=3, μ(z)=z⁻¹ and μ(z)=z; k=closure of 𝔽₃(t) | t_H=t_N=1; t_H=−1≠1, excluded; K̆=K not finite over ℚ̆₃ | holds; the second range is the declared contract | none |
| §6.0 normalization (headline) | G_m, μ=1; GL₂, μ=(1,0) | t_here¹ is p, κ=ν=1; diag(p,1), slopes (1,0), length 1; slopes (1/2,1/2) excluded | holds | none |
| §6.3 ordinary lift (headline) | E(0)=ap | c_E=E(u)/a, c_E(0)=p | holds | none |
| §6.5 action (headline) | g=[[1,1],[0,1]], h=[[1,0],[1,1]] | gh=[[2,1],[1,1]], hg=[[1,1],[1,2]] | q_(gh)=q_h∘q_g | none |
| Mathlib contract, line 44 | B=ℤ₃[[T]], I=(3) | B/I=𝔽₃[[T]] has 3-torsion; I·B[1/3]=B[1/3], contraction B | negative control correct | none |

## Not verifiable

- RZ96 (§5.3) is settled as uncertified and was not read.
- The source locators outside the seeded sample (Hoff23 beyond Lemmas 2.7 and 2.34–2.35, Zhu17, Zhou20, vanHoften24, Wintenberger97, RG71, deJong95, P23, Anschuetz22, and the remaining KPZ26, KP18, KZ25, Kisin17 and Lau14 locators) were not reopened this round; earlier reports read them at this text.
- Ownership against open pull requests was checked with `roadmaps grep` and `scratch/overlaps.md` at their index of 2026-11-09, and by reading GeometricSatakeAndFusionPartII; the other open roadmaps were not read in full.
- Whether the repair job can add `plan.json` entries is taken from the repair reply; I could not check it.

## Source issues

- **Error** in KPZ26 at proof of Corollary 6.3.5, p.71: the source says each paired lattice Λ_i⊕Λ̄_i can be made self-dual and calls their multiples a lattice chain; it should pair Λ_i with the cross-dual of Λ_(−i), so duality sends index i to −i; affects the proof.
- **Misprint** in KPZ26 at Remark 5.3.8, p.56: the source says part (b) applies when the embedding is good at x; it should be very good at x, the hypothesis of Lemma 5.3.7(b); affects nothing.
- **Misprint** in KPZ26 at §5.1.2, p.48: the source says, for a general frame, that the tilde module is a free module over the Zink ring of R; it should be a free S-module, the target category of the functor; affects nothing.

# PORT-VectorBundlesAndIsocrystalsPartII

## Result

- Branch: `roadmap/vector-bundles-and-isocrystals-part-ii`, created from `42813dd` on main.
- Head commit: `7d580296165e7b36772418757f7dd8298772e704` (`VectorBundlesAndIsocrystalsPartII: roadmap (README, Suggested.lean, metadata)`). It adds only `TauCetiRoadmap/VectorBundlesAndIsocrystalsPartII/{README.md,Suggested.lean,metadata.toml}`; nothing outside the folder changes.
- Build, `lake build TauCetiRoadmap.VectorBundlesAndIsocrystalsPartII.Suggested`: `Build completed successfully (18239 jobs).`
- Warnings: 4 lines. Two are `declaration uses sorry`, at `Suggested.lean:62:8` and `:83:8`. The other two are one Lake advisory printed twice (build and `irArts`): "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file". Lake prints it for every roadmap file on main that uses a plain `import Mathlib` (117 of the 188 `Suggested.lean` files). Silencing it would need `module` plus `public import Mathlib`, which the brief's import rule forbids. So there are no warnings apart from `sorry` and this advisory.
- Gate: `gate VectorBundlesAndIsocrystalsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0). The first run, before the commit, failed only on `dirty=1` because the folder was untracked.
- Dependency check (`gate --depcheck … --movable`), complete output: `depcheck: 214 roadmaps, 1900 edges, 0 problem(s)` (exit 0). It printed no UPWARD, CYCLE or `moved:` line.
- Citation resolver on the ported README, checked against main `45f58db` and 439 open heads: no cross-roadmap citations and no Lean names found nowhere. Main moved from `42813dd` to `45f58db` during the job. The six new commits touch none of the roadmaps cited here.

## Draft pull request body

This adds VectorBundlesAndIsocrystalsPartII, the second part of VectorBundlesAndIsocrystals. That roadmap's Layer 5 builds classical Banach–Colmez spaces over sympathetic algebras and stops at Le Bras's equivalence. This part continues in three directions. The first is Fontaine's arithmetic theory of almost `C`-representations of `G_K`: the strict Banach Galois category, full faithfulness of the forgetful functors from `C`- and `B_dR⁺`-representations, the fundamental theorem for an extension of a `C`-line, the abelian category `C(G_K)` with its Dimension, the Yoneda `Ext` comparison, the two-operator `Ext` complex and Euler–Poincaré duality. The second is the Colmez–Nizioł topological enlargement: Topological Vector Spaces in the left heart of nonarchimedean locally convex spaces, completed period Modules and Pairs, the perfectoid disc class `Ext¹_TVS(V₁, V₁) ≅ C`, Hom and `Ext¹` comparisons for reasonable period models, and quasi-Banach–Colmez spaces with their intrinsic curvature filtration and full faithfulness in TVS. The third is the period-valued height functor `h(W) = Hom_VS(W, B_dR)` with the height–rank formula `rank h(W) = ht(W) + rank Ext¹_VS(W, B_dR)`. These are the inputs that the Colmez–Nizioł `C_st` comparison (CstConjectureForDaggerVarieties) consumes. `Suggested.lean` states the two headlines that are statable at the pins, Fontaine's Théorème A and Théorème 4.1, for finite `K/ℚ_p` inside `PadicAlgCl p`. Its docstring names the other headlines and the carrier each one lacks.

## Dependencies that are still pull requests

VectorBundlesAndIsocrystals, PadicPeriodRings, PadicHodgeTheory, FiniteFlatGroupsAndIntegralPadicHodgeTheory, LocallyAnalyticDistributions, ArithmeticGaloisRepresentations, ArithmeticGaloisDuality, PerfectoidTowers and DiamondsAndVStacks. All nine come before this roadmap in the merge order. The suppliers on main are CompactOperators and PerfectoidSpaces. This roadmap cites no id that exists only in an open revision, and no open pull request drops an id it cites (overlaps file: none).

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already has the required form:
- one module docstring that names the non-statable headlines and what each lacks;
- `SemilinearRep`, a structure with a real body on native carriers, needed to state both headlines;
- the two headline theorems `semilinearRep_equivariant_map_smul` (§0.2) and `fundamental_extension_surjective` (§0.10).

It has no padding, no sorry'd data, no `set_option` and only `import Mathlib`. It is kept byte-for-byte; no `TauCeti.*` import is needed.

I checked for statable headlines that the file omits:
- Fontaine's Théorème A′ (§0.2, second half) is not statable: Mathlib's `BDeRhamPlus` carries no Galois action and no topology, and Tau Ceti has none at `2fd255d`.
- The structure theorem and the Euler–Poincaré duality (§§0.5 and 1.5) are not statable, and neither is §3.7, §5.4 or §6.7, for the carriers the docstring names.
- §§0.7–0.9 are not headlines, and §§0.8–0.9 also need `B_dR⁺` with its topology and action.
- I searched the pinned Tau Ceti: it has no Galois action on `ℂ_[p]` (only `norm_apply`, density and separability in `TauCeti/NumberTheory/Padics/`) and no Banach representation category.

### Mechanical signature check

I put `#check @SemilinearRep`, `@SemilinearRep.act`, `@SemilinearRep.act_smul`, `@SemilinearRep.continuous_act`, `@semilinearRep_equivariant_map_smul` and `@fundamental_extension_surjective` into one scratch file and elaborated it once with `lake env lean`.
- Every elaborated type matches its README statement: finite `K` via `[FiniteDimensional ℚ_[p] ↥K]`, finite-dimensional sources and targets with `IsModuleTopology`, a Banach `E` with jointly continuous action, `finrank W = 1`, and the image hypothesis `range η ≠ η(V)`.
- No binder is lost, since the file has no section variables.
- An `example` checked by `rfl` confirms that the topology `continuous_act` uses on `PadicAlgCl p ≃ₐ[K] PadicAlgCl p` is Mathlib's `krullTopology` instance.

Nothing changed as a result.

## Supplier replacements and duplication removals

Supplier citations made explicit (a README section used the object but did not name its owner):
- **PerfectoidTowers §P9.2** (*completed-structure-sheaves*) now owns the completed structure sheaf `Ô = (lim_m O⁺/p^m)[1/p]`. §3.4 had restated its definition from Scholze13 Definition 4.1; it now cites the supplier and keeps the formula only as a reminder.
- **PerfectoidTowers §P9.4** (*profinite-galois-tower*) is the definition of the pro-étale Galois tower used in §3.4. It was cited by target name without its section and missing from the Needs line.
- **PerfectoidSpaces §P7.16** (*proetale-site*, on main) is the pro-étale site of a rigid space on which §§3.4 and 3.8 take `H¹_proet(Sp(C{X}), Ô)`. Only Layer P6 had been cited.
- **DiamondsAndVStacks §D2.2** (*small-pro-etale-site-and-v-site*) is the v-site on which the v-sheaf comparison of §6.2 is formed. It was used uncited; it now has a supplier-contract block and appears in the §6.2 Needs line and the Layer 6 Dependencies.

All four are recorded in Scope and ownership and in the supplier contracts. The depcheck passes with them.

Duplication sweep, by object, against main and every open roadmap head (`roadmaps grep` on almost `C`-representations, `C`-representations, Théorème A, Banach–Colmez, sympathetic, TVS / Topological Vector Space, qBC, left heart, quasi-abelian, `Hom_VS`, `Ext¹_TVS`, `BDeRhamPlus`, compactoid / compact type over `C`, Ax–Sen–Tate, the Galois action on `ℂ_p`):
- **No second owner.** Fontaine's full faithfulness, almost `C`-representations, TVS, period Pairs, qBC, the disc class and `h(W)` appear only here and in the consumer CstConjectureForDaggerVarieties, which imports them from here.
- **Main's PadicFunctionalAnalysis §2.4** owns countable-type splitting of Banach spaces. This roadmap uses LocallyAnalyticDistributions §0.2's locally convex functional extension instead, a different statement, so nothing is restated.
- **Main's LocalGaloisGroups** does not own the action on `ℂ_p`.
- **The parent's Euler–Poincaré height formula** is about coherent sheaves, not `h(W)`.

No removals were needed.

## Fixes from the upstream read

1. **Ambiguous section references.** Seven references meant this roadmap's own sections but read as the supplier's, because they sat inside supplier sentences:
   - "§0.8 constructs the same lift" (Scope; PadicHodgeTheory has no §0.8);
   - "(§4.3; §0.8 extends it to `K̄`)" (PadicPeriodRings contract);
   - "§0.8 constructs it for the general base field" (PadicHodgeTheory contract);
   - "so §4.6 proves …" and "§2.5 states the compactoid version" (LocallyAnalyticDistributions has its own §4.6);
   - "are §2.5" (Scope and CompactOperators contract);
   - "constructed in §0.1" (ArithmeticGaloisRepresentations contract; it has no §0.1);
   - "proved in §1.4" (ArithmeticGaloisDuality contract).

   Each now says "this roadmap's §…".
2. **Wrong scope sentence.** Scope said `SemilinearRep` "makes Layers 0–1 statable over `ℚ_p`". Only the two Layer 0 headlines are stated, for finite `K/ℚ_p`. It now says so.
3. **Undefined term.** "The parent" was used 28 times without definition. The Summary now says "That roadmap, called the parent below, stops there."
4. **Missing API list.** §2.5 defines the separated completion, compactoid image over `B_m` and compact-type `B_m`-models but had no API list. I added four prose bullets that restate the section's own definitions and claims; no new mathematics.
5. **Unowned proof input.** The §6.5 proof route used "the v-sheaf `Ext` table of LeBras18 Theorem 4.1", which no roadmap owns. The route now computes those v-sheaf values as part of the target before transporting them through §6.2, so no input is left unowned.
6. **Cryptic phrase.** The PerfectoidSpaces/PerfectoidTowers contract ended with "the normed specialization, `O` against completed `O`". It now says what is proved: the identification of continuous `H_C`-cohomology with `Ô`-cohomology of the closed disc, at every prime.
7. **Imprecise library citation.** The `AddMonoid.End` row now says that the declaration at `Mathlib/Algebra/Group/Hom/Defs.lean:975` is `Monoid.End`, from which `to_additive` generates `AddMonoid.End`.

The accepted review recorded no non-blocking notes beyond the conditional supplier contract G-HOM. That block is kept as "What VectorBundlesAndIsocrystals must provide (gap:G-HOM)", the form used on main (BelyiMaps, FlagVarieties). I re-read its source: CN25's proof of Corollary 3.18 (CN25 line 837–842) does give the bounded factorization for every BC source, through a quotient `ℚ_p^r ⊕ L_ℓ1 ⊕ … ⊕ L_ℓd`. The parent's *VS Hom vanishing from torsion period modules* still states only torsion sources at its head, so the gap stands as stated.

## Verified at the pins and heads

**Pins.** Mathlib `1b1ccf4` and Tau Ceti `2fd255d`. Every line of both supplier tables resolves to the named declaration, 24 rows in all, among them `ContinuousLinearMap.isOpenMap` :229, `BDeRhamPlus` :75, `Abelian.Ext.mapExactFunctor` :126, `krullTopology` :134, `spectralNorm_eq_of_equiv` :451, `WithSeminorms.banach_steinhaus` :164 and `TauCeti.ExactStructure` :241.

**Supplier sections, resolved at their heads:**
- PadicPeriodRings §§1.1, 1.2, 1.5, 2, 4.1–4.3 (§4.3 constructs the fixed embedding `K → B_dR⁺`);
- PadicHodgeTheory §0.3 (the `K̄ → B_dR⁺` lift, finite `K`) and §4.4;
- FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2;
- LocallyAnalyticDistributions §§0.0–0.3 and Layer 1, with all six italic item names;
- ArithmeticGaloisRepresentations §1.1;
- ArithmeticGaloisDuality §§R02.1.3, R02.2.1, D7.4;
- PerfectoidTowers §§P9.2, P9.4, P9.6;
- PerfectoidSpaces Layers P1, P3, P6 and §P7.16;
- CompactOperators §0.5 (`IsCompactoidSet`, `HasCompactoidImage`);
- DiamondsAndVStacks §D2.2;
- all 18 Layer 5 headings of VectorBundlesAndIsocrystals.

**Sources** (cached texts):
- Fontaine03 §1.2, p. 289: `K` is finite over `ℚ_p`.
- Fontaine03 §1.3, p. 289: definition of a `C`-representation.
- Fontaine03 Théorème A, p. 290, and A′, p. 291.
- Fontaine03 Théorème D(i)–(ii), p. 291 (lines 285–291): matches §1.1.
- Fontaine03 Théorème 4.1, p. 329 (line 1816): "si η(E) ≠ η(V), alors η est surjective et son noyau est … de dimension finie égale à celle de V", which is exactly the Lean statement.
- CN25 Lemma 4.24, p. 28: the statement prints `Ext¹ ≅ W`; the proof (line 1415) gives `h1(U_d) = 0`. This confirms the README's misprint note.

## Adversarial mathematics pass

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: `σ̂ = Completion.map σ` | σ = 1; K = ℚ_p with χ(σ) = a ≢ 1 mod p; p = 2 with χ(σ) ≡ 3 mod 4; K = ℚ_p(ζ_p) | σ̂ = id; σ̂(ζ_p) = ζ_p^a ≠ ζ_p; σ̂(i) = ζ_4^3 = −i; ζ_p fixed | holds | none |
| `SemilinearRep` (definition) | `ℂ_p`; `ℂ_p(1)`; trivial action on `ℂ_p` | semilinearity is multiplicativity of σ̂; equivariant ℂ_p-linear `ℂ_p(1) → ℂ_p` is c with σ̂(c) = χ(σ)c, so c ∈ H⁰(ℂ_p(−1)) = 0; the trivial action gives ζ_p = ζ_p^a, false | the definition excludes the trivial action | none |
| Continuous additive ⇒ ℚ_p-linear | f additive ⇒ ℚ-linear; q_n → a in ℚ_p | f(aw) = lim f(q_n w) = lim q_n f(w) = a f(w); needs Hausdorff target (module topology) | holds | none |
| Height conventions | ℚ_p, C, C/ℚ_p in both presentations | almost: 1−0, 0−0, 0−1; parent: F₁ = ℚ_p, F₂ = 0 → 1; F₁ = 0, F₂ = ℚ_p → −1 | agree | none |
| χ⁽¹⁾ = exp∘log∘χ | ℚ₃ lifts u, −u; p = 2, u = 5, u = −1 | log(−1) = 0 ⇒ equal; exp(log 5) = 5 ∈ 1+4ℤ₂ | independent of lift | none |
| §0.1 exact structure | zero rep; log χ extension; T(x)_n = pⁿx_n on c₀ | zero object; H¹(G_K, ℚ_p) ∋ log χ ≠ 0, nonsplit; T(c₀) dense, (pⁿ) ∉ T(c₀) because the preimage (1, 1, …) ∉ c₀ | holds; T is not an inflation | none |
| §0.2 Théorème A / A′ | source 0; End(C); C → B₂; C → C(1) | 0; c ∈ C^{G_K} = K; B_dR⁺-map 1 ↦ t lands in tB₂ = C(1), equivariant part is H⁰(C(1)) = 0; Hom = 0 | holds | none |
| §0.3 analyticity | E = V ⊕ C, η = projection; η = 0; V = 0, W = C(1) | Dim (1, h); zero map analytic; Hom(C(1), C) = 0 | holds | none |
| §0.4 `C(G_K)`, ht | C ⊕ ℚ_p, two presentations | V₂ = ℚ_p: 1 − 0 = 1; V₂ = ℚ_p², V₁ = ℚ_p, quotient C/ℚ_p both sides: 2 − 1 = 1; unsigned sum 3 | presentation-independent | none |
| §0.5 additivity | 0→ℚ_p→C→C/ℚ_p→0; 0→C(1)→B₂→C→0 | dims 1 = 0+1, hts 0 = 1−1; 2 = 1+1, 0 = 0+0 | holds | none |
| §0.6 | B₂; C(1); 0; ℚ_p | (2, 0); almost iso to C, Hom both ways 0; (0, 0); ht 1 ≠ 0, so not a period rep | holds | none |
| §0.7 scalar End(C) | id; p for K = ℚ_p; a ∈ C∖K | 1; multiplication by p; g(a) ≠ a breaks equivariance | holds | none |
| §0.8 density / ι | mod t; K in place of K̄; B₂ and t; X² − p over ℚ_p; transcendental twist x ↦ x̂ + t | K̄ dense in C, K closed; t has θ-image 0; two Hensel roots ±ι(√p), g(ι√p) = −ι√p = ι(g√p); twisted map lifts the inclusion but differs by t ≠ 0 | holds; the K-algebra condition is needed | none |
| §0.9 Hom table | (N, k) = (1, 1); k < ℓ with ℓ = k; `C → B₂` | K (reduction of 1), not K²; End(B_k) ∋ id; 0 | holds | none |
| §0.10 / `fundamental_extension_surjective` | E = V ⊕ C, η = (g, 1); η = (g, 0); V = 0, W = C(1); U₁, V = ℚ_p t, η = θ; V = 0, E = W = C, η = id; E = ℚ_p ⊕ ℂ_p, η(a, c) = a + c | ker {(v, −g v)} ≅ V; image equals η(V), excluded, ker infinite-dimensional; η = 0, excluded; ker ℚ_p t, dim 1; surjective, ker 0 = dim V; ker {(a, −a)}, dim 1 | holds; hypothesis needed | none |
| `semilinearRep_equivariant_map_smul` | W₁ = 0; W₁ = W₂ = ℂ_p, f = a·, a ∈ K | trivial; f(cw) = acw = c f(w) | holds | none |
| §1.1 almost split | B₂ with Z = ℚ_p t; C/ℚ_p with Z = ℚ_p; log χ | U₁ ∩ Fil² = 0 so U₁ ↪ B₂, U₁ ∩ tB₂ = ℚ_p t, onto C; quotient splits; split after Z | matches Fontaine03 Th. D | none |
| §1.2 Ext comparison | degree 0; Ext¹(C, C(1)); Ext²(ℚ_p, ℚ_p(1)) | Théorème A; [B₂] ≠ 0; H²(G_K, ℚ_p(1)) = ℚ_p | holds | none |
| §1.3 generalized invariants | 0; C; B₂; C(1); ℚ₃ lifts | (0, 0); (K, 0) as C(−1)_(0) = 0; (K, Kt′); W_(0) = 0 since the minimal r forces an invariant in H⁰ = 0, W_(1) = Kt′ | holds | none |
| §1.4 complex | W = C; W = C(1); d₁d₀ | K → 0⊕K → 0: (K, K, 0); 0 → Kt′⊕0 → Kt′, d₁ = 0: (0, K, K); t′γz − t′z − χ⁽¹⁾⁻¹χ⁽¹⁾t′γz + t′z = 0; with χ⁽¹⁾: (1 − χ⁽¹⁾²)t′γz ≠ 0, since χ⁽¹⁾(γ) ∈ 1+pℤ_p∖{1} (1+4ℤ₂ at p = 2) | holds | none |
| §1.5 Euler char | X = Y = ℚ_p; X = C, Y = C(j) | 1 − ([K:ℚ_p]+1) + 0 = −[K:ℚ_p] = −[K:ℚ_p]·1·1; dims [K:ℚ_p]·(1, 1, 0) give 0 = −[K:ℚ_p]·0·0 | holds | none |
| §1.6 Ext(B_k, C(j)) | (k, j) = (1,0), (1,1), (2,1), (2,0), (2,2); dévissage of B₂ against C(1) | via W = B_k(1−j) with weights 1−j…k−j: W_(0) ≠ 0 ⇔ 1 ≤ j ≤ k, W_(1) ≠ 0 ⇔ 0 ≤ j ≤ k−1; dual cohomology gives (1,1,0), (0,1,1), (0,0,0), (1,1,0), (0,1,1); dévissage gives Hom(B₂, C(1)) = 0 because the boundary sends id to [B₂] ≠ 0 | holds | none |
| §1.7 vanishing | N = 0, i = 1, j = 2; i = j; N = 1, i = j = 1 | target weights −N…j−1, source twists r ≤ i−1 ≤ j−2 so C(0), C(1) both present → acyclic; id survives; C ⊂ t⁻¹B⁺/tB⁺ is equivariant, W_(1) = 0, Hom = K | holds | none |
| §1.8 realization | ℚ_p-rep; C; End; C(1) with trivial action | constant BC; V₁; K vs C so not full; evaluation detects the action | holds | none |
| §2.1 boundedness | [0→C]; [C→C]; T on c₀ | usual; 0; (pⁿ) ∉ T(c₀), Hausdorff quotient 0 | holds | none |
| §2.2 exact structure | split V₁⊕V₁; pullback along 0; dense T | kernel and quotient V₁; 0→V₁→V₁→0→0; nonzero left-heart quotient | holds | none |
| §2.3 TVS | 0; V₁; dense c₀(ℕ, C) injection | trivially TVS; spectral norm decreases along algebra maps, so u(A) is bounded uniformly; quotient nonzero | holds | none |
| §2.4 BC ⊂ TVS | C/ℚ_p; ℚ_p; V₁, 0 | Banach quotient, ht −1; p-adic topology; as stated | holds | none |
| §2.5 completion, compact type | B_m; c₀₀ → c₀; 0; colim Cⁿ; {e_n}; id of c₀; B₂ with F = {1} | B_m; strictly larger; 0; O_Cⁿ ⊂ span of n vectors, not compact since residue field infinite; lattice ⊕ O_C pⁿe_n is open, λe_n in it only for \|λ\| ≤ \|pⁿ\|; e_n has coordinate 1, so it is not compactoid; B₂° ⊆ U + B₂°·1 | holds | API list added |
| §2.6 base change | Λ = C; dense T; C→C²→C | singleton I; injective, not strict; strict | holds | none |
| §2.7 period Modules | 0; B_m; (ab)⊗x vs a⊗bx; ⊕_m B_m | 0; B_m(Λ); equal; unbounded exponent excluded | holds | none |
| §2.8 Pairs | [M→M]; [0→B_m]; T on c₀ | M/M = 0; Module; (pⁿ) ∉ image, closure gives 0 | holds | none |
| §3.1 E_a, ψ_a | a = 0; p = 2, a = 1; odd p, a = 1/pᵏ; p = 2, a = 1, 2 | E_0 = 1, ψ_0 = 0; 2ⁿ ∈ 4O ⇒ n ≥ 2; n ≥ k+1, E a p^{k+1}-th root of exp(pX), χ_1(σ)^♭ = (ζ_{p^{k+1}}^c)_k = ε^{c/p}, ψ_1 = c/p ∈ p⁻¹ℤ_p; E_1 a 4th root of exp(4X), ψ_1 ∈ ¼ℤ₂, E_2 = E_1², ψ_2 = 2ψ_1 | holds | none |
| §3.2 Kummer cover | p = 3, n = 0; odd p, n ≥ 1; p = 2, n = 0, 1 | v₃(3^{k−1}/k!) = 1, 1, 2, 3, 4 at k = 2, 3, 4, 6, 9 (≥ 1/3); remaining coefficients have valuation ≥ 1 − (p−1)/p^{n+1} > 1/p; Y₀² + Y₀ = (e^{4X}−1)/4 with v₂(4^{k−1}/k!) ≥ k−1, so ≡ X mod 2; Y₁² + 2^{1/2}Y₁ = Y₀; v₂ of the X^{2^r} coefficient of (e^{2X}−1)/2 is 0 | holds | none |
| §3.3 p = 2 character | ψ_1(σ) = 1; exp(2X); 4ⁿ/n! | ψ_2 = 2; v₂ = 1 at every X^{2^r}; v₂ = 2n − v₂(n!) ≥ n+1 | holds | none |
| §3.4 normed descent | v_p(pᵏ/k!) at p = 3, k = 0,1,2,3,6,9; v₂(4ᵏ/k!) at k = 0..4; κ vs ψ_1; level 1 degrees; γ − 1 on E_1, E_2; (1+cX)^{1/p} | 0,1,2,2,4,5; 0,2,3,5,5 (k + s₂(k) ≥ 2 for k ≥ 1); A^{1/pⁿ} = E_{1/p^{n−1}} gives κ = pψ_1, and at p = 2 κ = 4ψ_1 = 2ψ_2; 6·3 = 18 at p = 3 (54 if a p²-th root is adjoined), 2·2 = 4 at p = 2; \|(ζ_p−1)⁻¹\| = p^{1/(p−1)} = √3, \|(−2)⁻¹\| = 2 ≤ p; \|binom(1/p, k)\| = p^{k+v_p(k!)}, so at \|c\| = p^{−p/(p−1)} the terms are p^{−s_p(k)/(p−1)}, which do not tend to 0 | holds | supplier citations P9.2, P9.4, P7.16 added |
| §3.5 cocycles | f = c; f = YZ; degree-1 part; k = p; k = p^r m with i = p^{r−1} | with f = u(Y+Z) − u(Y) − u(Z), the constant u = −c gives −c + c + c = c; ((Y+Z)² − Y² − Z²)/2 = YZ, and YZ is a cocycle; αY + βZ forces α = β = 0; binom(p, 1) = p; Kummer: exactly one carry, so v_p = 1 | holds | none |
| §3.6 additive lifts | V₁⊕V₁; B₂; v = 0 | λ = 0; λ_v = v; zero lift | holds | none |
| §3.7 disc class | split; B₂; pushout by c | 0; θ(v̂ log[E_1^♭]) = vX, (σ−1)ℓ = v̂ψ_1(σ)t, so λ = 1; c | holds | none |
| §3.8 pro-étale class | a = 0, 1; p = 2; uncompleted O | 0; ψ_2 − 2ψ_1 = 0; étale H¹ of an affinoid is 0 (Tate) | holds | Needs P9.2, P7.16 added |
| §4.1 reasonable C-spaces | 0; c₀(ℕ, C); infinite-dim Banach; C | both types; separable; unit ball would be compactoid ⇒ finite-dim; rank-one id compactoid, O_C not compact | holds | none |
| §4.2 B_m-models | B_m; c₀(I, C), I uncountable; Ĉ | t^m = 0; e_j at distance 1 from any countable-support closure; quotient Ĉ/ker f ≅ C would be spherically complete (the lift argument gives ‖ȳ − ȳ_n‖ ≤ max(r_n, r_n) = r_n), so the dual is 0 | holds | none |
| §4.3 same type | identity; strict closed; dense; Fréchet vs compact | 0; classical quotient; nonzero; excluded | holds | none |
| §4.4 pushout | w = 0; m = d = 1, w = 1; w + t^d w′; W = B₂, w = t | split; (b, c′) ↦ b + tc′ kills (tc, −c), gives B₂; same class; t ∈ tB₂ gives split | holds | none |
| §4.5 cocycle in one step | 0; H finite; H = ℤ_p trivial on colim Cⁿ | every step; finitely many values; c(x) = x·c(1), step depends on c(1) = e_N | holds | none |
| §4.6 extensions over C | C→C²→C; 0; c₀ coordinate functional | identities; 0; countable-type extension | holds | none |
| §4.7 Hom/Ext from B₁ | C; 0; c₀ | C with [B₂] = 1; 0; null sequences | holds | none |
| §4.8 all separable Fréchet | C^ℕ; c₀ | (1,1,…) allowed; (1,1,…) excluded, (pⁿ) allowed | holds | none |
| §4.9 c₀(I, C) | I uncountable, w = e_j; I finite; 0 | c₀(I, C) in degrees 0, 1; C^I; 0 → 0 | holds | none |
| §4.10 Hom/Ext from B_d | W = B₃, d = 2; d ≥ m; d = 0 | W[t²] = tB₃ and W/t²W = B₂, both length 2; W; W[t⁰] = 0 = W/W | holds | none |
| §4.11 constant source | W = C; arithmetic; dense Pair | C, Ext¹ 0; H¹(G_K, ℚ_p) ≠ 0 there; algebraic quotient | holds | none |
| §4.12 B_d into Pair | [0→B_m]; dense; [tB₂→B₂], d = 1 | B_m[t^d]; algebraic; (B₂/tB₂)[t] = C | holds | none |
| §4.13 U_d | d = 1, W = C; d = 0 | 0 → C → Hom(U₁, C) → C →(id) C → Ext¹(U₁, C) → 0, so Hom = C and Ext¹ = 0; U_d ∩ Fil^{d+1} = 0 gives U_d ↪ B_{m+d} | holds; CN25 Lemma 4.24 misprint confirmed in the source | none |
| §4.14 linearity of lifts | c = 0, p, −1; split V₁⊕V₁ | 0 = 0; ℓ_v(−x) = −ℓ_v(x); (cX, vX) ↦ (c, v) | holds | none |
| §4.15 Module comparison | W₁ = C, W₂ = B₂; C, C | C/t²C = C, middle B₃ killed by t³ not t²; Ext¹_{B₂}(B₂, C) = 0 shows the exponent must rise; C | holds | none |
| §4.16 Pair full faithfulness | Modules; dense; [0→B₁], [0→B₂] | §4.15; id ≠ 0; B₂[t] = tB₂ ≅ C | holds | none |
| §5.1 qBC, height | 0; ℚ_p; c₀ Module; C/ℚ_p | 0; W_{<0} = ℚ_p, ht 1 (parent: ℚ_p negative curvature); 0; positive curvature (Hom(C/ℚ_p, V₁) = 0), ht −1 | holds | none |
| §5.2 positive → Pair | [0→B_m], U₁/ℚ_p t_x; C/ℚ_p; B₁ → B₁; B₂/ℚ_p^h | θ(t_x) ≠ 0 so t_x is a unit, Hom 0; (M₂/M₁)[t] ↪ M₂/M₁, Hom 0; id ≠ 0 at curvature 0; some v has θ(v) ≠ 0 (else B₂/ℚ_p^h ↠ C), v is a unit of B₂, restriction injective | holds | none |
| §5.3 intrinsic filtration | pure Pair; ℚ_p ⊕ B₁ ⊕ U₁/ℚ_p t_x | outer 0; pieces U₁/ℚ_p t_x, B₁, ℚ_p | holds | none |
| §5.4 qBC full faithfulness | pure Pair; classical BC; ×p on C/ℚ_p | §4.16; parent morphisms; iso, ht −1 preserved | holds | none |
| §5.5 LA → C⁰ | J = id; Hom/Ext to ℚ_p | X = 0; 0 → Hom(X) → Mes → D → Ext¹(X) → Ext¹(C⁰) = 0, Mes ↪ D because LA is dense, so Hom = 0 and Ext¹ = D/Mes | holds | none |
| §6.1 h(W) | 0; ℚ_p^r; B_m; C/ℚ_p | 0; B_dR^r; 0; 0 with ht −1 | holds | none |
| §6.2 VS ↔ v-sheaf | (ℚ_p, V₁); (V₁, V₁); B₂ boundary | 0 → 0; C ↔ C; 1 ↦ 1 | holds | Needs DiamondsAndVStacks §D2.2 |
| §6.3 projectivity of ℚ_p | F = V₁, B_dR; source V₁ | C, 0; B_dR, 0; Ext¹(V₁, B_dR⁺) = C ≠ 0 | holds | none |
| §6.4 localization | ℚ_p; V₁; C/ℚ_p | 0; C with zero transitions, colim 0; rank 1 | holds | none |
| §6.5 basic sources | k = 0 | Hom(V₁, B_dR⁺) = 0, Hom(V₁, t⁻¹V₁) = C, δ injective; surjectivity makes the next transition 0 | holds | route now owns the v-sheaf values |
| §6.6 nonpositive vanishing | C, ℚ_p; C/ℚ_p; ℚ_p → ℚ_p ⊕ C → C | 0; rank 1 (excluded); 0 → 0 → B_dR → B_dR → 0 | holds | none |
| §6.7 height–rank | ℚ_p; C; C/ℚ_p; ℚ_p² ⊕ (C/ℚ_p)³; presentation | 1 = 1+0; 0 = 0+0; 0 = −1+1; 2 = −1+3 (wrong sign gives −4, dropping the term gives −1); 0 → h(W) → h(Y) → h(F₂) → Ext¹ → 0 with ranks dim F₁, dim F₂, so rank h = dim F₁ − dim F₂ + rank Ext¹ | holds | none |
| G-HOM contract | ℚ_p; V₁; general W | b ∈ B_dR lies in t^{−N}B_dR⁺, N fixed per map and uniform in Λ; Hom = 0; CN25 proof of Cor. 3.18 via a quotient of ℚ_p^r ⊕ ⊕L_ℓ | sourced; the pointwise reading is vacuous, as the README says | none |

Per item: no statement failed an instance, so no hypothesis was added. I also checked the following:
- Context: no section variables, all binders explicit.
- Generality: the README says finite `K/ℚ_p` for both Lean headlines, and the Lean statements use finite `K` inside `PadicAlgCl p`, which the Conventions justify by the embedding argument.
- The `Ĉ` duality argument (§4.2) and the `ℚ_p`-transcendental lift (§0.8) were checked in full and are correct.

## Unresolved

- **G-HOM** remains a conditional supplier contract on VectorBundlesAndIsocrystals, Layer 5, *VS Hom vanishing from torsion period modules*. At its head that section states torsion sources only. §§6.1 and 6.4 depend on it.
- **Requests from the consumer.** CstConjectureForDaggerVarieties, an open consumer later in the order, names this roadmap as supplier of two contracts that this roadmap does not state: `gap:qbc-pairs` (dense finite-length period-Module presentations of torsion Pair models after completed base change) and `gap:natural-period-hom` (`Hom_TVS(W, P) ≅ Hom_VS(W, P)` for finite BC `W` and `P = B_dR, B_st`). I did not add them: they would be new targets outside the accepted package. The consumer's other citations (§§0.8–0.9, 2.3, 2.7–2.8, 4.2–4.3, 5.1–5.3, 6.6–6.7) all resolve to unchanged numbering here.
- **Ownership against open pull requests** was checked against every open head in the tool's index (439–442 pull requests), by object, with `roadmaps grep` and `roadmaps show`, not only against the 141 checkouts listed in the scratch file. It is reported here because the check covers heads as of the index time.
- **No suspicious instructions** were found in any data read.


Pull request: #2264 (roadmap/vector-bundles-and-isocrystals-part-ii at 7d58029)

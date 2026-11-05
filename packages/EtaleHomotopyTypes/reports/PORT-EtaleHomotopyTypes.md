# PORT-EtaleHomotopyTypes

Branch `roadmap/etale-homotopy-types`, created from main at `a0ad405`; head commit `15d15178`
(`EtaleHomotopyTypes: roadmap (README, Suggested.lean, metadata)`). Files:
`TauCetiRoadmap/EtaleHomotopyTypes/README.md`, `TauCetiRoadmap/EtaleHomotopyTypes/Suggested.lean`,
`TauCetiRoadmap/EtaleHomotopyTypes/metadata.toml`. Nothing outside the folder was touched.

## Build

    ✔ [8954/8954] Built TauCetiRoadmap.EtaleHomotopyTypes.Suggested (4.8s)
    Build completed successfully (8954 jobs).

Warning count: 0. The module states no declaration (one module docstring and an empty namespace),
so there is no `sorry` and no warning. The file keeps the package's `module` header with
`public import Mathlib` as its only import, the form of the roadmaps on main that use the module
system; the gate's import scanner accepts it.

## Gate

    gate EtaleHomotopyTypes: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Run on the committed head `15d15178` with `--base origin/main`; two earlier attempts were refused by GitHub's rate limit while fetching the merge order and were retried.

Dependency check, exact command of the brief, after the final edits:

    depcheck: 209 roadmaps, 1726 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. `roadmaps resolve` on the ported README (main `a0ad405`, 449 open
heads, index of 2026-11-04T19:07:06Z): no cross-roadmap citation and no Lean name found nowhere.

## Draft pull request body

This roadmap builds the étale homotopy type of locally noetherian schemes and simplicial schemes as
a strict pro-simplicial set, Isaksen's rigid construction, on top of a general homotopy theory of
pro-spaces: homotopy pro-local systems, Isaksen's model structure with its properness and detection
theorems, pro-coverings and classifying pro-spaces, materialization and the profinite homotopy-limit
comparison, and relative pointed mapping classes with their monodromy quotients. On the scheme side
it proves the comparison of the rigid type's cohomology with étale cohomology for arbitrary locally
constant abelian coefficients, finite étale base change, the identification of the raw fundamental
pro-group with the finite étale group and the profiniteness of all raw homotopy groups on noetherian
geometrically unibranch schemes, SGA 1 XIII's cohomological properness and local asphericity in
characteristic zero with the resulting homotopy exact sequence and geometric product formula, the
raw effacement criterion, and the étale homotopy sequence of an elementary fibration. The end
theorems are Schmidt–Stix's Galois-equivariant geometric cohomology transport, their arithmetic
monodromy orbit bijections and the product formula for maps into raw étale K(π,1) varieties, and
Feng–Galatius–Venkatesh's functorial Betti–étale comparison after p-profinite completion, with the
cohomological finiteness hypotheses under which it is an isomorphism and the field-automorphism
naturality of discrete points. None of the headline theorems is statable at the pins: the pinned
libraries have no pro-category, no étale fundamental group of a scheme, no analytification and no
p-finite homotopy types, so `Suggested.lean` states nothing and its docstring names, layer by layer,
the carrier each headline lacks.

AI assistance: the roadmap text, its Lean file and this port were produced with Claude (Fable 5.1)
under the board's review process.

## Suppliers still in pull requests

StableHomotopyKTheory, ComplexComparisonPartII, ResolutionOfSingularitiesCharacteristicZero,
CrystallineCohomology and DiamondsAndVStacks (all earlier in the merge order). The other suppliers
are on main (AdicSpacesPartII, PerfectoidSpaces, GeneralizedCohomology, AlgebraicTopology,
BordismFormalGroups, Orbifolds, EnhancedDerivedSheaves, SchemeAndStackFoundations,
EtaleCohomologyFoundations, LocalPurity) or completed (ProfiniteProPGroups, UniversalCovers).

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already satisfies the acceptance-test form: it states no
headline because none is statable, holds no definition, data, API lemma or example, and its
docstring names what each headline lacks. It was copied unchanged. Binder check: the file declares
no `def`, `theorem`, `instance`, `structure` or `example`, so the `#check @name` scratch file would be
empty; there is no elaborated type to compare with the README, and nothing changed.

Headlines re-checked for statability at this worktree's pins (Mathlib `f6090c70`, Tau Ceti
`358314d4`): no `Pro` category under `Mathlib/CategoryTheory`; nothing finite-étale under
`Mathlib/AlgebraicGeometry` beyond the site (`Sites/Etale.lean` line 50) and the morphism class;
`Mathlib/RingTheory/Etale/Finite.lean` is for algebras over a ring; no `FiniteEtaleScheme`, no scheme
fundamental group and no analytification in Tau Ceti or Mathlib. The abelian vanishing of
`lim^s` for finite systems (§2.2) is statable with `CategoryTheory.Functor.rightDerived`, but it is
an input lemma (Schmidt–Stix Lemma A.7), not a headline; the earlier rounds settled that it stays in
the README, and that decision is kept.

## Supplier replacements and duplication removals

- Every `file, line` claim of the two supplier-contract sections was opened at this worktree's pins
  and names the declaration claimed (36 claims: `SSet` 33; `KanComplex` 40, 45; `ModelCategory` 43;
  `SingularSet` 50, 56, 65, 73, 97; `Sites/Etale` 50; `SheafCohomology/Basic` 56; `RightDerived`
  108; `Injective/Resolution` 70; `HasLimits` 555; `AdditiveFunctor` 231; `ProfiniteGrp/Completion`
  191, 205, 215; `ProfiniteGrp/Limits` 48, 138; `ProfiniteGrp/Basic` 330, 347; `CofilteredSystem`
  79; `Konig` 126; Tau Ceti `LocalCoefficient` 43, 75, 102, 136, 252; `InverseSystem` 78, 96;
  `Twisted/Basic` 79, 84; `Profinite/Completion` 179, 68; `Generation` 73; `StructureTheorem` 59).
  No replacement was needed.
- Every cross-roadmap citation was resolved on main or at the open head named by the roadmap
  service: AdicSpacesPartII R0.19.9; PerfectoidSpaces P6.10; DiamondsAndVStacks D0.13 (#820);
  GeneralizedCohomology G2 items 1 and 10; AlgebraicTopology Stage 6 item 1 and Stage 8 items 2, 3;
  BordismFormalGroups F6.5 and its coherent-model-diagram block; Orbifolds O4-N (O4 item 3);
  EnhancedDerivedSheaves E0.2–E0.5, E0.8, E2.6; SchemeAndStackFoundations 0.9–0.12, 2.10, 2.15 with
  `noetherian_approximation`, `finite_presentation_limits`, `IsGeometricallyUnibranch.of_etale` and
  `unibranch_finite_components`; EtaleCohomologyFoundations F.0.1, F.0.2, F.0.4, F.0.A2, F.2.3,
  F.2.6, F.3 (`VanishingCycles.lisseDirectImageTransport` at its line 707) and 0.10; LocalPurity 2.2;
  ProfiniteProPGroups Layers 0, 3, 4; UniversalCovers Stages 2–4; StableHomotopyKTheory 1.19–1.23,
  1.28–1.34, 2.3–2.6 and Layers 4–6 (#1227); ComplexComparisonPartII C-1.1 with
  `complexSchemeAnalytification`, C5.1, C6.1–C6.3 (#848); ResolutionOfSingularitiesCharacteristicZero
  5.1–5.5, 6.1–6.2 (#1199); CrystallineCohomology CR.5:log-algebra.4, *The classical Abhyankar
  lemma* (#857, its line 8190); AnabelianGeometryAndNonabelianChabauty 1.5, 1.6, 1.10, 1.11 (#1021).
- Label normalisation: the package wrote the ComplexComparisonPartII section as `C−1.1` (Unicode
  minus); the cited roadmap's heading is `C-1.1`. All 14 occurrences now use the heading's form.
- Removed claims (recorded in Scope and ownership): the package said that A¹-local realization and
  motivic K-theory belong to MotivicEtaleKTheory and that MotivicEtaleKTheory consumes the completed
  realization; at its head (#1470) that roadmap is about higher-cycle realizations and Deligne
  regulators and has no étale realization, completion or pro-space content, so both claims are
  gone (the Scope sentence now says A¹-local realization is outside this roadmap). The package
  said InverseGaloisAndArithmeticFundamentalGroups consumes the open-image and geometric-conjugacy
  adapters; at its head (#850) it has no relative outer Hom, center-free or open-image interface and
  does not cite this roadmap, and it is earlier in the merge order, so the claim is gone.
- Ownership against AnabelianGeometryAndNonabelianChabauty (see Unresolved): its §1.5 (raw pointed
  étale homotopy type in the homotopy category of pointed pro-spaces, classifying map, profinite π₁
  on connected geometrically unibranch varieties, finite-coefficient comparison), §1.6 (comparison
  with the raw K(π,1) condition) and §§1.10–1.11 (elementary-fibration homotopy fibre and K(π,1)
  consequence) state the same Schmidt–Stix theorems as §§1.9, 3.3–3.6, 3.9b and 3.9d here. The
  accepted review (F04) kept this roadmap as owner; the Scope paragraph now records the overlap
  with the one-clause difference of carriers (strict rigid pro-simplicial set, unpointed, simplicial
  schemes, arbitrary locally constant abelian coefficients, profiniteness on noetherian geometrically
  unibranch schemes, the pro-space theory of Layers 0–2 beneath) in direction-neutral wording, and
  the Downstream consumers section names only roadmaps later in the merge order.
- Duplication sweep by object through the roadmap service's index of main and the 449 open heads,
  after the edits (`roadmaps grep -i --readme-only`): "strongly center-free", "p-profinite
  completion", "pro-covering", "cohomologically proper" and "0-acyclic" match no roadmap on
  main or at any open head; "Isaksen" and "rigid hypercover" match only
  EllAdicHomotopyTypesAndWeights (#1644, later in the order, which imports the rigid carrier from
  here); "étale homotopy type" matches AnabelianGeometryAndNonabelianChabauty (#1021, treated
  above), EllAdicHomotopyTypesAndWeights and, as a bibliography entry only,
  InverseGaloisAndArithmeticFundamentalGroups (#850); "elementary fibration" matches
  AnabelianGeometryAndNonabelianChabauty (§§1.10–1.11, above), ComplexComparisonPartII §C6.3
  (#848), which constructs elementary fibrations of smooth complex varieties inside its Artin
  comparison, InverseGaloisAndArithmeticFundamentalGroups (which cites that construction), and
  the other-author pull request #196 (CohomologicalPointCounting/ComplexComparison), which
  defines them over ℂ with a projective relative curve. None of these is the carrier over an
  arbitrary base that §3.9d uses; SchemeAndStackFoundations, on main, has no elementary fibration,
  so the package's request `gap:elementary-fibration-carrier` to it stands, and the Scope paragraph
  now records the ComplexComparisonPartII construction. The sibling checkouts listed in the brief
  were not compared file by file beyond the roadmaps named in this report; ownership against open
  pull requests was checked through the service index.

## Review notes applied (the accepted review's six non-blocking findings)

- F01: the gap `nonabelian-local-acyclicity` now also asks for the characterization of universal
  local 0-acyclicity and 1-asphericity by base change along étale morphisms (the functor
  `f′^*i_*Φ → j_*f″^*Φ` for étale finitely presented `i`, fully faithful in the 0-acyclic case and an
  equivalence in the 1-aspheric case), read at SGA1 lines 12022–12024 and 12074–12076, and the
  universal local 1-asphericity route ends by naming that characterization.
- F02: the constructibility hypothesis of the homotopy exact sequence quantifies over finite étale
  covers `S′ → S`, as SGA1 XIII Lemma 4.2 does; both uses verify it for every étale `S′`.
- F03: already applied before the port (Y any connected K-scheme).
- F04: applied as described under ownership above.
- F05: cohomological properness relative to S is now defined for an S-morphism `f:Z → Y`, with the
  base-change functor `g^*f_*Φ → f′_*h^*Φ` of SGA1 XIII 1.0.1 and Definition 1.1 (read at SGA1 lines
  10206–10227), including the dimension ≤ −1 clause the arbitrary-field route uses; the case Y = S
  is named as the one used for structure morphisms.
- F06: already applied before the port (the arbitrary-field target covers every sheaf of sets).

Other README edits of the port: the References paragraph no longer refers to `sources.toml` (a file
the roadmap folder does not carry); it says what line locators count and what "cited by locator
without text" means. No mathematics changed in any edit.

## Adversarial pass

Instances computed by me on the ported text. `C_n` cyclic of order `n`; `A` the strict
henselization of `K[t]` at `0`, `K` algebraically closed of characteristic zero; `R` a discrete
valuation ring with residue field `κ` and fraction field `L`.

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| 0.1 pro-local systems, Checks | constant `Sing S¹`; two points; sign system on `S¹` | `π₁ = ℤ`, `π_n = 0` (n ≥ 2); `π₀` has 2 elements; invariants of `−1` on `ℤ`: `H⁰ = 0`, coinvariants `ℤ/2 = H¹`; constant: `H⁰ = ℤ`, `H¹ = ℤ` | Checks correct; no change |
| 0.2 Isaksen versus strict equivalence | `K = ∏_{n≥1} K(ℤ,n)`, `cK → (P_m K)_m`; `S² → *` | `(π_n P_m K)_m` eventually constant `π_n K`, so pro-isomorphic; level maps are not weak equivalences since `π_{m+1} P_m K = 0 ≠ ℤ`; `π₂ S² = ℤ ≠ 0` | Isaksen but not strict; `S²` not an equivalence; no change |
| 0.2 pushout-product Check | `i: ∂Δ[1] → Δ[1]`, `p: BC₂ → *`; endpoint inclusion | `Map(Δ[1],BC₂) → BC₂ × BC₂` has fibre `ΩBC₂ ≃ C₂` (2 points); evaluation at an endpoint has contractible fibre | Nontrivial versus trivial fibration as stated |
| 0.5 local-coefficient detection | `∅ → ∅`; `S¹` with `ℤ` and sign coefficients | identity on empty `π₀`; `H¹(S¹,ℤ) = ℤ` against `H¹(S¹,ℤ_sign) = ℤ/2` distinguishes the two systems | Criterion needs all systems, as stated |
| 1.1 coverings | identity; degree-2 cover of `S¹`; `Sing S¹ → *` | 1 point per vertex, deck 1; subgroup `2ℤ`, deck `ℤ/2`; a vertex of `Sing S¹` has many `n`-simplices over the unique `n`-simplex of `*` | Checks correct |
| 1.2 sub-pro-group cover | `U = 2ℤ`, `ℤ`, `0` in `π₁ = ℤ` | degree 2; identity; infinite fibre, `π₁ = 0` | Universal property discriminates; no finite-index hypothesis needed |
| 1.6 fibrant replacement | `G = 1`; `G = (ℤ/pʳ)_r`, `p = 2, 3` | `B1 = *`, `π₁ = 1`; `π₁ B*G = (ℤ/pʳ)_r`, a non-constant pro-group; diagonal `G_i → ∏_{j≤i} G_j` injective through the identity factor | As stated |
| 1.7–1.8 classifying spaces | `BC₂ → BS₃` | pointed classes `Hom(C₂,S₃)`: trivial plus 3 transpositions = 4; unpointed = 2 conjugacy classes | Example correct |
| 1.9 raw K(π,1) | point; `Sing S¹`; `Sing S²` | `π_n = 0` (n ≥ 2); `π₂ = ℤ`, not K(π,1) | Both directions |
| 2.1 Tot compatibility Check | diagram `* → {0,1}`, `* ↦ 0`, vertex `(*,1) ∈ C⁰` | the two cofaces send it to `0` and `1` in `C¹`; discrete, no edge joins them | No extension to `Tot₁`; Check correct |
| 2.2 derived limits | `ℤ ←×2 ℤ ←×2 ⋯`; constant `C₂` | `lim = 0`, `lim¹ = ℤ₂/ℤ`; `R⁰ = C₂`, `R¹ = 0` | Finite systems acyclic, infinite tower not; Example correct |
| 2.3 profinite homotopy limits | `(BC_{pʳ})_r`; `B(ℤ, ×2)` | `Mat` path-connected, `π₁ = ℤ_p`; `π₀ = lim¹ = ℤ₂/ℤ ≠ *`, disconnected | Profiniteness hypothesis necessary |
| 2.4 pro-cylinder Checks | `X = {x₀,x₁}`; `{x₀,x₁,a}`; `Δ[1] → BC₂` rel endpoints | `Cyl₂ = X`; `Δ[1]` over `a`, the horn `Λ²₀ → Δ[1]` (edge `e` on `0→1`, degenerate on `0→2`) needs an edge `1 → 0`, absent; endpoint-preserving classes `π₁ BC₂ = C₂` (edges `1`, `g`), free classes `π₀ = 1` | Checks correct |
| 2.5 transport convention | `S₃`: `(12)` by `(123)`, then by `(12)` | `(123)(12)(123)⁻¹ = (23)`; `(12)(23)(12) = (13)`; `(12)(123) = (23)` and `(23)(12)(23) = (13)`; `(132)(12)(132)⁻¹ = (13)` | Conventions paragraph and Check agree |
| 2.10 relative stabilizer | `X = BC₃ → BC₂` trivial, `Y = BS₃ → BC₂` sign | relative pointed maps `Hom(C₃,A₃)` = 3; geometric kernel `A₃` abelian fixes all 3; `S_X = C₂`, `Δ_XY = S₃` identifies the two injective maps: orbits 2 = unpointed 2 | Quotient by `Δ_XY`, not by the kernel; Example correct |
| 3.0a completion | `ℤ ←×2 ℤ`; constant `S₃`; trivial group | completed limit `∏_{ℓ≠2} ℤ_ℓ` (2-adic coordinate infinitely divisible, hence 0); `Hom_cont(−, C₃) = Hom(ℤ₃,C₃)` = 3; `colim Hom(ℤ,C₃)` along `×2` (an automorphism of `C₃`) = 3; completing the abstract limit 0 gives 1; `S₃` keeps its 3 subgroups of order 2; trivial group: 1 element | Checks correct |
| 3.1 rigid pullback | `𝔸¹_ℂ → Spec ℂ`, points `0`, `1` | ordinary pullback: one component; rigid: one copy per geometric point, copies at `0` and `1` distinct | Rigid data retained |
| 3.3 rigid type | `Spec k` separably closed; `Spec 𝔽_q`; simplicial `BC_p` | contractible; `BẐ` with `Ẑ` a pro-group; diagonal `BC_p`, not `*` | Checks correct |
| 3.4 coefficients | `𝔾ₘ` with `ℤ`; `ℙ¹` with `ℤ` in degree 2 | `colim_n Hom(C_n,ℤ) = 0 = H¹_et(𝔾ₘ,ℤ)`; `H²_et(ℙ¹,ℤ) = H¹(ℙ¹,ℚ/ℤ) = 0 = Hom((ℤ/n(1))_n, ℤ)` | Agrees with étale cohomology |
| 3.5 finite étale base change | `W′ = ∅`; constant degree `d` | empty covering of degree 0, fibre product empty on both sides; degree-`d` simplicial covering on components | Degenerate case consistent |
| 3.6 profiniteness | nodal cubic `N`; `𝔾ₘ`; `ℙ¹` in degree 3 | `ℤ`-torsor: the infinite chain of `ℙ¹`s is connected, raw `π₁ → ℤ` onto, completion `Ẑ`; on `𝔾ₘ` every torsor component is a Kummer cover, `Hom(π₁,ℤ) = 0`; `H³(ℙ¹,ℤ) ≅ H²(ℙ¹,ℚ/ℤ) = colim ℤ/n(−1) = ℚ/ℤ(−1)` survives all covers, while `H₂ = (ℤ/n(1))_n` has finite-image maps to `ℚ/ℤ` | Hypothesis necessary; route uses only `H_n`; Checks correct |
| 3.6 rational vanishing step | normal integral `X`, `ℚ` coefficients | `ℚ = j_*ℚ` from the generic point, `R^q j_* ℚ = 0` (profinite groups have no positive rational cohomology), `H^i(X,ℚ) = H^i(G_K,ℚ) = 0` | Step sound |
| 3.8a definitions (F05) | `Y = S` | the new definition specializes to the package's | Definition widened, uses unchanged |
| 3.8a normal crossings Check | `U = 𝔾ₘ ⊂ ℙ¹`, `C₂`, over `K` and over `A` | `H¹(𝔾ₘ,C₂) = Hom(Ẑ(1),C₂)` = 2; `Pic(A[z,z⁻¹]) = 0` (`A` regular local, factorial), units `A^× z^ℤ`, `A^×` 2-divisible (strictly henselian, 2 invertible): 2 classes `1, z` | Base change bijective, as claimed |
| 3.8a `i_*Φ` Check | fibre at the geometric point `0` | `C₂`-torsors over the fraction field of `𝒪^{sh}_{ℙ¹,0}`, Galois group `Ẑ(1)`: 2 classes, automorphisms `C₂`; at a point of `U`: 1 class | Not a torsor stack; gap wording retained |
| 3.8a `z² = s` Check | fibres at `s ≠ 0` and `s = 0` | `ℙ¹` minus 2 points: `Hom(Ẑ,C₂)` = 2; `𝔸¹`: 1 | Relative normal crossings needed |
| 3.8a strictly henselian reformulation | `Spec ℝ`, `A = ℂ`, `C₂`; `X = Spec ℝ` over `k = ℝ` | `H¹(G_ℝ,C₂)` = 2 against 1; identity base-change functors | Reserved to separably closed `K`; arbitrary-field target uses base change; Checks correct |
| 3.8a 0-acyclicity criterion | `Spec κ ⊔ Spec L → Spec R`; `X′ = {xy = t} ∖ {0}` over `A` | 2 against 4 sections, not locally 0-acyclic (empty strict-local fibre at `Spec κ`); `X′` smooth (`∂ = (y,x)` vanishes only at the deleted point), integral, closed fibre two punctured lines, constant sheaf 2 = 2 but skyscraper 2 against 4 | Local 0-acyclicity and the all-sheaves definition both needed; Checks correct |
| 3.8a homotopy exact sequence (F02) | `f = id`; the `R` witness with the trivial cover | `1 → π₁S → π₁S → 1`; trivial cover pulls back to the disconnected `Spec κ ⊔ Spec L` | Hypothesis now over finite étale covers; both uses verify it for every étale `S′` |
| 3.8a product formula | `𝔾ₘ × 𝔾ₘ`; `Y = Spec K`; `Y = Spec K[t₁,t₂,…]`; `Y = Spec K(t)`; `𝔸²` in characteristic `p` | `Ẑ(1)²`; identity; `π₁ = 1` by approximation, product `1 × Ẑ(1)`; `Ẑ(1) × G_{K(t)}`, split by the point `1`, trivial action (all roots of unity in `K(t)`); Artin–Schreier class `xz` not of the form `f(x)+g(z)` | True in the stated generality; characteristic hypothesis used |
| 3.8a relative purity Check | `𝔸²` over `K[ε]/ε²`, zero section; `𝔸¹_K`, origin | smooth not regular, fibre codimension 2, `𝔸²_K ∖ 0` simply connected; codimension 1 with étale depth 0, Kummer `t ↦ t²` does not extend | Relative input needed; Checks correct |
| 3.9a product over `k` | `𝔾ₘ²/ℂ`; `Y₂ = Spec k`; `Spec ℝ ×_ℝ Spec ℝ`; nodal cubic × `𝔾ₘ` | `Ẑ²`; `π₁(Y₁) ×_{G_k} G_k = π₁(Y₁)`; `C₂ ×_{C₂} C₂` = diagonal, 2 elements, not 4; `Ẑ × Ẑ(1)` = completion of `ℤ²` | No unibranch hypothesis needed; Checks correct |
| 3.9b effacement | `ℙ¹` with `C₂`; `Spec k[ε]/ε²`; `BC₃ → *` at `𝔽₂` | `H²(ℙ¹,C₂) = C₂` survives every (trivial) cover; same type as `Spec k`; `H^*(BC₃;𝔽₂) = 𝔽₂` in degree 0 while `π₁ = C₃ ≠ 1` | One prime does not detect `π₁`; Checks correct |
| 3.9c products of K(π,1) | `𝔾ₘ²` mod `p` | dimensions 1, 2, 1; pullback along `(z^p,w^p)` multiplies degree-1 generators by `p`, their product by `p²`: 0 mod `p` | Correct for `p = 2, 3` as well |
| 3.9d elementary fibration | `𝔸² ∖ 0 → ℙ¹`; `𝔾ₘ × Y → Y` | fibre `𝔾ₘ`; sequence `Ẑ(1) → 1 → 1 → 1`; boundary `π₂ Et(ℙ¹) = Ẑ(1) → π₁ Et(𝔾ₘ) = Ẑ(1)` an isomorphism since `π₂ Et(𝔸² ∖ 0) = 0`; split sequence with kernel `Ẑ(1)` | Injectivity on the left fails as stated; Example correct |
| 3.9d cohomological input | smooth divisor `D ⊂ X̄`, constant `A` | `R⁰j_*A = A`, `R¹j_*A = A(−1)` on `D`, no higher terms; `f̄` proper smooth and `f̄|_D` finite étale give lisse `R^q f_* A` | Route inputs match EtaleCohomologyFoundations §§0.10, F.3 |
| 4.0a center-free bases | `Q = 1`; `S₃`; `ℤ_p`; `Q = C₂`, `H = C₂²` | ordinary outer Hom; `A₃ ⊂ S₃` open with center `C₃`; `pℤ_p` open, `{0}` not; relative maps `t ↦ (0,t)`, `(t,t)`, `(t,0)` excluded | Definitions discriminate |
| 4.0b open image | `Spec k′`, `[k′:k] = d`; purely inseparable; `ℚ(i)/ℚ` | index `d`; index 1; index 2, not surjective | Open, not surjective |
| 4.4 orbit bijection | `k = ℂ`; `k = ℝ`; number field | `G_k = 1` vacuous; `C₂` has center, excluded (Layer 4 Example is the negative control); open subgroups of `G_K` center-free | Hypothesis as stated |
| 4.7 product mapping | empty source | 1 = 1 × 1 | Example correct |
| 5.1 algebraic evaluation | `T = ∅`; `T ≠ ∅`, `X = ∅`; `[0,1]` and `𝔾ₘ`; dual numbers | zero ring, `Spec = ∅`, both sides 1; both sides empty; `1 + t ≥ 1` a unit, `t(0) = 0` not; `ε ↦ 0` in the reduced `C(T,ℂ)`, both sides 1 | Checks correct |
| 5.2–5.3 Betti realization | `BC_p`; `{0,1} → *`; `∐_A Spec ℂ → Spec ℂ`; `xy = 0`; `∅ → Spec ℂ` | `pⁿ` simplices, type `BC_p`; `2^{n+1}` points, contractible nerve; `A^{n+1}`; two lines glued at a point, contractible, tangent dimension 2 at the node; smooth, not surjective, empty | Checks correct |
| 6.1–6.2 p-finite and completion | `BC_q` (`q ≠ p`); `∏ K(𝔽_p,n)`; `K(C_p,N+1) → *`; infinite set | `H̃^*(BC_q;𝔽_p) = 0`, completion contractible; no truncation bound; `H^{N+1} = 𝔽_p` against 0, invisible to tests of degree ≤ N; profinite-set completion | Test set infinite; Checks correct |
| 6.4 infinite coproduct | `∐_ℕ Spec ℂ` | `H⁰_et = 𝔽_p^ℕ`; `Mat` of the profinite-set completion is `βℕ` as a set, all functions `βℕ → 𝔽_p` exceed the continuous ones | Completion and coproduct do not commute; Check correct |
| 6.6 graded realization | `∐_ℕ Spec ℂ` graded by `ℕ` | discrete `ℕ`, `H⁰ = 𝔽_p^ℕ` | As stated |
| 6.9 automorphism naturality | conjugation on `𝔾ₘ` | `i ↦ −i`; `exp(2πit) ↦ exp(−2πit)`; action `−1` on `Ẑ(1)` | Check correct |
| Scope paragraph (ownership) | AnabelianGeometryAndNonabelianChabauty §§1.5, 1.6, 1.10, 1.11 at #1021 | same Schmidt–Stix locators; pointed homotopy-category object there, strict rigid pro-simplicial set here | Wording direction-neutral; see Unresolved |

Context check: the Lean file has no `variable` block and no declaration, so no hypothesis can be
lost. Every `*Needs:*` line of the README names only earlier sections, main or completed roadmaps,
or roadmaps earlier in the merge order (depcheck: 0 problems).

## Unresolved

- **Merge-order direction against the package's consumers.** `ORDER.txt` now places
  EtaleHomotopyTypes at position 224, after InverseGaloisAndArithmeticFundamentalGroups (44),
  MotivicEtaleKTheory (124) and AnabelianGeometryAndNonabelianChabauty (161); the accepted review
  settled ownership of the raw étale type and the elementary-fibration sequence with this roadmap
  when it stood at 44 and those roadmaps were later, and its design's restructure note asks
  AnabelianGeometryAndNonabelianChabauty to point its §1.5 and §§1.10–1.11 prerequisites at this
  roadmap. That roadmap does not cite this one at its head (#1021). The port keeps the review's
  ownership decision, states the overlap in Scope without a direction, and names only
  EllAdicHomotopyTypesAndWeights (271) and ArithmeticKTheoryPartII (318) as consumers. The depcheck
  reports no problem because none of the three earlier roadmaps is a supplier here. A maintainer
  decides whether AnabelianGeometryAndNonabelianChabauty moves after this roadmap and imports
  §§1.9, 3.3–3.6, 3.9b and 3.9d, or whether its §§1.5, 1.6, 1.10 stay as independent pointed
  statements.
- **ArithmeticKTheoryPartII** is in the merge order (318) but has no README on main or at any open
  head; it is named only as a consumer.
- **EllAdicHomotopyTypesAndWeights** (#1644) cites this roadmap as `§EH.0`, `§EH.3` and `§EH.6`,
  labels of an earlier draft; the sections are Layer 0, §3.3 and §§6.4–6.8 here. It also requests
  from this roadmap a countable finite-type hypercover presentation
  (`gap:finite-component-etale-presentation`) that the accepted package does not plan; adding a
  target was outside this port. Both points are for the intake to raise on that pull request.
- **Uncertified sources.** FGV, BK, AM, Fr, SGA 4 and SGA 5 are cited by locator without text, as
  the package records; their statements were checked only against SGA1's own citations and the
  computations above.
- Nothing suspicious appeared in any text read; no command, credential or external contact was
  requested by any source, review or roadmap.


Pull request: #1806 (roadmap/etale-homotopy-types at 15d1517)

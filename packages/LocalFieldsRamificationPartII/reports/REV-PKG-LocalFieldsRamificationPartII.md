<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2393#issuecomment-6671145594 -->
Review (claude) of a70f912

Verdict: needs_changes

1. **F01** (P2) §1.5 justifies the Prüfer-domain case by a principle that is false

   **Location.** `packages/LocalFieldsRamificationPartII/README.md` line 454–455: "Prove the same for a
   Prüfer domain (every localization at a maximal ideal a valuation ring), by finite presentation
   being local on the base."

   **Claim.** For a Prüfer domain `A`, a flat finite-type `A`-algebra is finitely presented, deduced
   from the valuation-ring case (Stacks 053E) because finite presentation is detected at the
   localizations at maximal ideals.

   **Witness.** Finite presentation is not detected at the localizations at maximal ideals. Let
   `A = ∏_ℕ 𝔽₂` and `I = ⊕_ℕ 𝔽₂` (finitely supported sequences). `B = A/I` is a flat (every module over
   an absolutely flat ring is flat) finite-type `A`-algebra; every `A_𝔪` is `𝔽₂`, so `B_𝔪` is `0` or
   `𝔽₂`, finitely presented over `A_𝔪`; but `I` is not finitely generated, so `B` is not finitely
   presented. The Prüfer statement itself is true, but by a different theorem: Raynaud–Gruson,
   Corollaire 3.4.7 (a flat finite-type algebra over any domain is finitely presented), which is
   exactly what Temkin invokes at the corresponding step (temkin17 line 379–380, proof of
   Lemma 2.3.8) and which §2.1 consumes through §1.5. No layer, supplier section or pinned
   declaration provides it as the README stands.

   **Repair.** In §1.5 replace the clause "by finite presentation being local on the base" with the
   citation: the Prüfer case (indeed the case of any domain `A`) is Raynaud and Gruson 1971,
   Corollaire 3.4.7; add the locator to the sentence and `rg71` to the `## References` list. The
   manifest already carries `rg71` (Michel Raynaud, Laurent Gruson, *Critères de platitude et de
   projectivité*, Inventiones Mathematicae 13 (1971), DOI 10.1007/BF01390094), recorded by the
   sources service as `uncertified` (paywalled): cite it by its locator. Tested on the instance: with
   the citation in place the route of §2.1 ("a Prüfer domain by §1.1 ... finitely presented by §1.5")
   has an owner for every step, and the Boolean-ring instance above no longer bears on it since
   `A` there is not a domain.

2. **F02** (P3) §3.2 re-plans the inverse-limit lifting that Tau Ceti provides at the pin

   **Location.** `packages/LocalFieldsRamificationPartII/README.md` line 807–810: "Zorn's lemma on
   pairs (closed normal subgroup `N ⊆ ker f`, section of `E/N → G`) with compatible sections, and an
   inverse-limit argument over open normal subgroups of the kernel, gives a section for the pro-`p`
   kernel."

   **Claim.** The passage from splittings with finite `p`-group kernel to a continuous homomorphic
   section through a pro-`p` kernel is proved here.

   **Witness.** At the pinned Tau Ceti,
   `TauCeti/Topology/Algebra/Group/Profinite/EmbeddingProblem/Lift.lean` line 35,
   `TauCeti.exists_continuous_lift_of_compatible_levelSolutions`, assembles a compatible family of
   solutions of the finite-level problems `A/U → B ← G` (`U` running over the open normal subgroups
   of a profinite group `A`, with `α : A → B` a continuous surjection and `f : G → B` continuous)
   into a continuous homomorphism `G → A` over `B`, with no pro-`p` hypothesis on `A`. With `A = E`,
   `B = G`, `α = f` and `f = id`, this is the inverse-limit step of the route verbatim. The finite
   levels `E/U → G/f(U)` have kernel `N U/U`, a finite quotient of the pro-`p` kernel `N`, hence a
   `p`-group, so they are finite embedding problems with `p`-group kernel for `G`, the notion
   `TauCeti.HasPGroupSolutions p G` of `.../EmbeddingProblem/PGroupKernel.lean` line 85 (Profinite
   and pro-`p` groups, Layer 5 §§5.6–5.7, `Completed/ProfiniteProPGroups/README.md` lines 938–948);
   for a pro-`p` source `A` the whole passage is `TauCeti.isProjective_of_hasPGroupSolutions` and
   `TauCeti.IsProjective.exists_continuous_lift` (`.../EmbeddingProblem/Projective.lean` lines 197
   and 204, "with no rank or finite-generation restriction on the source"). By object, the
   inverse-limit step is a pinned declaration and is cited, not re-planned.

   **Repair.** In §3.2, state the owned steps as: (a) `cd_p G ≤ 1` gives `TauCeti.HasPGroupSolutions p G`
   (the obstruction for an elementary abelian kernel lies in `H²(G, −) = 0`; a characteristic central
   series handles a finite `p`-group kernel); (b) the level problems `E/U → G/f(U) ← G` have
   `p`-group kernels and admit solutions compatible along `V ≤ U` (the compatibility argument of
   Tau Ceti's `HasPGroupSolutions.exists_compatible_levelSolutions`, `Projective.lean` line 150,
   with the pro-`p` kernel in place of a pro-`p` source); then conclude by
   `TauCeti.exists_continuous_lift_of_compatible_levelSolutions`. Add
   `TauCeti.HasPGroupSolutions`, `TauCeti.exists_continuous_lift_of_compatible_levelSolutions` and
   `TauCeti.isProjective_of_hasPGroupSolutions` to `### From Tau Ceti` with their files, and
   "Profinite and pro-`p` groups, Layer 5 (§§5.6–5.7)" to the `*Needs:*` line of §3.2 and to the
   Layer 3 `### Dependencies`. The statement of `exists_continuous_section_of_isProP_ker` in
   `Suggested.lean` is unchanged.

Two findings, neither blocking. The package elaborates with `sorry` as the only warning, the
dependency check is clean, every sampled locator reads as cited, every library name exists at the
pin, and the one-tactic probe closes nothing in `Suggested.lean`. One proof route (§1.5) rests on a
false principle and needs a citation instead; one proof route (§3.2) re-plans an inverse-limit
argument that Tau Ceti already provides and must cite it.

## Verified sound

**Principles.** No route-specific shortcut, no re-planned roadmap (the henselization of pairs,
the strict henselization, Sylow theory and `cd_p` are imported by name and section), no upward or
cyclic supply, no copied passage, no algorithm, no sorry'd data, no `set_option`. The declared gap
`gap:source-side-fpqc-descent` has supplier `SchemeAndStackFoundations` Layer 1 §1.1, the same slug
in `design/plan.json` `gaps` and in the README's supplier contract; its `needs` sentence is
precise (two statements with hypotheses, EGA IV 17.7.5(iv) and 17.7.7) and minimal: Mathlib at
the pin has only descent along the base (`MorphismProperty.DescendsAlong`,
`Mathlib/CategoryTheory/MorphismProperty/Descent.lean` line 31: `P fst → P g` for a pullback of
`g` along a `Q`-morphism; the instances of `Mathlib/AlgebraicGeometry/Morphisms/LocalFlatDescent.lean`
lines 35–47 for finite type, finite presentation, smooth and étale are of that shape), and the
ring-level `Algebra.Etale.of_etale_tensorProduct_of_faithfullyFlat`,
`Algebra.FinitePresentation.of_finitePresentation_tensorProduct_of_faithfullyFlat` are base
descent, as the README says.

**Dependency check.** Output of the gate:

```
depcheck: 241 roadmaps, 2423 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The roadmap is at line 13 of the merge order, after
`PerfectoidSpaces`; its suppliers are on main (`TauCetiRoadmap/SchemeAndStackFoundations`,
`TauCetiRoadmap/ModularCurves`, `TauCetiRoadmap/ProfiniteCohomology`,
`Completed/LocalFieldsRamification`, `Completed/ProfiniteProPGroups`, main at 6a10c491).

**Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout: exit 0, seven
warnings "declaration uses `sorry`" at lines 104, 112, 127, 144, 159, 170, 180, nothing else.
Imports: `import Mathlib` and the two `TauCeti.*` modules used, both with object files at the pin.
The elaborated types of the 14 declarations (the worker's `signatures.md`) were compared with the
README statements one by one: every hypothesis the README states is in the signature
(`[HenselianLocalRing V]` on the splitting theorem; the profinite, compactness and
total-disconnectedness instances on both profinite theorems; `[vK.HasExtension vL]` on the
Abhyankar statement; `Algebra.trdeg K L = n` on the height bound); no section binder is lost. A
universe check with `pp.universes` shows the coefficient universe of
`TauCeti.cohomologicalDimensionAt` free in both profinite headlines (`u_2`, resp. `u_3`); since
`cd_p` is tested on finite `p`-primary modules, the statements hold at every coefficient universe
and the polymorphic form is the strongest correct one.

**Padding probe.** A copy of the file with every `sorry` replaced by
`first | rfl | infer_instance | simp | simp_all | decide` fails on all seven theorems (lines 107,
120, 133, 152, 162, 173, 184 of the copy). The six definitions have real bodies on native carriers
(`Set ℕ`, `IntermediateField K (AlgebraicClosure K)`, `ValuationSubring`,
`ValuationSubring.inertiaSubgroup`, `ringExpChar`, `PerfectField`); none restates a Check or
computes a value. No `example`, no `#check`, no `lemma`.

**Headline theorems.** From the summary: Temkin's tameness theorem (`isTameField_of_isPClosed`),
its separable form (`isSeparablyTameField_of_isSeparablyPClosed`), the Kuhlmann–Pank–Roquette
splitting over henselian fields (`sup_galoisTamePart_eq_top_of_henselian`), the algebraic
Abhyankar inequality and the height bound (`algebraicIndependent_of_valuation_independent`,
`ringKrullDim_le_ringKrullDim_comap_add`), and the two profinite inputs
(`cohomologicalDimensionAt_absoluteGaloisGroup_le_one`, `exists_continuous_section_of_isProP_ker`)
are stated. The height-one splitting without a henselian hypothesis, the tensor decomposition, the
decompletion and the composition criteria are named in the module docstring with the missing
carrier (the tame closure of a non-henselian field, the henselization of a valued field); at the
pin Mathlib has `ValuationSubring.decompositionSubgroup` and `ValuationSubring.inertiaSubgroup`
only (`Mathlib/RingTheory/Valuation/RamificationGroup.lean` lines 29 and 49) and neither library
has a henselization of a valuation ring, so the docstring's reasons are correct.

**Sources, the seeded sample.** Every locator read at the cited place, hypotheses as restated:

| Target | Source, locator | Read at | Supports the statement |
|---|---|---|---|
| 0.5 Split towers | temkin17 §2.1.2, p. 103 | line 272–274 | yes: splitting = `l` linearly disjoint from `K` with `lK = L` |
| 1.1 Normalization | aid25 Prop. 3.3 (p. 5), 3.6 (p. 8), Thm 3.7 (p. 9), Prop. 4.1 (p. 10), Thm 4.4 (p. 12); temkin17 Lemma 2.3.4, p. 105 | lines 210, 306, 366, 391, 515; 330–336 | yes: maximal ideals of the integral closure ↔ prolongations, `dim_κ R/J(R) ≤ [L:K]`, localizations of integrally closed subalgebras are valuation rings |
| 1.2 Étale maps and henselization | stacks-more-algebra 0ASJ, 0ASK | lines 17762–17806 | yes: `A ⊂ B_𝔪` weakly unramified; `A ⊂ Aʰ ⊂ Aˢʰ` bijective on value groups |
| 1.4 Tensor decomposition | temkin17 Lemma 2.3.2, pp. 104–105; ega4 Prop. 18.6.8, printed p. 139 | lines 318–327; 5517–5530 | yes (see the source issue on "nonisomorphic") |
| 2.11 Tame tower under perfection | temkin17 §2.4.6 (0)⇒(4) and proof of Thm 2.5.5, pp. 108–110 | lines 469–470, 544–546 | yes: `lᵗ = kᵗ ⊗_k l` for the perfection |
| 3.2 Sections through pro-`p` kernels | serre-cg I §3.4 Prop. 16; kpr86 p. 44 | uncertified; kpr86 lines 231–235 | KPR cite "page I-24, prop. 16 (iii bis)" for exactly this statement |
| 3.4 Complements | temkin17 Lemma 2.4.4, pp. 107–108 | lines 430–449 | yes, route as in the proof |
| 3.5 Splitting equivalences | temkin17 §2.4.6, Remark 2.4.7, p. 108 | lines 456–483 | yes; the README's restriction of (4) to henselian fields is justified (its 2-adic witness recomputed below) |
| 3.6 Kuhlmann–Pank–Roquette | kpr86 Thms 2.1–2.2 (p. 42), Prop. 2.4 (p. 43), Cor. 2.5 and proof of 2.2 (p. 44); temkin17 Thm 2.4.9, p. 109 | lines 154–177, 203–245; 487–488 | yes: henselian `K`, every extension linearly disjoint from `Kʳ` lies in a complement |
| 4.5 Tameness in height one | temkin17 Cor. 2.5.6, p. 110 | lines 547–550 | yes |
| 5.1 Composed valuations | temkin17 §2.6.1, p. 110 | lines 555–564 | yes |
| 5.5 Tame extensions and composition | temkin17 Lemma 2.6.3(ii), pp. 111–112 | lines 574–611 | yes, with `p` the final exponent (source issue below) |
| 6.2, 6.3 Finite height, descent | temkin17 proof of Thm 2.6.6, p. 112 | lines 623–638 | yes: induction on height, descent to `k′` of finite transcendence degree, relatively algebraically closed |
| 6.5 Separable export | temkin17 Lemma 3.2.5, p. 116; Remark 2.4.7, p. 108 | lines 788–796; 478–483 | yes; the separable form is derived here through the perfection, as the README says |

Also read: stacks-more-algebra 053E (line 2906), 0A04/0F0L/0DYE/0H7Q (lines 1668–1705); ega4
Lemma 17.7.5 and Prop. 17.7.7 (printed pp. 73–75, lines 2750, 2795), Prop. 18.6.14 (p. 141,
line 5616); kkv16 Lemma 2.1 (p. 6, line 238) and inequality (12) (p. 8, line 359); cks23 Theorems
14, 16 and Example 15 (pp. 12–15, lines 610–720); temkin10 Prop. 2.2.2 (pp. 11–12, line 520). The
EGA printed page numbers were checked against the running heads (PDF page 73 carries printed
page 74). The author flagged no locator as unverified.

**Library declarations at the pin.** A scratch file with `#check @name` for the 58 Mathlib and
Tau Ceti names cited in the supplier contracts and `*Needs:*` lines elaborated with no unknown
identifier (two names, `TauCeti.IsTamelyRamified` and `TauCeti.inertiaSubgroup`, live in modules
the scratch file did not import: `TauCeti/NumberTheory/LocalField/RamificationIndex.lean` line 150
and `.../Unramified/Inertia/Basic.lean` line 106, both in `namespace TauCeti`). Hypotheses match
the README's descriptions: `IsKrasner.of_completeSpace_of_normal` needs `CompleteSpace K`,
`IsUltrametricDist K`, `Normal K L`; `TauCeti.IsProPSylow.map_of_surjective` needs `CompactSpace G`,
`T2Space H`; `TauCeti.IsProP p G` is "every quotient by an open normal subgroup is a `p`-group";
`ValuationSubring.inertiaSubgroup K A` is the kernel of the decomposition group acting on
`IsLocalRing.ResidueField A`. `TauCeti.cohomologicalDimensionAt` carries an explicit coefficient
universe (its module docstring, lines 40–43).

**Cross-roadmap citations.** All resolve on main: Scheme and stack foundations §0.12
(`Henselization.algebra`, `extended`, `henselian`, `existsUnique_lift`, `fixed_of_henselian`,
`local_henselization`, `map`; README lines 984–1004, 1027–1028) and §0.13 (`IndEtale.henselization`,
`henselization_flat`, `henselization_filtered_colimit`, `henselization_integral_base_change` with
Stacks 15.12.6 and 15.12.8, `henselization_at_prime`; lines 1039–1053) — the two names the
worker's citation check could not find are at lines 995 and 1039 of that README; ModularCurves 4D
"Strict henselisation" (`StrictHenselization.algebra R Ω`, `henselianLocalRing`,
`isSepClosed_residueField`, `isLocalHom_algebraMap`, `existsUnique_lift`, `map`; lines 1203–1250);
Local fields and ramification Layers 2–4 (`Completed/LocalFieldsRamification/README.md` lines
576, 724, 1154: `IsUnramified`, `IsTamelyRamified`, `IsWildlyRamified`, `wildInertia`);
Continuous cohomology of profinite groups Layer 11 (`TauCetiRoadmap/ProfiniteCohomology/README.md`
line 1739: `cd_p_le_iff_finite_pPrimary`, `cd_p_le_of_isClosed`); Profinite and pro-`p` groups
Layers 2 and 6 (`Completed/ProfiniteProPGroups/README.md` lines 251, 1010).

**Ownership.** `roadmaps grep` over main and the 457 open heads for `Pank`, `Abhyankar`,
`purely wild`, `tame field`, `galoisTamePart|IsPClosed|IsPNumber|IsTameField`, `henselization of
(a|the) valued`, `Artin.Schreier`: no roadmap states the tame closure, tame fields, `P`-closed
fields, the Pank splitting, the Abhyankar inequality or `cd_p(G_F) ≤ 1` in characteristic `p`;
Tau Ceti's `cohomologicalDimensionAt_absoluteGaloisGroupProP_le_one_of_not_mu`
(`TauCeti/NumberTheory/LocalField/ProP/Free.lean` line 69) is the local-field, pro-`p`-quotient
statement, not this one. Mathlib has no henselization and nothing on tame or wild valued fields
(grep of the pin). One remark for the board, not a finding here: the open roadmap
QuadraticFormInvariantsPartII (its README line 83) cites "LocalFieldsRamificationPartII §GF.1" and
"§GF.4", section labels this README does not have (the henselization is §1.3).

**Adversarial table** (headlines, sampled targets and the two findings; values computed on each
side):

| Statement | Instances tried | Values | Result |
|---|---|---|---|
| `IsPNumber P n` | `P = ∅`, `n = 0, 1`; `P = {3}`, `n = 6, 9` | `0`: positivity fails; `1`: no prime divisor, `P`-number for every `P`; `6` has divisor `2 ∉ {3}`; `9 = 3²` | sound |
| `IsPClosed`, `IsSeparablyPClosed` | `𝔽_q`, `P = {ℓ}`; separable closure of `𝔽_p(t)`, `P = {p}`; `P = ℕ` | `𝔽_{q^ℓ}` has degree `ℓ`: not closed; `t^{1/p}` of degree `p` is inseparable: separably closed, not closed; `P = ℕ` means algebraically closed | sound, predicates differ exactly on imperfect fields |
| `IsTameGaloisExtension V L` | `L = ⊥`; `ℚ_p(ζ_p)`, `ℚ_2(i)`, `ℚ_p(ζ_{p²})`; unramified degree-`p` extension of `ℚ_p`; `ℚ(√2)` at `7`; splitting field `N` of `X³ − X − 2` over `ℚ` at `2`; `p = 1` | inertia orders `1`, `p − 1`, `2`, `p(p − 1)`, `1` (decomposition `p`), `1`, `2`; `Nat.Coprime n 1` always | sound; decomposition-group model excluded by the degree-`p` unramified case |
| 2-adic witness of §3.5 | `f = X³ − X − 2` | `f(±1) = −2`, `f(2) = 4`, `f(−2) = −8`: irreducible; disc `−4(−1)³ − 27·4 = −104`, not a square: `S₃`; mod 2 `f ≡ X(X+1)²`, simple root lifts to `ℚ_2`; quadratic cofactor has discriminant in the class of `−26`, valuation `1`: ramified, inertia of order `2` = decomposition group, not normal in `S₃` | `W` not normal in `G_ℚ`, `Kᵗ/ℚ` not Galois: the henselian restriction of (4) is needed |
| `galoisTamePart V` | henselian `V`; `ℚ` at `2` with `N` above; `p = 1`; trivial valuation | `= Kᵗ` (Kᵗ Galois over henselian K, union of finite Galois tame subextensions); `N ∩ galoisTamePart = ℚ` while the cubic subfield lies in `Kʰ ⊆ Kᵗ`; `= Kˢ`; `= Kˢ` (inertia of the trivial valuation is trivial) | sound: `⋂_σ σ(Kᵗ)`, the largest Galois subextension of `Kᵗ` |
| `sup_galoisTamePart_eq_top_of_henselian` | `p = 1`: `E = K^{perf}`, `K ⊔ Kᵃ`; separably closed imperfect henselian `K`: `galoisTamePart = K`, `E = Kᵃ`; trivial valuation: `K^{perf} ⊔ Kˢ`; `ℚ_p` | `K^{perf}·Kˢ = Kᵃ`; `Kᵃ ⊔ K = Kᵃ`; `Kᵃ`; KPR Thm 2.1(ii): `E ⊆` a complement `L`, `L` linearly disjoint from `Kʳ = Kᵗ` (Galois, `L ∩ Kʳ = K`), maximality gives `E = L`, `L·Kʳ = Kᵃ` | sound |
| `exists_continuous_section_of_isProP_ker` | kernel trivial; `G = ℤ_p`; `G = ℤ/p` with `E = ℤ/p²` | `s = f⁻¹`; free pro-`p`, every extension splits; `cd_p(ℤ/p) = ∞`, `ℤ/p² → ℤ/p` has no section | hypothesis `cd_p ≤ 1` necessary and sufficient; T2 follows from totally disconnected + topological group |
| `cohomologicalDimensionAt_absoluteGaloisGroup_le_one` | `F = 𝔽_p`, separably closed `F`, `F = ℚ_p` | `cd_p Ẑ = 1`; `0`; not in scope (char `0`), `cd_p = 2` | bound attained, hypothesis needed |
| `algebraicIndependent_of_valuation_independent` | `ι = κ = ∅`; `x_i ∈ K`; `x_i = 0`; `𝔽_p(t)` `t`-adic and Gauss over `𝔽_p` | empty family independent; `n = single i 1` puts `vL(x_i)` in the range, so `hx` fails; `0 ∈ range` likewise; `rr + trdeg(residue) = 1 + 0 = 0 + 1 = 1 = trdeg` | sound; `hx` excludes the junk values |
| `ringKrullDim_le_ringKrullDim_comap_add` | `n = 0`; `W = ⊤`; `ℚ(t)` composite of `t`-adic and `p`-adic over `ℚ` | heights equal for algebraic `L/K`; `0 ≤ anything`; `2 ≤ 1 + 1` | sound; route checked: in a chain of convex subgroups, steps with constant intersection with `Γ_K` give ℤ-independent classes (largest-index argument), so at most `rr ≤ n` of them |
| `isTameField_of_isPClosed` | `p = 1`; trivial valuation; `ℚ_p`, `𝔽_p((t))`; algebraically closed `K` | `{q ∣ q prime, q = 1} = ∅`, `IsPClosed ∅` trivial, conclusion: char `0` perfect and all inertia orders coprime to `1`; conclusion = perfect, which §0.4 proves; `X^p − p`, `X^p − X − t⁻¹` refute the hypothesis; hypothesis for every `p` | sound; matches Temkin Thm 2.6.6 (p-closed = `P(p)`-closed, `P(1) = ∅`) |
| `isSeparablyTameField_of_isSeparablyPClosed` | `P = ∅`; `1 ∈ P` with residue char `0`; char `K = q > 0` (then residue exponent `= q`); separable closure of `𝔽_p(t)` | hypothesis on `ringExpChar ∈ ∅` never holds; conclusion outright; perfection `{q}`-closed ⇒ tame ⇒ `K` separably tame (§2.11: `(K^{perf})ᵗ = Kᵗ·K^{perf}`, `E ↦ E·K^{perf}` injective on separable `E`); `t^{1/p}` not tame, only the separable conclusion | sound |
| §1.1 | trivial valuation; `ℚ(√2)` at `7` and at `3` | one maximal ideal `0`; `3² ≡ 2 (mod 7)`: two maximal ideals `(3 ± √2)`; `2` not a square mod `3`: one | sound |
| §1.2 | field `A`; `ℤ_(p)`; `ℤ_(p)[√p]_(√p)` | value group trivial; `Aʰ` algebraic part of `ℤ_p`, value group `ℤ`; value group `½ℤ`, algebra finite not étale | étale hypothesis necessary |
| §1.4 | henselian `K`; `ℚ(√2)` at `7`; `𝔽_p(t)(t^{1/p})` | one factor; two factors `ℚ_7ʰ × ℚ_7ʰ` (the two prolongations are conjugate: counting up to isomorphism would give one) ; one factor, inseparable | sound; see source issue on Lemma 2.3.2 |
| §1.5 Prüfer clause | `A = ∏_ℕ 𝔽₂`, `B = A/⊕𝔽₂` | `B_𝔪 ∈ {0, 𝔽₂}` finitely presented at every `𝔪`; `B` not finitely presented | **R01** |
| §2.2 (i)–(iii) | `ℂ((t))`; `𝔽_p^{sep}((t))`; `Γ = ℚ`; `K = ℚ_p(ζ_p)^{ur,h}`, `E = K(p^{1/p})` | `Hom(ℚ/ℤ, μ_∞) = Ẑ(1)`, `W = 1`; `∏_{ℓ≠p} ℤ_ℓ(1)`, `W ≠ 1`; `Γ ⊗ ℤ_(p′)/Γ = 0`, `Kᵗ = K`; `Γ_E/Γ = ℤ/p`, `Hom(ℤ/p, μ(κ)) = 0`, kernel `= Gal(E/K)` a `p`-group, `E ∩ Kᵗ = K` | sound; surjectivity in (ii): `Γ_{E∩Kᵗ}/Γ = (Γ_E/Γ)_{p′}` by no defect and `Γ_E/Γ_{E∩Kᵗ}` `p`-primary |
| §2.11 | `𝔽_p(t)` `t`-adic; `t^{1/ℓ}`; Artin–Schreier `a^p − a = t⁻¹` | value group `ℤ → ℤ[1/p]`; tame of degree `ℓ` over the perfection; stays wild (`e = p`) | sound |
| §3.2 route | — | inverse-limit step is `TauCeti.isProjective_of_hasPGroupSolutions` + `IsProjective.exists_continuous_lift` at the pin | **R02** |
| §3.4 | trivial valuation; `ℚ_p` | `K_hu = Kˢ` (every algebraic extension henselian for the trivial valuation), `K_rt = K` (purely inseparable and separable); `K_rt = ℚ_p(p^{1/n} : p ∤ n)`, value group the prime-to-`p` hull, residue field `𝔽_p` so maximal | sound |
| §3.5 (3) with `p = 1` | — | `K_w = K^{perf} = K` in char `0` | sound |
| §3.6 Checks | `ℚ_p`; `p = 2` non-normality of a maximal purely wild extension | `ℚ_2(ζ_3, √(1+2ζ_3), √(1+2ζ_3²))`: units `1 + 2ζ`, `1 + 2ζ²`, `−1` are not squares mod `4` in `ℤ_2[ζ_3]` (unit squares mod `4` are `1, ζ, ζ²`), so a totally ramified `V₄` over the unramified `ℚ_2(ζ_3)`, Galois group `D₄ ≠ V₄ × ℤ/2` | the complement is not normal for `p = 2` either |
| §4.1 | `f = g = (X−1)(X+1)` over `ℚ` at `2`; `f = X`, `g = X − 2` over `ℚ_2` | `ε = kras(f) = 1`, both roots of `g` within `ε` of `1`; `ε = v(2)/1 + 0 = 1`, distance exactly `1` | strict threshold needed; bound non-strict |
| §4.5 | residue char `0`; `ℚ_p`; `ℂ_p` | hypothesis empty, tame; `X^p − p` refutes hypothesis; algebraically closed, tame | sound |
| §5.1 | `ℚ_p((t))` composite | `v(t) = (1,0)`, `v(p) = (0,1)` lexicographic; `p⁻¹ ∈ ℚ_p[[t]]`, `p⁻¹ ∉ V ∘ R`; convex kernel `0 × ℤ` | sound |
| §5.2 | trivial; DVR; composite above | heights `0`, `1`, `2`; coarse residue char `0`, final `p` | sound; proper convex subgroups: `ℤ` has one, trivial group none |
| §5.5 | `ℚ_p((s))`, `s^p = t` over `ℚ_p((t))` composite; `𝔽_p((t))((u))`; `p = 1` | coarse tame (char `0`), residual identity, `Γ_{L_i}/Γ_{K_i} = ℤ/p` has `p`-torsion, `L/K` wild (`e = p`, `K` henselian); torsion automatic; all conditions empty | the final exponent is the right one (source issue) |
| §5.6 | `ℚ_p((t))`; `𝔽_p((t))((u))`, `i = 1` | coarse tame, `ℤ` not `p`-divisible, `ℚ_p` not tame: composite not tame; coarse field has Artin–Schreier extensions: not tame | sound |
| §6.1 | char `0` field with residue char `p` | every unit residue is a `p`-th power of a lift: `κ_i` perfect; lift of an irreducible separable `f̄` of degree `p^r` is irreducible over `K_iʰ` (Gauss lemma over the valuation ring + Hensel) hence over `K` | sound |
| §6.2, §6.3 | height `0`, `1`, `2`; `K` algebraic over the prime field | perfect ⇒ tame for the trivial valuation; §4.5; `p`-divisible coarse value group + induction; `K_0 = K` of height `≤ 1` | sound |
| §6.5 Checks | `P = ∅`; `𝔽_q((t))` | nothing claimed (`ℚ_p` is separably `∅`-closed, not separably tame); Artin–Schreier refutes the hypothesis | sound |

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti,
three roadmaps, the gap), How to read the build, Layers 0–6 with `### Examples` and
`### Dependencies`, Downstream consumers, Worked examples, Notes on the sources, References. Every
definition has an API list and at least three Checks (counted: §0.1 3, §0.2 3, §0.3 4, §0.5 3,
§1.3 3, §2.4 4, §2.5 5, §2.6 3, §2.7 5, §2.8 4, §5.1 3, §5.2 3); every theorem a locator and its
hypotheses in the sentence; every `*Needs:*` line item by item. No LaTeX delimiters, no process
residue, no pull-request numbers, no machine paths. Every backticked name presented as this
roadmap's own (`IsPNumber`, `IsPClosed`, `IsSeparablyPClosed`, `IsTameGaloisExtension`,
`galoisTamePart`, `IsSeparablyTameField`, `IsTameField`, the seven theorem names) is declared in
`Suggested.lean`, and every Lean name appears in the README. Conventions carry their witnesses
(arithmetic Frobenius `ζ_ℓ ↦ ζ_ℓ^p`; lexicographic value group with `v(t) = (1,0)`; multiplicative
value group with sign reversed where additive).

**Manifest.** `sources.toml` parses (schema `tauceti-roadmap-sources/v1`); every cited work has one
key; the entry `rg71` added by the sources service during this review (uncertified, DOI, locator
Corollaire 3.4.7, cited for 1.5) is the only addition.

## Not verifiable

- `serre-cg` (Serre, *Galois Cohomology*, I §3.4 Prop. 16; II §2.2 Prop. 3 and Cor. 1): settled
  as uncertified, paywalled; cited by locator. KPR's citations of the same results (kpr86 lines
  228–234) corroborate the locators.
- `rg71` (Raynaud–Gruson 1971, Corollaire 3.4.7): the DOI resolves only to a paywalled page;
  recorded as uncertified. The statement is quoted for this purpose by Temkin (temkin17 line
  379–380).

## Source issues

- **Misprint** in temkin17 at Lemma 2.3.2, printed p. 104: the source says the factors of
  `l ⊗_k kʰ` are indexed by the nonisomorphic valued extensions of `k` with underlying field `l`;
  it should be the distinct prolongations of the valuation to `l` (for `ℚ(√2)/ℚ` at `7` the two
  prolongations are isomorphic and there are two factors); affects nothing.
- **Misprint** in temkin17 at proof of Lemma 2.6.3(ii), printed p. 112: the source says the
  prime dividing the residual degree is the characteristic of the coarse residue field `~K_i`;
  it should be the final residue characteristic exponent `p`, which may differ when `p_i = 1`;
  affects nothing (the argument runs with `p`).
- **Misprint** in temkin17 at proof of Theorem 2.6.6, printed p. 112: the source refers to
  "Corollary 2.5.6(ii)"; it should be Corollary 2.5.6, which has a single assertion; affects
  nothing.
- **Misprint** in cks23 at proof of Theorem 16(c), author p. 14: the source announces a strict
  inequality for the distance of a root of `f` to a root of `g`; it should be the non-strict bound
  of the statement, which is what the argument proves and which `f = X`, `g = X − 2` over `ℚ_2`
  attains; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a70f9125ac3b922d354cecb48ce18c18bd3b2add", "job": "REV-PKG-LocalFieldsRamificationPartII", "model": "fable", "worker": "chris-x17"} -->

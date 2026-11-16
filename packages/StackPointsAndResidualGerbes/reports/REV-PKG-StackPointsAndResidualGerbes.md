<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17723#issuecomment-6903669834 -->
Review (claude) of 389b5af

Verdict: accepted
Conditional on the announced gaps: `stack-morphism-permanence`, `flat-lfp-open`, `inertia-of-presentations`, `stack-separation-axioms`, `quasi-dm-flat-presentation`, `flat-groupoid-quotients`, `decent-algebraic-spaces`, `decent-space-schematic-locus`, `reduced-scheme-residue-field-factorisation`, `group-spaces-over-fields`, `quasi-finite-over-fields`, `isomorphism-fpqc-local-spaces`, `generic-flatness-spaces`, `reduced-regular-smooth-local`, `algebraic-stacks-satisfy-rs`, `homogeneous-quotient-scheme`

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. The acceptance is conditional on the 16 declared supplier gaps (listed under "Suppliers,
gaps and order"). There is no previous review of this package and no maintainer note.

Files reviewed: `packages/StackPointsAndResidualGerbes/README.md` (2085 lines, 8 layers, 38
subsections), `Suggested.lean` (57 lines, no declaration), `metadata.toml`, `sources.toml` (25
entries). Pins read from the content repository's `lake-manifest.json`: Mathlib
`1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

## Verified sound

### 1. Principles

- General library, no shortcut: statements are at the generality of their sources or wider, with
  each widening argued and tested (6.2 without the Noetherian and finite type hypotheses; 6.4 and
  7.2–7.4 without quasi-separatedness, smooth stabiliser or algebraically closed `k`; 7.4 for
  non-affine `G`). Each has a Check on an instance outside the narrower statement.
- Existing work is built on: gerbes on a site, framed deformations, quotient stacks, `|𝒳|`,
  inertia and `QCoh` are imported by roadmap and section; nothing of SchemeAndStackFoundations,
  AlgebraicModuliForArithmeticGeometry or ReductiveGroups is planned again.
- One direction of supply: dependency check clean (below).
- No copied passage, no algorithm, no sorry'd data, no `set_option` (the Lean file has no
  declaration and no option).
- Untrusted text: nothing in the files read asked for an action.

### 2. Sources: the seeded sample

All 15 sampled targets were read against the cached texts at the cited lines. Every lemma number,
line range and hypothesis agrees.

| Target | Locators opened | Result |
|---|---|---|
| 0.1 | stacks-04XE lines 625–653 (Lemma 100.7.1, Definition 100.7.2), 654–665 (Remark 100.7.3: items (1) locally Noetherian, (5) reduced, (8) regular) | agrees; four equivalent conditions and the scheme/space clause as stated |
| 0.3 | stacks-04XE lines 765–776, 780–801, 804–851, 853–859, 865–868, 872–894; stacks-06RD lines 3551–3556 | agrees; Lemma 100.9.6 has "Proof. Omitted", as the README says; Lemma 101.35.4 shows étale, as the README says |
| 0.4 | stacks-sheaves-on-stacks lines 953–955 (Proposition 96.14.3), 1068–1073 (Lemma 96.15.1 (1)–(3): "right exact but not exact in general" is item (3), line 1072); ahr2020 lines 248–252 | agrees; the indexing by `ℐ^{n+1}` is the source's |
| 1.2 | stacks-04XE lines 341–350, 399–423; stacks-06RD lines 1593–1601 (Lemma 101.18.6) | agrees |
| 1.4 | stacks-06RD lines 1675–1689 (Lemma 101.19.1, six cases; proof through Lemma 6.1, More on Groupoids in Spaces 9.4 and 10.3, Spaces over Fields 10.8) | agrees with the statement, the route and gap:group-spaces-over-fields |
| 2.5 | stacks-06QB lines 2821–2826 (Proposition 101.28.11), 2862–2865 (Lemma 101.28.13), 2876–2877 (Lemma 101.28.14: `Δ_𝒳` quasi-compact ⇒ `Δ_𝒴` quasi-compact) | agrees, direction included |
| 3.2 | stacks-06ML lines 1199–1213 (Lemma 100.11.4), 1214–1237 (Lemma 100.11.5) | agrees; `R = U ×_𝒵 U`, Theorem 97.17.2 and Lemma 94.16.1 are the inputs the gaps name |
| 3.4 | stacks-06ML lines 1312–1337; stacks-06RD lines 452–456 (Lemma 101.4.16), 4831–4839 (Lemma 101.51.1); stacks-06QB lines 2846–2849 (Lemma 101.28.12); stacks-decent-spaces lines 1500–1540 | agrees |
| 3.5 | stacks-06ML lines 1338–1351, 1352–1368 | agrees |
| 4.1 | stacks-06RD lines 1609–1625 (Lemma 101.18.7 and the start of its proof: affine `U`, closed `u`, `R = u ×_𝒳 u`) | agrees |
| 4.2 | stacks-06RD lines 3059–3066 (Lemma 101.31.2 through Theorem 101.21.3); stacks-decent-spaces lines 1500–1512 (`U' = ⊔ Spec κ(u)`, `R' = U' ×_X U'`) | agrees |
| 4.4 | stacks-06RD lines 3096–3129 (Lemma 101.31.3: Noetherian affine chart, `u` with closure meeting `E` in `u`, `R' = p⁻¹(Z)`, Lemma 78.25.1) | agrees with the route as restated |
| 4.5 | stacks-06RD lines 4866–4869 (Remark 101.51.3), 4870–4878 (Lemma 101.51.4, through Lemmas 101.17.4–101.17.5) | agrees |
| 6.1 | stacks-06RD lines 1617–1625; stacks-06ML lines 1219–1232, 1363–1368; stacks-06QB lines 2775–2788 (Lemma 101.28.10 (3)) | agrees |
| 6.2 | alper-moduli lines 16541–16549 (Exercise 7.4.40 (1): Noetherian stack, finite type point) | agrees; the README states the source's two extra hypotheses and drops them with a route (2.1, 2.2, full faithfulness) and two Checks |

Further locators opened outside the sample, all agreeing: stacks-04XE lines 142–148 and 200–206
(Convention 3: items (1), (2), (31)), 707–730 (Definition 100.8.1, Lemmas 100.8.2–100.8.4), 1073–1075,
1453–1456; stacks-06ML lines 1135–1137, 1149–1153, 1178–1181, 1238–1256, 1260–1271, 1288–1310;
stacks-06RD lines 445–451, 591–596, 1527–1528 (Lemma 101.17.8, no hypothesis on `g`), 1545–1548,
1567–1592, 3048–3056, 3335–3338, 3351–3352, 4686–4735, 4786–4812, 4842–4865; stacks-06QB lines
2613–2627, 2664–2671, 2696–2724, 2893–2897, 2919–2925, 2943–2953; stacks-morphisms-spaces lines
904–905; stacks-decent-spaces lines 1542–1552, 1604–1616; ahr2020 lines 475–486; alper-moduli lines
6955–6957, 6983–6987, 6996–6999, 7017–7025, 16528–16540; rydh2011 lines 1236–1245, 1268–1277;
sga3-vi-a lines 871–894. No locator was flagged by the author as unverified.

### 3. Adversarial pass

Values were computed by hand; there is no Lean statement to instantiate. Rows cover the sampled
targets, the headline theorems and the conventions with a witness.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 smooth-local properties | `Bμ_p/𝔽_p`; `[Spec k[t]/(t²)/𝔾_m]`; `Spec k[x,y]/(xy)` | atlas `𝔾_m → 𝔾_m/μ_p`: base change to `Spec 𝔽_p` is `𝔾_m`, smooth, so `Bμ_p` regular although `μ_p = Spec 𝔽_p[λ]/(λ−1)^p` has length `p`; atlas `k[t]/(t²)` has nilpotent `t`; node reduced, `dim 𝔪/𝔪² = 2 > 1` | holds; wrong model (flat atlases) excluded | none |
| 0.2 rigidity `T → Spec k` mono ⇒ iso | `Spec k → Spec k[ε]`; `Spec ℚ̄ → U/G` | first: mono, target not a field, not iso; second: `U ×_X Spec ℚ̄ = G × Spec ℚ̄` discrete, `U` profinite not discrete | field hypothesis needed and present | none |
| 0.3 presentation bijection, open substacks | `[𝔸¹/𝔾_m]`; `Spec k ⊔ Spec k`; `Spec k(t) → 𝔸¹` | invariant subschemes `{0}`, `𝔾_m`; two equal-up-to-equivalence open substacks distinct as substacks; `{η}` complement not closed | holds; uniqueness is equality of substacks | none |
| 0.4 ideals and `𝒳^{[n]}` | `𝔸¹`, origin, `n = 0,1,2`; `Spec k[ε]`; `Spec(k × k)` | lengths `1,2,3` (indexing by `ℐⁿ` gives `0,1,2`); `ℐ² = 0` so `𝒳^{[n]} = 𝒳` for `n ≥ 1`; naive kernel over the origin is `0` but `(t) ⊗ k = k·t`, dimension 1; split case kernels agree (`0 × k`) | holds; `(ℐ^{n+1})² = ℐ^{2n+2} ⊆ ℐ^{n+2}` for `n ≥ 0` | none |
| 0.5 reduced induced substack | `Spec k[ε] → 𝔸¹`, `t ↦ ε` | image `{0}`, no factorisation through `Spec k` (`ε ≠ 0`) | reduced-source hypothesis needed and present | none |
| 1.1 finite type points | `Spec ℤ_(p)` generic; `𝔸¹_k` generic; `Spec ℚ̄ → Spec ℚ` | `ℚ = ℤ_(p)[1/p]` finite type; `K` finite over Jacobson `k[t]` would make `k[t]` a field, and `1/t` integral gives `1 ∈ (t)`; `[ℚ̄:ℚ] = ∞` | iff holds both ways on the instances | none |
| 1.2 `π₀ 𝒳(k) → |𝒳|` | `B(ℤ/2)_ℝ`; `Spec ℚ(i)`; `𝔸¹_ℝ` | 2 classes ↦ 1 point; `a = σ, b = id` gives `σ∘id = id∘σ`, while one embedding gives `ι ≠ ι∘σ` (`ι(i) ≠ −ι(i)`); `t²+1` not in the image | not injective, not surjective, two embeddings needed | none |
| 1.4 `G_x` a scheme | `B(𝔸¹/ℤ)`, char 0; `Bℤ`; `B𝔾_m` | diagonal pulls back to `⊔_n {y = x+n}`: infinitely many lines, dense, misses the generic point of `𝔸²`, so neither quasi-compact nor locally closed; `G_x = ⊔_ℤ Spec k` étale not finite; `𝔾_m` a scheme though not quasi-finite | six cases sufficient, a hypothesis needed | none |
| 2.4/2.6 inertia criterion, dense open gerbe | `[𝔸¹/𝔾_m]`; `[Spec k[ε]/𝔾_m]`; Example 101.29.2 | fibres `𝔾_m` over 0 and trivial over 1: not flat; stabiliser `k[ε][λ^{±1}]/((λ−1)ε)`, `(λ−1)·ε = 0` with `λ−1 ∉ εB`: not flat; stratum `x₀ ≠ 0` has `t x₀ = x₀ ⇒ t = 1` | holds; reducedness needed | none |
| 2.5 diagonal criterion | `Spec k → B𝔾_m`; `Spec k → Spec k[ε]`; `Bℤ → Spec k` | diagonal = unit section of `𝔾_m`, not flat; universal homeomorphism, not flat; `Δ_{Bℤ}` pulls back to `⊔_ℤ Spec k` while `Δ_{Spec k}` is quasi-compact | iff and the one-way lemma consistent | none |
| 3.2 rigidity | `Spec k → BG`, `G ≠ 1`; `Spec ℚ̄ → U/G` | `Spec k ×_{BG} Spec k = G ≠ Spec k`: not mono; target has no flat finitely presented point (ideal of `a⊗1 − 1⊗a` not finitely generated) | both hypotheses needed and present | none |
| 3.4 properties | node; `Spec ℚ(t)/ℤ`; `[𝔸¹/𝔾_m] → Spec k` | `𝒵 = Spec k` regular; base `X` itself, and an étale `Spec ℚ(t) → Spec F` would make `ℤ × Spec ℚ(t)` finite; pullback is the whole stack (2 points) | holds; gerbe hypothesis needed | none |
| 3.5 functoriality | `Spec k → BG`; `BG → Spec k`, `G = ℤ/2, μ_p, 1` | products `Spec k` vs `G`: 1 vs 2 points; lengths 1 vs `p`; equal for `G = 1` | criterion discriminates in both directions | none |
| 4.1 (headline) | `[𝔸¹/𝔾_m]` at 1; `𝔸¹` generic; `Spec ℤ_(p)` generic | open immersion; `Spec k(t) → 𝔸¹` exists, not locally of finite type; `Spec ℚ` finite type | three conditions agree | none |
| 4.2–4.4 (headline) | `Bμ_p`; `𝔸¹_ℚ/ℤ`; `Bℤ`; `B(𝔸¹/ℤ)`; `Spec ℚ(t)/ℤ`; `U/G` | each falls under at least one case and outside another (`Bμ_p` quasi-DM not DM; `Bℤ` gerbe, inertia not quasi-compact; `U/G` not locally Noetherian, finite type point) | cases independent | none |
| 4.5 (headline) | `[𝔸¹/𝔾_m]`; a DVR; `U/G` | `B𝔾_m` closed, `Spec k` open not closed; `Spec R/𝔪` closed, `Spec K` open; `Spec ℚ̄ → U/G` closed point, not a closed immersion (else equal to reduced `X`) | Noetherian hypothesis needed and present | none |
| 5.3 (headline) residue field | `[Spec ℂ/(ℤ/4)]/ℝ`; `Spec ℚ(t)/ℤ` | `H¹(ℝ, ℤ/4) = Hom(ℤ/2, ℤ/4) = {0, 1↦2}`, both ↦ 0 in `Hom(ℤ/2, ℤ/2)`, so no real object, `κ = ℝ`; non-decent base not a field | decency needed and present | none |
| 5.4 (headline) algebraicity | `[𝔸¹/𝔾_m]`; two copies of `Spec k[x₁,…]` glued along `⋃D(xᵢ)`; `𝔸¹_ℚ/ℤ` | finite unions of `D(xᵢ)` miss `(x_{i₁},…,x_{iₙ})`: diagonal not quasi-compact, first statement still applies; `P(t+n) − P(t)` has `t^{d−1}`-coefficient `d·n ≠ 0`, so no finite stable set | both statements separated; hypotheses needed | none |
| 5.5 fppf image | `Spec κ(t) → Spec κ`; `Spec k̄ → BG_k` | a `κ`-map from `κ(t)` or infinite `k̄` to a finite extension of `κ` is injective of infinite into finite dimension: none | iff holds | none |
| 6.1 | `BG`; `Spec κ` with Galois `k/κ` | `R_x = G`, equal projections; `R_x = Γ × Spec k`, distinct projections, stabiliser trivial | holds | none |
| 6.2/6.3 (headline) | `BG_k`, `G = ℤ/2, μ_p, 1`; generic point of `𝔸¹`; `(t,−1)` over `ℚ(t)` | three products: `BG`, `Spec k`, `G` (order-2 gerbe, 1 point, 2 points); `Spec K = B1` both sides; residue of `(t,−1)` at `t = 0` is `−1 ∉ ℚ^{×2}`, `(t²,−1)` split, `σ : t ↦ t²` not onto | holds; identity condition on `κ(x) → k` needed | none |
| 6.4 (headline) | `Bμ_p/𝔽_p(t)`; `Spec k → Spec κ` finite nontrivial; `Spec k[x₀,…]` | `𝒵 = Bμ_p`; `𝒵 = Spec κ ≠ Spec k`; origin of finite type, ideal not finitely generated | section condition needed; no finiteness of `𝒳` needed | none |
| 7.3 (headline) | `[𝔸¹/𝔾_m]`; `Bμ_p`; `[𝔸¹/μ_p]`; cusp | `dim T_{BG} = (n² − dim G) − (n² − dim Lie G)`: 0; `1 − 0 = 1` with `T = {1+aε}`, `N = 0`; `2 = 1 + 1`; `2 = 2`, `θ = id` | exact sequence and the iff hold on all four | none |
| 7.4 | `SL₂` on binary quadrics at `uv`; `E × 𝔾_m` on `E × 𝔸¹`; `ℤ` on `(ℤ × 𝔸¹) ⊔ 𝔸¹` | disc `b² − 4ac = 1`, `d(disc) = 2 db ≠ 0`, orbit dim `3 − 1 = 2`, `N` trivial of dim 1; `N = k·∂_t` weight 1; `N = ℚ·∂_t`, stack not quasi-separated | holds beyond the source's hypotheses | none |
| Convention 5 (action) | `[𝔸¹/𝔾_m]`, `λ·t = λt` | function `t` weight `−1`, `I/I²` weight `−1`, `N` and `T` weight `+1`; right action would give `−1` on `T` | consistent in 7.2, 7.3 and with AlgebraicModuliForArithmeticGeometry §8.3 (`α ∘ g`) | none |
| Convention 6 (indexing) | `𝔸¹`, origin | `𝒳^{[0]} = 𝒵`, `𝒳^{[1]}` length 2; same in 0.4, 7.1 and SchemeAndStackFoundations §4.8 (`V(I^{n+1})`) | consistent | none |

Self-consistency: the recurring examples (`[𝔸¹/𝔾_m]`, `Bμ_p`, `U/G`, `Spec ℚ(t)/ℤ`, `𝔸¹_ℚ/ℤ`,
`[Spec ℂ/(ℤ/4)]`, `Bℤ`) take the same values in every section that uses them (0.1–0.5, 1.1–1.4, 2.x,
3.1–3.5, 4.1–4.5, 5.1–5.5, 6.1–6.4, 7.1–7.4, worked examples); no Check contradicts a theorem.
Proof routes: every step taken from inside a source's proof (4.2, 4.4, 5.2, 6.1) was opened at
the cited lines; the two steps the source omits (5.2: Noetherianity of the reduced closed substack
and of the base of a gerbe) are supplied in the README from 0.5 and 0.1 with 2.3.

### 4. Duplication audit

- Pinned libraries: `TauCeti/AlgebraicGeometry/Stack/` holds only `Basic.lean` (the abbreviation
  `SchPseudofunctor`, line 37); a search of both pinned libraries for `IsAlgebraicStack`,
  `AlgebraicStack` and an inertia stack finds nothing. No target is already proved at the pins.
- Roadmaps on main and open heads, by object (`residual gerbe`, `closed substack`, `reduced
  induced`, `finite type point`, `decent stack`, `normal space`, `infinitesimal neighbourhood`):
  no roadmap on main or in an open pull request defines these for algebraic stacks. Users of
  particular closed substacks (ModularCurvesPartII, LocalGaloisDeformationRings,
  HeckeStacksAndLocalShtukas and others) define none.
- `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, none
  is defined only by an open revision, no second copy (the roadmap is not on main).
- Two facts for the humans (last section): a board package later in the merge order restates
  0.3–0.5 for Deligne–Mumford stacks, and an open roadmap addresses the worked example's statement
  to another supplier.

Overlap check: read SchemeAndStackFoundations (main), AlgebraicModuliForArithmeticGeometry (main), EquivariantIntersectionTheory (main), VirtualFundamentalClass, GroupSchemesOverABase, NashBlowups, FunctionFieldArithmeticPartII (open); nothing shared with a roadmap on main or an open one; quotient stacks, `|𝒳|`, inertia and `QCoh`: SchemeAndStackFoundations; gerbes on a site and framed deformations: AlgebraicModuliForArithmeticGeometry; closed substacks, residual gerbes, `N_x`: this roadmap.

### 5. Suppliers, gaps and order

    depcheck: 236 roadmaps, 2241 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The roadmap is at line 37 of `merge-order/ORDER.txt`, after its
last supplier AlgebraicModuliForArithmeticGeometry (line 36); ReductiveGroups and
SchemeAndStackFoundations are on main. The four consumers named are later (lines 87, 365, 407, 423).

Citations resolved now, on main:

- SchemeAndStackFoundations: headings §§1.2, 1.7, 1.8, 1.9, 1.12–1.23, 4.8, 4.12, 4.13 exist; the
  50 contract names searched occur in the cited sections (for example `points_atlas_surjective` and
  `opensEquiv` in §1.7, `LocallySeparatedSpace` in §1.9 with "immersion", `Groupoid.restrict` and
  `stabilizerAt` in §1.14, `.iff_unramified_diagonal` in §1.19, `.pullbackSurjective`,
  `.baseChangeImage`, `.atlasOpenSurjective`, `QuasiCompactStack`, `stack_presentation` in §1.20,
  `actionQuotient.torsorEquiv` and `quotientStack_algebraic` (groupoid schemes) in §1.21,
  *QCoh.presentationEquiv* and *QCoh.pushforward* in §1.22, `toModuliSheaf` in §1.23, `toScheme n :
  V(I^{n+1}) → X` in §4.8, `generic_flatness` over an integral base in §4.12). The three Checks
  the README cites (§1.7 generic point of `𝔸¹_ℚ/ℤ`, §1.21 `B(ℤ/2)(ℝ)`, §1.22 `QCoh(BG)`) exist.
- AlgebraicModuliForArithmeticGeometry: §4.1 (`IsGerbe`, `IsGerbe.equivalence_iff`, `relativeGerbe`,
  `relativePullback`, `relativeComposition`, `relativeDescent`; descent asks local essential
  surjectivity, as 2.1 uses it), §8.1 (`deformationGroupoid`, `deformationFunctorOfPoint`,
  `stabiliserActionOnDeformations`), §8.3 (`FramedDeformation` with new frame `α∘g`,
  `framedDeformation_twoFibre`, `framedTangent_exactSequence`, whose six-term sequence gives the two
  three-term sequences of 7.3 with `Z = Spec k`).
- ReductiveGroups: Layers 1, 3 (quotient first an fppf sheaf, representability a theorem with
  hypotheses) and 3A (algebraically closed field) are as the README describes.
- The 9 leads of `scratch/citations.md` are supplier names that exist on main under their parent
  (for example `Groups.GroupSpace` at SchemeAndStackFoundations README line 3243); none is missing.

Library declarations: all 24 Mathlib names of the contract elaborate under `#check` at the pin
with the types the README describes (Noetherian hypothesis in
`isReduced_of_flat_of_isLocallyNoetherian` and `iff_locallyOfFiniteType`; `[FormallySmooth R P]`
in `iff_split_injection`; no smoothness in `retractionKerCotangentToTensorEquivSection`; the
instance `DescendsAlong @Etale (@Surjective ⊓ @Flat ⊓ @QuasiCompact)` is found by
`inferInstance`), and every cited line number holds the declaration. The 17 Tau Ceti names were
opened at the cited file and line with their enclosing namespace: all present, with the stated
hypotheses (`IsRegular` extends `IsLocallyNoetherian`; `of_flat_of_surjective` needs
`[IsLocallyNoetherian Y]`; `exists_isClosedImmersion_generalLinear` needs local finite type;
`smooth_iff_finrank_lie_eq_ringKrullDim` needs only `Algebra.FiniteType`; `Coinvariants.lean:219,
255, 268` and `GeneralLinear.lean:56` are the representability results the README names).

Gaps: the 16 slugs of `design/plan.json` and the 16 `What <Supplier> must provide (gap:…)`
paragraphs of the README are the same set (checked by script); every `gap:` used in a `*Needs:*`
line is declared; each names a supplier and section. Minimality: SchemeAndStackFoundations on
main has no decent space, quasi-DM, Lemma 101.27.15, 101.5.1, 101.5.7, 101.21.3, 97.18.3,
94.16.1, 29.59.x, 68.10.2, 72.10.8, 72.10.9, 74.11.15, 67.32.1, 35.18.1, 74.9.x, 101.17.5 or
101.6.1; AlgebraicModuliForArithmeticGeometry §8.1 assumes (RS) and does not prove it for
algebraic stacks; ReductiveGroups Layer 3 says no representability of `G/H` is a premise. The
compound form of some gaps was settled in the design rounds and is not reopened.

Conditional gaps: stack-morphism-permanence, flat-lfp-open, inertia-of-presentations,
stack-separation-axioms, quasi-dm-flat-presentation, flat-groupoid-quotients,
decent-algebraic-spaces, decent-space-schematic-locus, reduced-scheme-residue-field-factorisation,
group-spaces-over-fields, quasi-finite-over-fields, isomorphism-fpqc-local-spaces,
generic-flatness-spaces, reduced-regular-smooth-local, algebraic-stacks-satisfy-rs,
homogeneous-quotient-scheme.

### 6. Shape and completeness

- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, Layers 0–7 each ending with Examples and Dependencies, Downstream consumers, Worked
  examples, References.
- Checks: 38 subsections, 38 `**Checks.**` lists, each with 3 to 6 bullets (counted); each names
  the wrong model it excludes.
- Dependencies: every layer's Dependencies paragraph was compared with the union of its `*Needs:*`
  lines (sections, library names and gaps): they agree, and "How to read the build" states the
  same layer graph (1 and 2 on 0 only; 3 on 0, 2; 4 on 0–3; 5 on 0, 2–4; 6 on 0–5; 7 on the nine
  listed subsections).
- Organisation: the layers are worked back from the end theorems and none is named after a source
  chapter. "Layer 4 proves its existence in each case the Stacks Project treats" describes
  coverage, not arrangement; the Summary lists the five cases by their mathematics.
- Style: no LaTeX delimiters, no process words, pull-request numbers, dates, anchors or machine
  paths (searched); own names are in italics and Convention 10 says `Suggested.lean` declares none,
  so no backticked name claims a declaration.
- Lean form: `lake env lean` on `Suggested.lean` exits 0 with no output (no warning, no `sorry`).
  One module docstring with the required title and statements, `import Mathlib` only, namespace
  `TauCetiRoadmap.StackPointsAndResidualGerbes`, no declaration. The `module` header is the form 93
  of the 223 `Suggested.lean` files on main use.

### 7. Headline theorems and padding

Headlines of the README Summary: finite type points (1.1, 4.1); existence of residual gerbes
(4.2–4.4); the residual gerbe over its residue field and `𝒵_x ×_{κ(x)} k ≃ BG_x` (5.3, 6.2, 6.3);
rational points (6.4); closed points (4.5); the tangent–normal sequence (7.3). The docstring names
these and two more (2.4/2.6, 5.4) as not statable, with the missing carriers. Checked at the pin:
there is no algebraic stack, 2-fibre product, representable morphism, inertia, `|𝒳|` or quotient
stack, so none is statable without a long encoding of objects SchemeAndStackFoundations owns.
Nothing is stated in their place. With zero declarations the one-tactic probe and the `#check`
binder comparison have nothing to test.

### 8. Copyright, licences and scope

- Wording: 48 passages were set beside the README (the sample and the further locators above,
  including five prose passages: Convention 6 against ahr2020 lines 248–252, 7.2–7.4 against
  ahr2020 lines 475–486, 5.4 against rydh2011 lines 1268–1277, 5.5 against rydh2011 lines 1236–1245,
  5.2's three reductions against stacks-06RD lines 4850–4865). No sentence is reproduced or
  followed clause by clause; the longest shared runs are standard phrases ("flat and locally of
  finite presentation", "the following are equivalent").
- Arrangement: the Morphisms of Algebraic Stacks chapter (stacks-06QB, stacks-06RD) has 52 of 135
  line locators. Its contents (52 sections) were read: Layer 1 draws on §§18–19, Layer 2 on §§28–29
  and 33, Layer 3 on Chapter 100 §11 with §§4, 28, 51, Layer 4 on §§18, 28, 31, 51, Layer 5 on
  §§48, 50, 51 with rydh2011, Layers 6–7 on other sources. No one-to-one run. Within Layer 0,
  0.1, 0.2, 0.3, 0.5 touch Chapter 100 §§7–10 in order: 0.3 needs 0.1 and 0.2, 0.5 needs 0.1 and
  0.3 (their `*Needs:*` lines), and each has wider scope than its section (0.2 adds 67.10.8,
  101.5.6, 101.4.15; 0.4 has no counterpart).
- Reuse: no table, figure or exercise list is taken over; the Lean file has no declaration.

Source independence: 48 passages compared with 9 sources, none shared; largest share Morphisms of Algebraic Stacks (stacks-06QB, stacks-06RD), 52 of 135 locators; contents compared with stacks-06RD: independent.

## Not verifiable

- `lmb2000` and `olsson2016`: settled as uncertified; cited by locator only, and no statement
  rests on either.
- The Tau Ceti names were not elaborated with `#check`: the object files of those modules are not
  built in this checkout. They were verified by reading the declarations at the pinned sources.
- VirtualFundamentalClasses and MotivicStructuresInModuliOfCurves were read in the board checkout
  (their cited section headings §1.2, §§7.3, 8.4, 8.6 exist there); their own pull-request heads
  were not read.

## Source issues

- **Gap** in stacks-04XE at Lemma 100.9.6, printed page 17: the source says the proof is omitted; it should derive the statement from the presentation description of Lemmas 100.9.7–100.9.8 and the quotient topology; affects nothing.
- **Gap** in stacks-06RD at Lemma 101.51.1, printed page 101: the source says reducedness and local Noetherianity pass to the smooth base change with details omitted; it should cite smooth-locality, Properties of Stacks Lemma 100.7.1; affects nothing.
- **Gap** in stacks-06RD at Lemma 101.51.2, printed page 102: the source says the reduced closed substack and the base of the gerbe stay locally Noetherian, details omitted; it should cite Lemmas 101.17.4–101.17.5 and 101.33.8 with 100.7.1; affects nothing.
- **Error** in lmb2000 at Définition 11.2 (not read; reported at rydh2011 lines 1236–1245): the source says the fppf image of a representative does not depend on the representative; it should restrict to fields finite over the residue field; affects a stated result.

## For the human reviewers

- **Ownership.** `packages/VirtualFundamentalClasses/README.md` lines 508–523 define closed substacks, their presentation bijection and the reduced induced substack without citing this roadmap, which owns them (0.3–0.5) and is earlier in the merge order; only that package can change.
- **Ownership.** FunctionFieldArithmeticPartII (open, README line 53) addresses gap:zero-dimensional-dm-residual-gerbes to SchemeAndStackFoundations, without the quasi-compact diagonal; this README's worked example proves the statement with that hypothesis.
- **Licence.** `alper-moduli` is an author's draft of lecture notes (manifest `licence_class = "author-page"`), cited for eight line locators, each beside a Stacks Project or journal locator.
- **Licence.** `sga3-vi-a` was read in the editors' online re-edition (`author-page`), not the printed volume; it supports one gap.
- **Manifest.** `sources.toml` gives each of two Stacks Project chapters two keys (`stacks-04XE`/`stacks-06ML`, `stacks-06QB`/`stacks-06RD`, same `sha256`), and records `rydh2015`, which the README does not cite.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "389b5af7b1739f7d5ee4021b36d5be3d574ad73d", "job": "REV-PKG-StackPointsAndResidualGerbes", "model": "fable", "worker": "chris-x88"} -->

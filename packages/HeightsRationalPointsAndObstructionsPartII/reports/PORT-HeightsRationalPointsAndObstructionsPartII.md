# PORT-HeightsRationalPointsAndObstructionsPartII

Branch `roadmap/heights-rational-points-and-obstructions-part-ii`, head commit `ac9e370`
(`HeightsRationalPointsAndObstructionsPartII: roadmap (README, Suggested.lean, metadata)`), on top of
main `c9a16a0`. Files: `TauCetiRoadmap/HeightsRationalPointsAndObstructionsPartII/{README.md,
Suggested.lean, metadata.toml}`; nothing outside the folder was touched.

## Build

`lake build TauCetiRoadmap.HeightsRationalPointsAndObstructionsPartII.Suggested`, final run on the
committed file:

```
⚠ [8966/8966] Built TauCetiRoadmap.HeightsRationalPointsAndObstructionsPartII.Suggested (4.7s)
Build completed successfully (8966 jobs).
```

Warnings: 3, all `declaration uses `sorry`` (lines 61, 79, 100: the three headline theorems). No
other warning, no error.

## Gate

```
gate HeightsRationalPointsAndObstructionsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency direction (`gate --depcheck … --movable --content …`):

```
depcheck: 233 roadmaps, 2148 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap sits at line 324 of `ORDER.txt`, after every
supplier it names (the latest are ArakelovGeometryAndAbelianHeightsPartII at 323 and
ArithmeticDynamics at 321).

## Draft pull request body

Uniformity for small points and for Mordell–Lang on subvarieties of abelian varieties, extending
HeightsRationalPointsAndObstructions where its Layer 5 stops (qualitative finite-rank Mordell–Lang,
Bogomolov over number fields and equidistribution on a fixed abelian variety). The roadmap builds,
in thirteen layers, the degree bookkeeping and restricted Hilbert families over the level-four
Siegel moduli space, Dimitrov–Gao–Habegger's height inequality for non-degenerate subvarieties
(the geometric level case, compared with the adelic export), Kühne's equidistribution in families
and the uniform Bogomolov theorem of Gao–Ge–Kühne, the new gap principle, Rémond's quantitative
Vojta–Mumford counting under the packing hypothesis, Masser specialization and the uniform
Mordell–Lang theorem over every algebraically closed field of characteristic zero, the geometric
Bogomolov conjecture over polarized function fields (Gao–Habegger over curves in characteristic
zero, Xie–Yuan in every characteristic through descent along intersecting constant fields and
Yamaki's reduction), Yuan's adelic potential-bigness route to the relative Bogomolov theorem for the
five curve-family maps and his uniform Bogomolov-type bound for curves over all global fields, and
DeMarco–Krieger–Ye's bielliptic genus-two family as a worked dynamical case. Its end theorems are
uniform Manin–Mumford and uniform Mordell–Lang for curves with a constant depending only on the
genus, and the degree-free bound on rational points of a curve of genus at least two over any
number field; `Suggested.lean` states these three against the native Albanese property and the
point group of an abelian variety.

Written with Claude (Fable 5.1) from the accepted package; the author selected the scope and
checked the mathematics, the signatures, the supplier citations and the sources.

## Suppliers that are still pull requests (or board packages)

Cited by name and section, never by number:

- HeightsRationalPointsAndObstructions (the parent; pull request), ArakelovGeometryAndAbelianHeights,
  AbelianSchemesAndArithmeticModuli, AbelianSchemesAndArithmeticModuliPartII, JacobianChallengePartII,
  PELModuli, AlgebraicModuliForArithmeticGeometry, ComplexComparisonPartII,
  NeronModelsAndSemistableAbelianVarieties, InverseGaloisAndArithmeticFundamentalGroups,
  TropicalAndBerkovichArithmetic, ArithmeticDynamics: all open pull requests; every cited section
  label was found at the head (`roadmaps show --pr`), and the resolver lists none of them.
- ArakelovGeometryAndAbelianHeightsPartII and StableReductionPartII are accepted board packages
  without a pull request (lines 323 and 299 of the merge order). The resolver reports them as "no
  roadmap … on main or in an open pull request"; that is the only resolver output and is not a
  defect. Their citations were mapped to the *package* READMEs (see "Supplier replacements").
- On main: SchemeAndStackFoundations, ClassicalArithmeticCompletion, AlgebraicCurves,
  JacobianChallenge. The labels "AlgebraicCurves Layers 10–11" and "JacobianChallenge Layer F" are
  those roadmaps' own layer headings.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already satisfies the acceptance-test rule: three headline
theorems with `sorry`, no definitions, no examples, no sorry'd data, no `set_option`. The only
Lean change is the line `@[expose] public section` after the module docstring (the file uses the
`module` header, as CoboundaryExpansion and FlagVarieties on main do), so that the three theorems
are exported to importing files; without it the `#check` scratch below could not see them.

Signature check: a scratch file importing the built module with `#check @name` for all three
declarations elaborated once (`lake env lean`, exit 0). The three elaborated types are identical to
the worker's `signatures.md`; every binder the README statements need is present (`[IsAlgClosed F]
[CharZero F]` for §§3.6 and 6.8, `[NumberField F]` for §6.12, smoothness, properness, geometric
integrality, Krull dimension one, `IsAlbanese x₀ a`, `J.dim = g`, the division-hull rank bound
with `0 < n`). Nothing changed.

## Supplier replacements and label mapping

- ArakelovGeometryAndAbelianHeightsPartII: the package cited the design numbering; the accepted
  package README renumbers it. Mapped by title: §0.5 (Siu) → §0.3; §§4.7–4.9 → §§4.6–4.8
  (Yuan–Zhang height inequality §4.7, fundamental inequality §4.8); §§5.1–5.5 → §§5.1–5.4
  (invariant extension §5.1, non-degenerate subvarieties §5.2, height inequality and
  equidistribution §5.3, adelic Hodge bundle §5.4); §§3.1–3.3, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6,
  13.1 unchanged. The design's §13.7 "Bost's lower bound" is, in the package, §13.7 "A positive
  comparison height on the relative Jacobian", which imports Bost from
  ArakelovGeometryAndAbelianHeights §6.5 (verified at the head of that pull request:
  `h_st,Fal(A) ≥ −(g/2) log(2π²)`). §11.4 now cites §6.5 for Bost and PartII §13.7 for the
  comparison height `M̄ = Θ̄ + π_J^*λ̄_S + O(c)`, with the explicit `c = (g/2)log(2π²) + 1` and the
  inequality `h_M̄(y) ≥ 2ĥ(y) + max{h_Fal, 1}`, instead of restating an unnamed `C(g)`; the section
  keeps only the universal-shift identity as its own.
- The supplier contract for §0.3 is restated for integral nef bundles (the package's (2′)) with
  the denominators cleared by the integer `q` that §2.6 already uses, instead of "rational t".
- StableReductionPartII: the package cited design labels MC.4, MC.6, MC.7 with section titles; the
  package README numbers them §4.2 (full symplectic level on smooth curves), §4.4 (rigidity of full
  curve level), §4.8 (the fine smooth full-level curve scheme), §6.3 (smooth full-level Torelli),
  §6.6 (finite Torelli fibres), §6.7 (Hodge pullback), §7.13 (export for DGH), §7.15 (export for
  Yuan). All citations now use these numbers.
- Gap contracts rendered as upstream does not carry tags: `gap:flat-nonproper-intersection` → "the
  flat non-proper intersection contract" (SchemeAndStackFoundations); `gap:arithmetic-interpolation`
  → "the arithmetic interpolation contract" (HeightsRationalPointsAndObstructions);
  `gap:controlled-polarization-embeddings` → "the controlled polarization embeddings contract"
  (ArakelovGeometryAndAbelianHeights); `gap:moriwaki-silverman-tate-nef` → "the Moriwaki
  Silverman–Tate nef contract" (ArakelovGeometryAndAbelianHeightsPartII);
  `gap:abelian-valuation-map`, `gap:abelian-canonical-measure`, `gap:strict-support-dimension`,
  `gap:nonarchimedean-small-point-equidistribution` → "the abelian valuation map / abelian
  canonical measure / strict support dimension / nonarchimedean small-point equidistribution
  contract" (TropicalAndBerkovichArithmetic). The review's conditional gap `abelian-tropical-measures`
  is the collective name of these four. The "What X must provide (…)" paragraphs keep their full
  statements; Needs and Dependencies lines name the contracts in words.
- Pinned declarations re-verified at this worktree's pins (Tau Ceti `358314d4a`, Mathlib
  `f6090c709`): `AbelianVariety` Basic.lean:95, `baseChange` :281, `IsIsogeny` Isogeny.lean:61,
  `IsAlbanese` Albanese.lean:84; Mathlib `coveringNumber` :74, `maximalSeparatedSet` :288,
  `coveringNumber_le_packingNumber` :351, `IsSeparated` :43, `EuclideanSpace` :111, `closedBall`
  :418, `addHaar_closedBall` :500, `Module.finrank` :61, `IntermediateField` :52, `Algebra.trdeg`
  :45, `Submodule.span` :46, `IsReducedRowEchelon` :87, `logHeight` :51, `Hom.group` Grp.lean:58.
  The contract's description of `coveringNumber` (closed balls `edist ≤ ε` with centres in the set,
  value in `ℕ∞`, no compactness) matches `IsCover` in Cover.lean:47 and the definition.
- Duplication sweep by object (`roadmaps grep` over main and all open heads: uniform Mordell–Lang,
  uniform Bogomolov, uniform Manin–Mumford, geometric Bogomolov, gap principle, Rémond, Betti
  map/form, equidistribution in families, Ueno locus, non-degenerate subvariety, bielliptic): no
  second owner. Hits are the parent and the named suppliers (AbelianSchemesAndArithmeticModuliPartII
  for Betti non-degeneracy, HeightsRationalPointsAndObstructions for the Ueno locus), reference
  entries for Yuan's paper (GrossZagierAndArithmeticHeights, TropicalAndBerkovichArithmetic,
  ShimuraCompactifications), Roth-type gap principles (SubspaceTheorem, EffectiveClassNumbers), and
  bielliptic curves as gonality examples (CanonicalModelsAndGonality). Nothing was removed.
  Ownership against open pull requests not in the index was not checked.

## Other README edits

- Extraction line locators ("ggk-2026 line 337, …", "yuan-2026 lines 110–118, …") removed
  throughout; theorem, equation and page locators kept. Line-only citations replaced by their
  theorem and page: `(masser-1989 lines 31–56; masser-1996 lines 124–138)` → Main Theorem and
  Scholium 1, pp. 413–414; Theorem, p. 459; `(xy-2022 lines 1014–1019)` → proof of Proposition 5.4,
  p. 26; `(yuan-2026 lines 2175–2248, 2740–2830)` → Theorem 4.2 and proof, pp. 64–67, and §4.4.3,
  pp. 81–84; `(ggk-2026 lines 377–380, p. 197)` → proof of Lemma 2.4, p. 197; yamaki-strict-support
  line 104/1836 → Theorem E, p. 3, and Corollary 7.22, p. 41. The sentence "Line locators refer to
  the numbered legal extractions" is gone (no roadmap on main carries such locators).
- Process words: "acceptance theorem" → "`Suggested.lean` states …"; "removed" → "dropped" /
  "excluded"; "round" → "stage" (§1.4 route).
- §7.1 (mathematical fix, see the pass): the subvariety height identity now carries the absolute
  normalization `a_K = [K:ℚ]` in the number-field case, matching
  ArakelovGeometryAndAbelianHeightsPartII §4.8 and the Conventions ("number-field heights are
  absolute").
- Review F01 (half-size, not quarter-size, ellipsoid copies in §5.12) was already applied in the
  package text that was ported.

## Adversarial mathematics pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions, norm and pairing | P of height 1 | ⟨P,P⟩ = (ĥ(2P) − 2ĥ(P))/2 = (4 − 2)/2 = 1 = \|P\|²; unhalved pairing gives 2 | holds | none |
| Conventions, absolute height | [2:1] over ℚ, ℚ(i) | log 2 both; relative ℚ(i)-height 2 log 2 | holds | none |
| Conventions, function-field height | [1:1/(t²+1)] over ℝ(t); over ℂ(t) with k = ℝ | coords (1, 1/(t²+1)): place (t²+1), degree 2, valuation −1 → 2; over ℂ(t): places ±i, each weight [ℂ:ℝ] = 2 → 4, divided by [ℂ(t):ℝ(t)] = 2 → 2 | holds | none |
| Conventions, level-four bundle | genus 2 Abel curve, r = 1 | deg_Θ C = 2; deg_{𝔏⁴} = 8¹·2 = 16; ĥ_{8L} = 8ĥ_L = 4·(2ĥ_L) = 4ĥ_{L⁺} | holds | none |
| Conventions, cycle vs coefficient height | [2:1]; [3:5:1] on y²z = x³ − 2z³ | FS height ½log 5 vs log 2; ½log 35 vs log 5, gap ½log(7/5) < ½log 3 | holds | none |
| §0.1 degree API | L^{⊗n}, n = 2, d = 1; product of curves | 2¹·deg; binom(2,1) = 2 → 2d² for C² (Layer 0 Examples) | holds | none |
| §0.4 packing | ρ = 0; ρ = 1, R = r, S = [−r,r]; S = ∅ | (1+2R/r)⁰ = 1; covering number 1 ≤ 3; 0; r = 0 excluded before division | holds; Mathlib `coveringNumber` is the internal one with closed `edist ≤ ε` balls, value ℕ∞ | none |
| §1.1 Check | E, L = O(3[0]), r = d = 3 | Hilbert polynomial 3n, dimension 1 | holds | none |
| §1.2 Check | generic E, level 4 | \|SL₂(ℤ/4)\| = 64·3/4 = 48; −1 acts as −I ≠ I → 24 points of H° over one unmarked pair | holds | none |
| §1.3 fibred square | E × S over a curve; multisection 2x = s | dims 3 vs 4; square splits into 4 components indexed by E[2] | holds | none |
| §1.6 Check (iii) | X_s = A_s, dim S > 0 | 2 dim_ℂ X = 2mg + 2dim S > 2mg = dim torus → degenerate | holds | none |
| §2.2 API | [2]^* | 2²θω = 4θω, matching ĥ(2P) = 4ĥ(P) | holds | none |
| §2.6 Check | E with embedding degree 4, S a point, N = 2 | deg F = deg([2]^*O(1)) = 4·4 = 16, deg M = 0; vol(F − tM) = 16 ≥ 16 − 0 | holds | none |
| §2.7 route | divide by N² | ĥ(P) ≥ (c₁ − c₀/N²)h − (c₂(N)+c₀)/N²; N² ≥ 2c₀/c₁ gives slope ≥ c₁/2 > 0; ĥ = 0 allowed | holds | none |
| §3.5 route | parallelogram law | ĥ(P−P₀) ≤ 2ĥ(P)+2ĥ(P₀) ≤ 4c₃ ≤ c″₃ when c₃ ≤ c″₃/4 | holds | none |
| §3.6 Check and Lean | D = [Q]; D = [x₀]; g = 1 | c = −a(Q), a(Q)+c = 0; c = 0; elliptic curve has infinite torsion → false for g = 1, excluded by 2 ≤ g | holds | none |
| §4.2 Check | g = 1, C = E₀ + P₀ | (C−P)^M = E₀^M for every P; counted set empty; 0 ≤ 84·0 | holds | none |
| §4.6 isogeny rescaling | n = l/g! = 2, one-dimensional exceptional component | threshold ×n² = 4; degree ×n^{2(r−1)} = 4 | holds | none |
| §4.7 two ranges | c′₁ = c′₃ = c″₃ = 1 | B = max{1, 2} = 2; c₁ ≤ min(1/2, 1/2) = 1/2 works in both | holds | none |
| §5.6 Check | X = [3]⁻¹Θ, L = 3Θ on a genus-2 Jacobian | D = 3·9·Θ² = 54; Stab = J[3], 81 points; 81 > 54 but 81 ≤ 54² = 2916; genus-2 theta curve with L = 3Θ: D = 6, X ∩ (X − c) has Θ² = 2 points ≤ 36 | holds | none |
| §5.10 Step 4 packing | radii (2c₉H)^{1/2} and (H/c₀)^{1/2} | (1 + 2(2c₉c₀)^{1/2})^{rk Γ} | holds | none |
| §5.12 constant | g = 2, D = 16·2 = 32, dim X = 1 | (4g²)¹ = 16; Q = (2³²·h₀·32)¹⁶ = 2⁵⁹² h₀¹⁶; six 2-torsion points of height 0, 6 ≤ Q; r = 0, a = 2 gives Q; exponent r/2 not r | holds | none |
| Layer 5 Examples | 3 balls, c₀ = 2, rank 1; c₁ = 1/4, c₃ = 2 | 3·2² = 12; c₀ = max{4, 2} = 4 | holds | none |
| §6.2 Check | Legendre, P = (2, μ), μ² = 2(2−λ) | λ = 2 gives μ = 0, P 2-torsion; generic μ ≠ 0 non-torsion; specialization kills 2P | holds | none |
| §6.8 Lean rank encoding | ρ = 0 (s = ∅); Γ of ℚ-rank r ≤ ρ | p^n ∈ {1} with n > 0 allows all torsion; a ℚ-basis lifted to s witnesses Γ ⊆ division hull; conversely Γ⊗ℚ ⊆ span(s) | encoding ⇔ rank ≤ ρ, no finite generation | none |
| §6.12 Lean | number field, X(F) = ∅ | encard univ = 0 ≤ B^{1+ρ}; J(F) f.g. of rank r: generators of the free part give s, torsion exponent gives n | holds | none |
| §6.9 covering | radii (c₀H)^{1/2}, (H/c₃)^{1/2}, rank ρ+1 | (1 + 2(c₀c₃)^{1/2})^{ρ+1} | holds | none |
| §7.1 subvariety height | number field K with [K:ℚ] = 2, X = Spec K, O(1) | supplier §4.8: h = L̄²/(a_K·(n+1)·deg) = 2/(2·1·1) = 1 = e₁; the package formula without a_K gives 2 ≠ e₁ (contradicts the point case) | **false for number fields as written** | added a_K = [K:ℚ] (1 for function fields) |
| §7.2 minima | X a point; dim 1 | e₁ = ĥ(x) = ĥ(X); e₁ ≥ ĥ(X) ≥ e₁/2 (Layer 7 Examples) | holds | none |
| §8.1 Check | S° = 𝔾_m, D | covers z ↦ zⁿ, n ≤ D; K_D = k(z^{1/lcm(1,…,D)}) | holds | none |
| §8.3 naive height Check | E × ℙ¹, Segre, P = (0, [T:1]) | h(P′) = 0 + log T; h_ι = 2 log T; Weil height of L′ = log T + O(1) | holds, not an identity | none |
| §9.11 numerical class | rigidified ℳ with [m]^*ℳ = m^iℳ | deg[m] = m^{2g}: m^{2g}(ℳ·ℒ^g) = m^{i+2g}(ℳ·ℒ^g) ⇒ 0 for i ≥ 1; elliptic scheme O(2·0) ≡ 2[0] | holds | none |
| §9.14 Check | Abel curve C ⊆ J, genus g | dim C_m = min(m, g), C_g = J; translate t + B of an elliptic curve: dim X_m = 1, X₂ = X₁ iff t ∈ B | holds | none |
| §9.17 Check | E × E, H₁, H₂ | H₁² = H₂² = 0, H₁H₂ = 1, L − M = H₁ nef, M·L = 1 ≤ L² = 2, (M + ½L)² = 3/2 > 0 = M² | holds | none |
| §10.1 Check | Z = {a,b,c} × C in C² | codim 1, degree 3, \|Σ\| = 3 ≤ 3^{1/1}; exponent 1/2 would give 3 ≤ √3 | holds | none |
| §10.7 Check | m = 2, each coordinate ≤ ε/4 | sum ≤ ε/2 < ε; m = 0 gives empty sum 0 | holds | none |
| §11.4 comparison height | g = 1 | c = ½log(2π²) + 1 ≈ 2.49; min h_Fal ≈ −1.32 > −1.49; h_Fal + c ≥ 1 and ≥ h_Fal; matches PartII §13.7 and AGAH §6.5 | holds | cites §6.5 for Bost, PartII §13.7 for M̄ |
| §11.7 Check | constant genus-2 C₀ over K = k(C₀), Q = η − w, NQ_N = Q, α_N = w + Q_N | ĥ(Q) = Θ·C = 2; ĥ(x − α_N) = ĥ(Q_N) = 2/N²; 2α_N − ω = 2Q_N, ĥ = 8/N²; with constant 1: 2/N² ≤ c₁(1 + 8/N²) once N² ≥ 2/c₁; d_α·2/N² ∈ ℤ_{≥1} ⇒ d_α ≥ N²/2; right side ≤ 10c₁/N² < 2/N² for c₁ < 1/5 | holds; printed constant 1 refuted | none |
| §12.2 route | lifts | ≤ 2·2 = 4 points over a common x, ≤ 4 preimages under Φ of degree 4 → 16; Stoll's curve 34 ≤ 16B₀ needs B₀ ≥ 3 | holds | none |
| Lean binders | all three theorems | elaborated types from an importing file equal the worker's signatures.md; `[CharZero F] [IsAlgClosed F]` / `[NumberField F]`, properness, smoothness, geometric integrality, dimension 1, `IsAlbanese`, `J.dim = g` all present | holds | public section added |

## Unresolved

- The two board-package suppliers (ArakelovGeometryAndAbelianHeightsPartII, StableReductionPartII)
  are cited with their package numbering; if either is renumbered again before its own port, the
  citations listed above must be mapped once more.
- The resolver cannot check those two packages and reports them as not found; everything else
  resolves. Ownership against open pull requests not in the index was not checked.
- The conditional gaps of the accepted review (`flat-nonproper-intersection`,
  `arithmetic-interpolation`, `controlled-polarization-embeddings`, `abelian-tropical-measures`,
  `moriwaki-silverman-tate-nef`) remain supplier contracts stated in the README; none is discharged
  here.
- `Suggested.lean` keeps the package's `module` / `public import` header (the form of
  CoboundaryExpansion and FlagVarieties on main); the gate's import check accepts it
  (`imports=0 mathlib-subimports=0 no-import-mathlib=0`).


Pull request: #1821 (roadmap/heights-rational-points-and-obstructions-part-ii at ac9e370)

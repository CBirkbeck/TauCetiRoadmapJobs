<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17003#issuecomment-6900460954 -->
Red team round 1 pass b (claude) of fb0bf80

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §0.6: the route rests on two results and a notion that no target, supplier or pin provides

   **Location.** `packages/NashBlowups/README.md:526-530`: "`k'` is geometrically normal over `k`
   (stacksAlgebra, Lemma 10.165.4 …), and the tensor product over `k` of a geometrically normal
   `k`-algebra with a normal ring is normal (stacksAlgebra, Lemma 10.165.5 …)"; `*Needs:*` at
   `README.md:550-551`.

   **Claim.** The proof plan of *isNormalScheme_pullback_of_isTranscendentalSeparable* uses (a) the
   notion "geometrically normal `k`-algebra", (b) separable ⇒ geometrically normal, (c) geometrically
   normal `⊗_k` normal is normal, for arbitrary (non-Noetherian) algebras. The `*Needs:*` line lists
   only `IsNormalScheme`, `isNormalScheme_iff_forall_affineOpens` and `Algebra.IsTranscendentalSeparable`.

   **Witness.** `grep -ri "geometricallyNormal\|geometrically normal"` over the pinned Mathlib and
   Tau Ceti: no hit. SchemeAndStackFoundations uses the phrase only for fibres (§0.8), states neither
   (b) nor (c). stacksAlgebra line 21516 is a theorem with its own proof (line 21518 on), not a
   one-line step.

   **Repair.** In §0.6, after the statement of the target and before "Route", insert:

   > Define *Algebra.IsGeometricallyNormal*: a `k`-algebra `A` over a field `k` is geometrically normal
   > when `k'' ⊗_k A` is a normal ring (every localisation at a prime an integrally closed domain) for
   > every field extension `k''/k` (one of the equivalent
   > conditions behind stacksAlgebra, Definition 10.165.2, tag 0380, line 21504).
   >
   > - *isGeometricallyNormal_of_isTranscendentalSeparable*: a separable field extension `k'/k`
   >   (`Algebra.IsTranscendentalSeparable k k'`) is geometrically normal over `k` (stacksAlgebra,
   >   Lemma 10.165.4, tag 0C30, line 21510).
   > - *isNormal_tensorProduct_of_isGeometricallyNormal*: for `k`-algebras `A`, `B` with `A`
   >   geometrically normal over `k` and `B` a normal ring, `A ⊗_k B` is a normal ring; no finiteness or
   >   Noetherian hypothesis (stacksAlgebra, Lemma 10.165.5, tag 06DF, line 21516).

   and replace the first clause of the route by "Route: by the two bullets above, `k' ⊗_k Γ(V, O_W)` is
   normal for the affine opens `V` of `W` …", and name the three in the `*Needs:*` line and in
   Layer 0's Dependencies.
   Tested on the instances of the Checks: `ℚ(i) ⊗_ℚ ℚ(i) ≅ ℚ(i) × ℚ(i)` normal (both bullets apply,
   `ℚ(i)/ℚ` separable); `k = 𝔽_p(t)`, `k' = k(t^{1/p})`: `k^{perf} ⊗_k k'` contains the nilpotent
   `t^{1/p} ⊗ 1 − 1 ⊗ t^{1/p}`, so `k'` is not geometrically normal and the first bullet rightly does
   not apply.

2. **F02** (P3) §1.1, route for (1): a step through "geometrically reduced at a point", which is not at the pins

   **Location.** `packages/NashBlowups/README.md:657-659`: "so `X` is geometrically reduced at its
   generic points (stacksVarieties, Lemma 33.25.4 …), and a reduced scheme geometrically reduced at its
   generic points is geometrically reduced (stacksVarieties, Lemma 33.6.8(3) …)".

   **Claim.** The forward half of (1) uses the pointwise notion and stacksVarieties 04KS(3) as inputs;
   `*Needs:*` (`README.md:673-675`) names Mathlib's `GeometricallyReduced`.

   **Witness.** `Mathlib/AlgebraicGeometry/Geometrically/Reduced.lean:44`: `GeometricallyReduced` is a
   property of a morphism (`geometrically IsReduced f`); the file has no pointwise notion and no
   statement of 04KS(3). No roadmap section is cited for it.

   **Repair.** Replace the sentence "If `X_sm` is dense, … is geometrically reduced (stacksVarieties,
   Lemma 33.6.8(3), tag 04KS, line 296)." by:

   > If `X_sm` is dense, let `k'/k` be a field extension and `Spec A ⊆ X` an affine open; `A` is reduced
   > and Noetherian, so the ideal of the complement of `X_sm ∩ Spec A` lies in no minimal prime and
   > contains a nonzerodivisor `g`, with `D(g) ⊆ X_sm`. Then `A → A_g` is injective, hence so is
   > `A ⊗_k k' → A_g ⊗_k k'` (`k'` is flat over `k`), and `A_g ⊗_k k'` is reduced because `D(g)` is
   > smooth over `k` (Tau Ceti's instance `Smooth.geometricallyReduced`,
   > `TauCeti/AlgebraicGeometry/Morphisms/Smooth/GeometricallyReduced.lean`). So `X_{k'}` is reduced
   > (stacksVarieties, Lemma 33.25.7, tag 056V, line 2112, for the statement).

   and add `Smooth.geometricallyReduced` to "From Tau Ceti" and to the `*Needs:*` line. Tested on the
   first Check of §1.1: `A = k[y]/(y^p − t)` over `𝔽_p(t)` has empty smooth locus, the complement's ideal
   is `0`, which lies in the minimal prime `0`, so no `g` exists and the argument rightly gives nothing.

3. **F03** (P3) "Seidenberg's lemma" names a result after a work that the manifest does not record

   **Location.** `packages/NashBlowups/README.md:37` ("Seidenberg's lemma on derivation-stable ideals")
   and `README.md:1134` ("### 4.3 Seidenberg's lemma"), cited to hamann2003, Lemma 0.1.

   **Claim.** The attribution is supported by the cited source.

   **Witness.** hamann2003 lines 54–57 present the lemma as folklore; the text of hamann2003 contains
   no occurrence of "Seidenberg". `packages/NashBlowups/sources.toml` has no entry for a work of
   Seidenberg. (Same defect as the Oneto–Zatini and Teissier attributions removed in the last repair.)

   **Repair.** `README.md:37`: "Seidenberg's lemma on derivation-stable ideals" → "the stability of
   minimal primes over derivation-stable ideals"; `README.md:1134`: "### 4.3 Seidenberg's lemma" →
   "### 4.3 Minimal primes over derivation-stable ideals". (Alternative, if the name is kept: record
   the primary source through the sources service and cite its theorem by locator beside hamann2003.)
   No statement changes; the Checks of §4.3 are unaffected.

One P2 and two P3 findings. No statement of `packages/NashBlowups/README.md` or
`packages/NashBlowups/Suggested.lean` was found false; no supplier citation or pinned declaration
was found missing; the dependency check is clean.

## Verified sound

**Dependency check** (command of the brief, run at fb0bf80):

```
depcheck: 246 roadmaps, 2244 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` changes only
`packages/NashBlowups/` (README.md, Suggested.lean, metadata.toml, sources.toml, two reports).

**Counts.** Declarations read: 3 of 3 (`Suggested.lean`, all 94 lines). README: all 1624 lines; 47
`Prove`/`Define`/`Corollary` paragraphs read (52 italic target names and the 3 Lean names; the plan
lists 37 targets). Source locators verified against the cached texts: all 98 line locators of the
README, in the 10 sources with a text; none wrong. Checks read and evaluated: all 127 Check bullets
and the worked examples of Layers 0–7 (computed values in the table below). Sibling citations checked: 17 (below). Pinned
declarations checked by grep at the pins: 78 named in "Exact supplier contracts", all present, with
the hypotheses the README states for those I opened (listed below).

**Suggested.lean table.** Elaborated types taken from `scratch/signatures.md` (I ran no Lean; none is
permitted in this pass) and compared with the README statements.

| Declaration | Section, context | README | Instances and values | Result |
|---|---|---|---|---|
| `HasLocallyFreeQuotientOfDifferentials (k) [CommRing k] (X) [X.Over (Spec (.of k))] (d : ℕ) : Prop` | Layer 0; no `variable`; all binders explicit | §0.7, same generality (commutative ring `k`) | `X = ∅`: `E = 0` in `FixedRank ∅ d` for all `d` (rank condition vacuous), true. `𝔸¹`: `d = 0` true (zero map is epi onto `0`), `d = 1` true, `d = 2` false (fibre dimension 1). Cusp, `d = 1`: `𝔽₂` true (`dx ↦ 0, dy ↦ 1`), `𝔽₃` true (`dx ↦ 1, dy ↦ 0`), `ℚ` false (`b = (3t/2)a` in `k[[t², t³]]`). Node: false in every characteristic. `Spec k[ε]/(ε²)`, `d = 1`: true iff `char k = 2`. Wrong model "Ω itself locally free": excluded by cusp over `𝔽₂` | real body on pinned carriers; not padding (needed by both theorems) |
| `smooth_iff_hasLocallyFreeQuotientOfDifferentials_of_charZero` | Layer 4; binders `[Field k] [CharZero k] [IsReduced X] [LocallyOfFiniteType _] (hX : IsPureDimensional d X)` all in the elaborated type | §4.4, same hypotheses | `∅`: both sides true. `Spec K`, `K/ℚ` finite, `d = 0`: true/true. Cusp/ℚ, node/ℚ, `d = 1`: false/false. `𝔸²_ℚ ⊔ 𝔸¹_ℚ`, `d = 2`: smooth, RHS false, excluded by `hX`. `Spec ℚ[ε]/(ε²)`, `d = 0`: RHS true, not smooth, excluded by `IsReduced`. Cusp/`𝔽₂`: RHS true, singular, excluded by `CharZero`. Route steps 1–5 recomputed (stable annihilator, contraction to `k[X₁..X_d]` zero, `trdeg κ(P) ≥ d`, `m/m² ≅ κ^d`) | true as typed; headline |
| `smooth_iff_hasLocallyFreeQuotientOfDifferentials_of_isNormalScheme` | Layer 5; binders `[Fact p.Prime] [CharP k p] [PerfectField k] [IsNormalScheme X] [LocallyOfFiniteType _] (hX)` all present | §5.4 first statement, same hypotheses | `∅`: true/true. `d = 0`, `Spec` of finite extension of perfect `k`: true/true. Cone `z² = xy`, `p = 2`, `d = 2`: singular; RHS false (`ya + xb = 0` forces `y ∈ (x)` or `x ∈ (y)`, false in `k[y,z]/(z²)`). `Spec 𝔽₂[ε]/(ε²)`, `d = 0`: RHS true, not smooth, excluded by normality. `x^p + y² + t` over `𝔽_p(t)`: RHS true, not smooth, excluded by `PerfectField`. Cusp/`𝔽₂`, `𝔽₃`: excluded by normality. Route §5.3 steps 1–5 recomputed (`ρ_Q ∘ ψ_Q = id` with `σ_Q(r^p·1) = r`; `Ass(F_*R) = {0}`) | true as typed; headline |

Headline theorems of the README: triviality criterion §2.5; blowup descriptions §§3.2–3.3; Nobile's
theorem §4.5 with its differential form §4.4; Duarte–Núñez-Betancourt §5.4 (both forms); criteria for
`ν̄` §6.4; never-resolves §7.3. Statable at the pins and stated: the two differential forms. The
others need `X*`; the module docstring names each and the missing carrier, and I confirmed the
carrier claim at the pin (`TauCeti/AlgebraicGeometry/Grassmannian/Basic.lean` has
`Module.Grassmannian.scheme` over `Spec R` only; `TauCeti/AlgebraicGeometry/RelativeProj/` exists; no
Grassmannian or projective bundle of a sheaf on a general base). Padding: none (one-tactic probe: the
`def` is used by both theorems; neither theorem follows from a library lemma — Loogle and LeanSearch
leads in `scratch/library-matches.md` opened, none states either). No `set_option`, no `lemma`, no
sorry'd data, imports are `import Mathlib` plus four existing `TauCeti.*` modules, all used.

**README targets: adversarial table** (values computed by me; "ok" rows give the values).

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| §0.1 `c_f` | `t ↦ (t², t³)`, char 0 and 2; closed point of `𝔸¹`; identity | `2t dt, 3t² dt`; char 2: `0, t² dt`; `k·dx → 0` surjective not injective; `dx ↦ dx` | ok |
| §0.2 base change | `k → k(s)`, `X = Spec k`; `K = k[y]/(y^p − t)`, `k' = k(τ)`; `ℤ → 𝔽₂` | `c: 0 → k(s)ds` not iso, `b: 0 → 0` iso; `B = k[τ,u]/(τ^p − t, u^p)`, `Ω_{B/k}` free on `dτ, du`, `c(dy) = dτ + du`, `b(dy) = du` generates `Ω_{B/k'}`; identity on `𝔽₂[T]dT` | ok |
| §0.3 `X_sm^{(d)}` | `𝔸² ⊔ 𝔸¹`; cusp/ℚ; `Spec k[ε]/(ε²)` | `(2) = 𝔸², (1) = 𝔸¹, (0) = ∅`; `(1) = X ∖ 0`; fibre of Ω is `k·dε` (rank 1) but `X_sm = ∅` | ok |
| §0.4 `Gr` along a surjection | `O² → O`, `r = 1, 2`; identity | section `[1:0]` of `ℙ¹_S`; `Gr_2(O) = ∅ ⊂ Gr_2(O²) = S`; identity | ok |
| §0.5 smooth iff regular at closed points | cusp; `𝔸ⁿ`; `Spec k(t^{1/p})` over `𝔽_p(t)` | emb. dim 2 > 1; regular; regular not smooth (perfectness needed) | ok |
| §0.6 normal base change | `ℚ(i) ⊗ ℚ(i)`; `x^p + y² + t`, `k' = k(t^{1/p})`; `k(s)/k`; `ℚ̄ ⊗ ℚ̄` | two points; `u^p + y² = 0`, `(−s²)^p + (s^p)² = 0` for odd `p`, cotangent dim 2; PID; absolutely flat | statement ok; route R01 |
| §0.7 bullets | uniqueness on `𝔸²`, `d = 1`; cusp/`𝔽₂`; torsion kernel | kernels `O dy ≠ O dx` (density needed); `x²c = 0 ⇒ c = 0`, kernel `O dx`; `Ann(T)` avoids minimal primes | ok |
| §1.1 setting | `k[y]/(y^p − t)`; `k[ε]/(ε²)`; `𝔸² ⊔ 𝔸¹` | `X_sm = ∅`; not reduced; `X_sm ≠ X_sm^{(2)}` | statement ok (056V is for reduced lft `X`, line 2112); route R02 |
| §1.2 `N(X, F, r, U)` | `F` locally free; `O ⊕ O/(x)` on `𝔸¹`; ideal of `0 ∈ 𝔸²` | `N = X`; fibre of `Gr_1` is `ℙ¹`, `N ≅ X`; `N = Bl_0 𝔸²` | ok; `σ_U` quasi-compact (`U → X` qc, `Gr → X` separated) |
| §1.3 lift | identity; `Spec k → 0` with `(a,b) ↦ b`; `Bl_p X → X`, `r ≥ 2`, `r = 1` | `π_N⁻¹`; point `[0:1] ≠ [1:0]`, no factorisation; `q = h` not iso; `Bl = X` | ok; uniqueness of `M` needs `Z` reduced and density, both stated |
| §1.4, §1.5 | `V ⊆ U`; inclusion of `U`; `{0} → 𝔸²` | `V`; `U`; fibre product `ℙ¹` versus `N = ∅` | ok |
| §2.1 `X*` | smooth; cusp char 0, ≥ 5; node; `Spec k`, `d = 0` | `X`; `k[t², t³, 3t/2] = k[t]`, `ν*Ω = k[t]dx ⊕ k[t]/(t³)`; `[1:0]`, `[0:1]`, two lines; `X` | ok |
| §2.2 modification | `y² = x²z`, char ≠ 2 | Plücker coordinates `[u : 2v : 2v²]`; chart `u = vw`: `k[v,w]`; chart `v = us`: `k[u,s]`; fibre ideal `(u, v²)`: `(vw, v²)` with nilpotent `v`, and `(u)` | ok |
| §2.3 | cusp char 0, 2; `𝔸² ⊔ 𝔸¹`, `d = 2` | `𝔸¹`; `X`; `X* = 𝔸²`, `ν` not surjective | ok |
| §2.4 | `Bl_0 𝔸² → 𝔸²`; one line of `𝔸¹ ⊔ 𝔸¹` | classifying map is `π`, not a closed immersion; closed immersion, lift not iso (surjectivity needed) | ok |
| §2.5 triviality | cusp char 2, 3, 0 | `Ω = ⟨dx,dy⟩/(x²dx)`; `/(2y dy)`; `b = (3t/2)a` impossible with a unit | ok, agrees with §3.3 |
| §2.6, §2.7 | cusp/ℚ, `ℚ(i)`; cusp char 2 with `d = 2`; `𝔸²`, `d = 1` | `𝔸¹_{ℚ(i)}`; `X_sm^{(2)} = ∅`, `X^{(1)} = ∅` smooth; `∅` | ok |
| §3.1 Gauss map | line `y = 2x`; cusp char 0, 5, 3, 2; `𝔸ⁿ` | `[1:2]`; `[1:3t/2]`, `3/2 = 4` mod 5; `[1:0]`; `[0:1]`; point | ok |
| §3.2 blowup | `dx ↦ x` on `𝔸¹`; cusp `I = (y, x²)`; `I = 0` | `X`; `I·k[t] = (t³)`, charts `k[t]`, `k[t, t⁻¹]`, `Bl = 𝔸¹`; `Bl_0 = ∅` | ok; `ν_I⁻¹(X_sm)` dense recomputed |
| §3.3 hypersurface | cusp all chars; node; `x^p − y^q` char `p`; `n = 0`; umbrella | `(y, x²)`, `(x²)`, `(y)`; `(x, y)`; `(y^{q−1})` nzd; `J = 0`, `Bl = ∅ ≠ Spec k`; `J·k[u,v] = u(u,v)`, chart `k[u,s]`, agrees with §2.2 | ok |
| §4.1 coordinates | `k[x,y]_{(x,y)}`; cusp char 3; `d = 0`; `k[x]_{(x^p − t)}` | `x, y`; `ker q = R dy/(y dy)`; none; `q(dm) ⊆ m` | ok |
| §4.2 `L_∂` | `k[x]`, `d/dx`; `x d/dx`; `k[x]/(x²)`, `∂x = x` | `L(x dx) = dx`; `L(dx) = dx`; `L(x dx) = 2x dx = 0` in Ω | ok; `∂ ⊗ 1 + 1 ⊗ ∂` preserves `J`, `J²` |
| §4.3 | `ℚ[x]`, `(x²)`; `ℚ[x,y]`, `(y²)`; `𝔽_p[x]`, `(x^p)` | not stable; `(y)` stable; `(x)` not stable | ok; route: `P = (J : x)`, `(x∂y)² ∈ J` |
| §5.1 operators | `p = 2`, `d = 1`; `p = 3`; `d = 0` | `φ₀ = id − x∂`, `φ₁ = ∂`; inverse of `[[1,x,x²],[0,1,2x],[0,0,1]]` is `[[1,−x,x²],[0,1,−2x],[0,0,1]]`, `φ₀(x²) = 0`; `id` | ok; formula holds without commuting `∂_i` |
| §5.2, §5.3 | `k(t)`; `d = 0`; `k[s]_{(s)}` over `𝔽_p(t)`; cusp char 3 | `1..t^{p−1}`; `K = K^p`; `[K:K^p] = p²` versus rank `p`; `t³ ∉` span of `1, t², t⁴` over `k[t⁶, t⁹]` | ok |
| §6.1–§6.4 | cusp char 0, 2; node; umbrella char 2; `C_{k'}` | `𝔸¹`; `X* = X`, `X̄* = 𝔸¹`; identity; `J = (x²)`; `s ↦ (−s² − t^{1/p}, s^p)` bijective, not iso | ok; corollaries of §6.4 follow (`ν̄` iso ⇒ `X` normal) |
| §7.1–§7.3 | cusp char 0, 2; `m = 0`; smooth `X` | `Y₁ = 𝔸¹`; `X^{(i)} ≅ X`; hypothesis trivial, conclusion false; `Y₀` smooth | ok; statement matches castilloDuarteLeytonLiendo2026 lines 58–67 |

**Sibling citations resolved** (main at the worker's checkout, or the head named by the roadmaps
tool): AlgebraicModuliForArithmeticGeometry §1.3 `coherentGrassmannian` (arbitrary `S`, universal
quotient, base change, `Gr_1 ≅ P(E)`, properness over `Spec R` for finite `M`) and `plucker`; §5.4
`ArithmeticModuli.DMNormalization.stack`, `.finite`, `ArithmeticModuli.DMSchematicClosure.stack`
(flat base change, equals `Scheme.Hom.image`). SchemeAndStackFoundations §0.7, §0.11
`field_extension_descent` (smooth descends), §0.17, §0.23, §0.30, §4.11
(`IsModification.Witness φ U`), §4.13 *regularLocus_eq_smoothLocus*. EnhancedDerivedSheaves §E1.6
`isRegular_of_frobenius_flat` (`[CharP R p] [IsNoetherianRing R]`, flat Frobenius).
DerivedDeRhamCohomology §0.23 (`DerivedDeRham.IsPBasis`, `DerivedDeRham.pBasis_kaehler_basis` are in
its `Suggested.lean`; the converse half is in its prose, as the README says) — the two leads of
`scratch/citations.md` are resolved, not defects. ResolutionOfSingularitiesCharacteristicZero §2.15.
DiophantineApproximationAndTranscendence §5.6 (`exists_lieDerivativeOneForm`,
`lieDerivativeOneForm`). AdicSpacesPartIII §R3.6 (mentioned as another object). All are on main or
earlier in the merge order; none is on the never-cite list.

**Ownership.** `roadmaps grep` for Nash blowups, modifications and transforms: no match on main or
in any open pull request. No roadmap states the normal base change of §0.6, the Lie derivative on
Kähler differentials of an algebra in every characteristic, or the stability of minimal primes
(§4.3). Pinned Tau Ceti by object: no smooth locus of fixed dimension, no comparison or base-change
map of `relativeDifferentials`, no Grassmannian of a sheaf, nothing on `p`-bases. No declaration of
`Suggested.lean` shares a fully qualified name with a roadmap I can read. `scratch/overlaps.md`: no
second copy, no dropped id, no other pull request changes this folder.

**Pinned declarations opened for hypotheses:** `Scheme.Hom.smoothLocus`,
`dense_smoothLocus_of_perfectField`, `IsClosedImmersion.lift`, `IsClosedImmersion.comp_iff`,
`normalizationDesc`, the `IsIso (normalizationPullback)` instance for smooth `g`,
`Algebra.IsTranscendentalSeparable` and its two instances, `tfae_universallyInjective`,
`IsPureDimensional` (vacuous on `∅`), `IsNormalScheme`, `isDiscreteValuationRing_stalk` (coheight
one, locally Noetherian), `IsModification`, `FixedRank`, `bijective_of_depth`,
`kerCotangentToTensor_bijective_of_formallyEtale`, `powRingHom_finite`,
`isIso_normalizationDesc_iff`, `isPureDimensional_pullback_Spec_map_iff_of_field`,
`smoothOfRelativeDimension_iff_ringKrullDim_stalk_eq`, `relativeDifferentialsStalkEquiv`,
`isProper_toSpec`, `isSeparated_toSpec`. Each agrees with the README's description.

**Policy.** No pull-request number or process narrative in the README or docstrings; `theorem`
only; every definition has at least three Checks (0.1: 3, 0.3: 3, 0.7: 4, 1.2: 3, 2.1: 4, 2.7: 4,
4.2: 3, 6.1: 3, 7.1: 3); no algorithm; gaps: none declared, `design/plan.json` `gaps` is empty and the
README says "No gap is recorded", consistent.

**Copyright.** Wording: besides the 98 locators, 12 passages compared with 7 sources (§1.2 with
nashModificationNotes2024 lines 216–225; §2.4 with lines 153–160; §4.4 with lines 182–199; §5.3 step 3
with duarteNunezBetancourt2020 lines 284–305 and nashModificationNotes2024 lines 416–437; §4.3 with
hamann2003 lines 58–64; §0.4 with alperModuli lines 2993–3007; §3.2 with nobile1975 lines 107–126;
§1.3 and §1.4 with gonzalezSprinberg1982 lines 91–104; §3.1 with castilloDuarteLeytonLiendo2026 lines
13–21; both theorem docstrings of `Suggested.lean` with duarteNunezBetancourt2020 line 256 and
nashModificationNotes2024 lines 179–181). Longest shared run of consecutive words: 5 ("then there is
a unique", a universal property). §4.4 and §3.2 use proofs different from their sources'. §5.3 keeps
the sources' letters `ψ`, `ρ_Q`, `σ_Q` for the same maps; the sentences are the roadmap's.
Arrangement: nashModificationNotes2024 has sections 1 (definition), 2 (basic results), 3
(Oneto–Zatini), 4 (Yasuda), 5 (normal case), 6 (toric), 7 (Toh-Yama); the roadmap's Layers 0–7 are
interfaces, sheaf modification, Nash blowup, embedded and blowup descriptions, characteristic zero,
normal characteristic `p`, normalised, iteration. Sections 4, 6, 7 have no layer; Layers 0, 3, 6, 7
have no section; Layer 1 precedes Layer 2 where the source has 3 after 1–2. No one-to-one run. Reuse:
no table, figure or list taken over.

Source independence: 12 passages compared with 7 sources, none shared; largest share
nashModificationNotes2024, 22 of 100 locators; contents compared with nashModificationNotes2024:
independent.

## Not verifiable

- The elaborated types: taken from `scratch/signatures.md`; no Lean command is permitted in this
  pass, so `#check @name` was not rerun.
- hironaka1983, spivakovsky1990, semple1954, teissier1982, ega1: uncertified, no text; the README
  cites them as background only and no target depends on them.
- "Ann. of Math. 203 (2026)" for castilloDuarteLeytonLiendo2026 and "Rev. Mat. Iberoam. 38 (2022)"
  for duarteNunezBetancourt2020 (`README.md:1609-1613`): only the arXiv texts were read; the journal
  data and the journal numbering were not checked.
- alperModuli "printed p. 62" (`README.md:471`): the cached text marks PDF pages only (the proof is on
  PDF page 69); the printed page was not checked.
- DerivedDeRhamCohomology §0.23 and AlgebraicModuliForArithmeticGeometry §§1.3, 5.4 were read at the
  heads the roadmaps tool returns, not on main (they are earlier in the merge order, not on main).

## Source issues

- **Misprint** in nashModificationNotes2024 at Theorem 5.1, printed p. 10: the source says the Nash modification of a normal variety is an isomorphism iff the variety is singular; it should be iff it is nonsingular; affects a stated result.
- **Misprint** in nashModificationNotes2024 at Theorem 6.2, printed p. 12: the source says the normalised modification is an isomorphism iff `X` is an isomorphism; it should be iff `X` is nonsingular; affects a stated result.
- **Error** in nashModificationNotes2024 at Section 5, step (b), printed p. 10: the source says the coefficients of the operators `Φ_γ` lie in `k`; it should be in `R` (for `d = 1`, `p = 2`, `Φ_0 = id − x·δ`); affects the proof.
- **Misprint** in nashModificationNotes2024 at Section 5, step (c), printed p. 11, definition of `ρ_Q`: the source omits the basis vectors `e_α` in the sum; it should be the sum of `σ(φ_α(f^{1/p})/s)·e_α`; affects nothing.
- **Misprint** in nashModificationNotes2024 at Section 1, printed p. 3: the source takes the closure of the image of `φ` in the Grassmannian; it should be in `X × G(d, N)`; affects nothing.
- **Misprint** in nashModificationNotes2024 at Section 2, printed pp. 4–5: Proposition 2.2 and the paragraph before it are printed twice, the second time as Proposition 2.3; it should appear once; affects nothing.
- **Misprint** in duarteNunezBetancourt2020 at proof of Theorem 3.10, printed pp. 6–7: the source mixes the indices `t` and `k` in `δ_t(x_j)` and writes `∂^α` for the normalised `δ^α` in the matrix `Ã`; it should use `t` and `δ^α` throughout; affects nothing.
- **Misprint** in hamann2003 at proof of Lemma 0.1, printed p. 2: the source says the radical `J` equals the annihilator of an element `x ∉ J`; it should be that the minimal prime `P` equals `(J : x)`; affects the proof.
- **Misprint** in stacksAlgebra at Example 10.140.8, tag 00TY: the source writes the equation `x^p + y² + α` over `𝔽_p(t)` with `α` undefined; it should be `x^p + y² + t`; affects nothing.
- **Misprint** in alperModuli at Exercise 0.3.21 (line 1206): the source says the subfunctor is represented by a closed subscheme of `X`; it should be of `S`; affects nothing.
- **Misprint** in nobile1975 at Example 1 and Example 4, printed pp. 300 and 305: the source refers to Remark 1 (a list of notations) for the Jacobian-ideal description; it should be Remark 2; affects nothing.

## For the human reviewers

- **Scope.** The source with the largest share (nashModificationNotes2024, 22 of 100 locators) is an arXiv note, version 1; the characteristic-zero differential criterion (§4.4, a `Suggested.lean` headline) has its only locator there (Proposition 2.3, lines 179–181).
- **Scope.** The characteristic-`p` headline of `Suggested.lean` (§5.4, differential form) is stated by no source as a theorem; duarteNunezBetancourt2020 line 256 states the Nash-blowup form and proves the differential form inside that proof (lines 258–305).
- **Licence.** hamann2003 (arXiv:math/0311006v1), the only source for §4.3, is an arXiv text for which I found no publication record; it presents the lemma as folklore (lines 54–57).
- **Licence.** The journal data for castilloDuarteLeytonLiendo2026 ("Ann. of Math. 203 (2026)", `sources.toml` venue) were not checked against the publisher; only arXiv v3 was read.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "fb0bf809f30b07ed9f30811ddb87b371cea2b6e6", "job": "RT-NashBlowups~1b", "model": "fable", "worker": "chris-x29"} -->

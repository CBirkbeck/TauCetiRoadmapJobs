# Review of SchemeAndStackFoundations (pull request #1276 at 6da2b17)

**Verdict:** needs changes

This is an incremental re-review: 8 lines of the folder changed since `b311bda`, all in one sentence of §0.8.

- **Previous findings.** R03 of r76 is repaired, and the repair is correct. R02 is repaired: the description was rewritten and its statements hold at this head. R01 is not repaired and is carried.
- **New this round.** Nothing.
- **Blocking.** R01 only. It is not a step a folder repair can take: it needs the merge of `origin/main` into the branch, and then one edit of `Suggested.lean`.

## R01 (P2) — The branch still pins Tau Ceti `358314d4`, where 60 of the 81 Tau Ceti files the README cites do not exist

Re-raised: H01. A folder repair cannot merge `origin/main`, and the rewritten description now says so openly ("The branch's `lake-manifest.json` still pins Mathlib `f6090c70` and Tau Ceti `358314d4`"). That discloses the defect; it does not remove it. The folder is still split between two pins: the README is written against main's, `Suggested.lean` against the branch's, and the file must change once the branch is merged. It is re-raised so that it goes to the worker or a human rather than to another folder-repair round.

- **Location.**
  - `lake-manifest.json` pins Tau Ceti `358314d4` and Mathlib `f6090c70`; `origin/main` (`4452ffa`) pins `2fd255d9` and `1b1ccf4b`.
  - `README.md:427` says "**From Mathlib** (`1b1ccf4b`)" and `:468` says "**From Tau Ceti** (`2fd255d9`)".
  - `Suggested.lean:119` and `:126` restate `Ring.IsJapanese` and `Ring.IsNagata`, whose docstrings (`:118`, `:125`) say they are the bodies of `TauCeti.Ring.IsJapanese` and `TauCeti.Ring.IsNagata`.
- **Claim.** At the pins this review checks, the supplier contracts cite declarations that are absent, and at main's pins `Suggested.lean` restates two predicates Tau Ceti owns.
- **Witness.** Recounted at this head: the README names 81 distinct `TauCeti/….lean` files; 60 are absent from the pinned package at `358314d4`; 80 exist at `2fd255d9` (the 81st, `Cohomology/FormalFunctions.lean`, is §4.9's planned home).
- **Repair.**
  1. Merge `origin/main` into the branch. `git merge-tree --write-tree HEAD origin/main` exits 0 at this head, so the merge is conflict-free.
  2. Then, in the folder: delete the two restated definitions, import `TauCeti.RingTheory.Japanese` and `TauCeti.RingTheory.Nagata`, and state the two complete-local theorems on `TauCeti.Ring.IsJapanese` and `TauCeti.Ring.IsNagata`.
- **Tested.** All ten `TauCeti.*` modules `Suggested.lean` imports exist at both pins, so step 1 alone does not break the imports.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d4`; `README.md:427`, `:468` name `1b1ccf4b`, `2fd255d9`; 60 of 81 cited Tau Ceti files are absent at the branch pin. Carried as R01.
- R02 — repaired: the description no longer mentions a §4.10A and no longer says no Lean declaration changes. It now says "§4.10 states Grothendieck's existence theorem with full faithfulness …" and "The file is rewritten as the roadmap's acceptance test."
- R03 — repaired: `README.md:957–961` now reads "on a nonempty affine open `U ⊆ S` the locus is constructible (Stacks, Properties, Lemma 28.2.1 (054C)) … so it contains a dense open of `U` (Topology, Lemma 5.15.15 (005K) …)".

## Verified sound

### Gate, dependency check, build

- **Gate.** The worker's gate reports every counter 0, `build=0` and `OK`. My re-run of `gate … SchemeAndStackFoundations --base origin/main` printed every counter 0 and `OK`, and exited 0.
- **Dependency check.** The output of `gate --depcheck … --movable --pr 1276`, verbatim:

  ```text
  depcheck: 234 roadmaps, 2263 edges, 0 problem(s)
  ```

  It exited 0, with no UPWARD, CYCLE or `moved:` line.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchemeAndStackFoundations'` is empty.
- **Elaboration.** `lake env lean <abs>/Suggested.lean` exited 0 in 52 s. It printed 47 "declaration uses `sorry`" warnings and nothing else, matching the 47 `sorry` in the file.
- **Signatures, padding, headlines.** `Suggested.lean` is byte-identical to the file r76 read (the diff touches only `README.md`), so r76's `#check` comparison (no lost binder; `scratch/signatures.md` reports 0 of 120), r74's one-tactic probe (all 47 positions fail) and the headline list stand.

### The changed passage, checked at the text

The change is the sentence of §0.8 that derives the dense open from the locus statement for the geometrically integral, normal and smooth cases. Checked in the cached Stacks book (7654 pages):

- **054C** (Properties, Lemma 28.2.1, book line 112942): a subset of a scheme is locally constructible iff its intersection with every affine open `U` is constructible in `U`. This is the step r76's R03 asked for, and the README's citation names the right chapter.
- **005K** (Topology, Lemma 5.15.15, book line 7646): for `E` a finite union of locally closed subsets and `Z` irreducible with generic point `ξ`, `ξ ∈ E` iff `E ∩ Z` contains a dense open of `Z`. The README's parenthesis states this hypothesis and says why it holds: a constructible subset of `U` is a finite union of sets `V ∩ Wᶜ` with `V`, `W` open.
- **The argument as written.** `S` is integral, so a nonempty affine open `U` is irreducible with the same generic point `η`; `η` lies in the locus because `X_η` has the property; 005K with `X = Z = U` gives a dense open of `U`; a nonempty open of `U` is open in `S` and dense because `S` is irreducible. Each step is stated in the sentence and none is missing.
- **No dependent text changes.** The sentence introduces no target, no name and no cross-roadmap citation. `generic_fibre_spreading` and `fibre_locus_constructible` keep their statements, so their consumers resolved in r76 (`SieveMethodsAndPrimePatterns` at its open head, `EnhancedDerivedSheaves` on main) are unaffected.

### The description, checked at this head

- "It imports `Mathlib` and ten `TauCeti.*` modules": `Suggested.lean:1–11`, ten modules, each present at `358314d4` and at `2fd255d9`.
- "Its 47 theorems are each stated with `sorry`" and "no `example`": 47 `sorry`, 0 `example`.
- "the only heading removed is `### Other supplier contracts`": the diff against the merge base removes that heading and no other.
- "Of the 81 Tau Ceti files the README names, 60 exist only at `2fd255d9`" and "Main merges into the branch without conflicts": recounted, as in R01.
- "AbundanceStatement and CommRingFactorizationSystems are no longer cited": 0 occurrences in the README.
- §4.10 scope: `README.md:77` and `:5715` place polarized adic systems outside the scope, as the description says; `grep -c '4\.10A'` is 0.
- The generated `merge-order` block states the order with the four conflicting heads of `scratch/overlaps.md`: "this pull request → #1656 → #1807 → #1808 → #1854".

### Library declarations and citations

- No library declaration is cited in the changed passage. The two pins were read from `lake-manifest.json` on the branch and on `origin/main`; the 81 cited Tau Ceti files were tested for existence at both.
- `scratch/overlaps.md`: no dropped id in either direction and no id only an open revision defines.
- Seeded sample: none of the 15 seeded targets (§0.2, 0.10, 0.15, 1.3, 1.20, 1.23, 2.6, 2.7, 3.5, 3.6, 4.10, 5.3, 5.7, 5.8, 5.10) falls in the changed passage, which lies in §0.8. The README flags no locator as unverified.

### Adversarial table

The first three rows are computed this round, for the changed sentence. Rows marked r76 or r74 are carried from the previous report (`PRREVIEW-SchemeAndStackFoundations~76`, which itself carries the r74 rows) for statements this diff leaves untouched.

| Statement | Instances | Values computed (left / right) | Result | Round |
|---|---|---|---|---|
| §0.8 dense open from the locus, non-affine `S` | `S = ℙ¹_k`, `char k ≠ 2`, `X = V(s·xy − t·z²) ⊂ ℙ² × ℙ¹`, geometrically integral | fibre at `s = 0` is `z² = 0` (nonreduced), at `t = 0` is `xy = 0` (reducible), else a smooth conic; locus `ℙ¹ ∖ {0, ∞}`; on `U = D₊(s) = Spec k[u]` it is `D(u)`, constructible, contains `η`; `D(u)` is dense in `ℙ¹` | Pass | r77 |
| §0.8 dense open from the locus, affine `S` | `ℤ[x, y]/(y² − x³ − 5)` over `Spec ℤ`, normal and smooth | `Δ = −2⁴·3³·5²`; locus `D(30)`; `U = S`; `D(30) ∋ η` is open and dense | Pass | r77 |
| 005K hypothesis, negative control | `E = {η} ⊂ Spec ℤ` | `η ∈ E`, but `E` contains no nonempty open (every one contains a closed point); `E` is not a finite union of locally closed sets, so the stated hypothesis is what excludes it | Pass | r77 |
| §0.8 geometrically reduced | `ℤ[x]/(x² + 1)` over `Spec ℤ` | `X_η = Spec ℚ(i)`, separable; `X_p` reduced for odd `p` (`disc = −4` a unit), `X_2 = 𝔽_2[x]/(x + 1)²` nonreduced; locus `D(2)` | Pass | r76 |
| §0.8 geometrically irreducible, `n = 1` | `ℤ[x, y]/(xy − 6)` | `X_η ≅ Spec ℚ[x, x⁻¹]`, `n = 1`; `X_2`, `X_3` are `xy = 0`, `n = 2`; level set `E_1 = D(6)` | Pass | r76 |
| §0.8 geometrically connected, `n = 1` | `ℤ[x, y]/(3xy − 1)` | `X_η ≅ 𝔾_m`, `n = 1`; `X_3 = Spec 0 = ∅`, `n = 0` (empty is not connected); `E_1 = D(3)` | Pass | r76 |
| §0.8 geometrically integral | `ℤ[x, y]/(xy − 6)` | `X_p ≅ Spec 𝔽_p[x, x⁻¹]` integral for `p ∤ 6`, `X_2` reducible; locus `D(6) ∋ η`, dense open `D(6)` | Pass | r76 |
| §0.8 geometrically normal, smooth | `ℤ[x, y]/(y² − x³ − 5)` | `Δ = −2⁴·3³·5²`; cusps `v² = x³` mod 2, `y² = u³` mod 3, `y² = x³` mod 5; locus `D(30) ∋ η` | Pass (r76 R03, repaired at this head) | r76 |
| §0.20 permanence | `ℤ`; `ℤ[i]`; `ℤ/4`; `ℤ_(2)`; `𝔽_p(t) ⊂ 𝔽_p(t^{1/p})` | finite: `ℤ[i]` Nagata; `(ℤ/4)/(2) = 𝔽_2`, N-2; localisation; integral closure of `𝔽_p(t)` in `L` is `L`, `[L : 𝔽_p(t)] = p` | Pass | r76 |
| §0.25 Prop. 3.11 (iii) | `𝔽_p[t]^perf`; `𝔽_p[x_1, x_2, …]^perf`, `Z_i = Spec 𝔽_p[x_1..x_i]^perf` | `t ↦ a ∈ colim O(Z_i)` comes from some `Z_i`: bijective; `id_X` would need `A_i → A` surjective, but `x_{i+1}` is not in its image: not bijective | Pass | r76 |
| `Over A` cartesian instance (`:332`) | `A` terminal; `X, Y → h_S` | `X ⊗ Y = X × Y`; `X ×_{h_S} Y`, unit `𝟙_{h_S}` | Pass | r76 |
| base-change instance (`:758`) | `k = ℝ`, `X = Spec ℝ[x]/(x² + 1)`, `K = ℂ` | `X_ℂ ≅ Spec ℂ ⊔ Spec ℂ` over `Spec ℂ` by `pullback.snd`; `fst` lands in `X`, not `Spec ℂ` | Pass | r76 |
| `ChowGroup` group (`:1226`) | `ℙ¹_k`, dimension 0 | `Z_0 = ⊕_x ℤ`, `div(f)` has degree 0; `CH_0 = ℤ` | Pass | r76 |
| `derivedHom_isSheaf` | `K = L = O_X[0]`; `K = O`, `L = O[1]` on `𝔸² ∖ 0` | `H^i(U, O) = 0` for `i < 0`; `Hom(K, L[−1]) = H⁰(O) ≠ 0`, `H¹(𝔸² ∖ 0, O) ∋ x⁻¹y⁻¹` | Pass | r74 |
| `derivedObject_gluing` | `ℙ¹`, `O(−2)[1]`; `X = ∅`; `O ⊕ O[1]` | glues to `Ω¹[1]`; `D(O_∅) = 0`; `Hom(K, K[−1]) ⊇ Hom(O, O) ≠ 0`, excluded | Pass | r74 |
| `derivedRestrict` Checks | `Spec ℤ`, `U = D(2)` | `(ℤ/2)~ ↦ 0`; `H¹[O →·2 O] = (ℤ/2)~ ↦ 0` | Pass | r74 |
| §0.2 `relativeSpec_modulesEquiv` | `S = Spec k`, `A = k[t]` | kernel `∋ t⊗1 − 1⊗t ≠ 0` / over `p^*A`: `A` | Pass | r74 |
| §0.8 `flat_over_dedekind` | `k[t,x]/(tx)`; `k[t,x]/(x², tx)` | `t·x = 0`, not flat, `V(t)` not dominant; not reduced | Pass | r74 |
| §0.8 `quasi_sections` | generic point of `𝔸¹_k` | `κ = k(t)`, not closed in its fibre, excluded | Pass | r74 |
| §0.20 Checks | `R_r = k[t_i², t_i³]_{i ≤ r}` | `2^r` monomial generators; countable case not finite | Pass | r74 |
| §1.8 chart products | `F = G = H = Spec k`, `W = Spec k ⊔ Spec k` | `U ×_W V = ∅` / `U ×_H V = Spec k` | Pass | r74 |
| §1.15 torsors | `μ_p` over `𝔾_m`; `μ_2/ℚ` | `k(t)[s]/(s^p − t)` purely inseparable; `ℚ^×/(ℚ^×)²` | Pass | r74 |
| §1.17 `finiteGroupQuotient_projective` | `ℤ/2` on `ℙ¹_ℤ`; swap on `ℙ¹ × ℙ¹` | forms in `x², y²`; `H⁰(O(2k,2k))^{S_2} = H⁰(ℙ², O(2k))` | Pass | r74 |
| §1.17 `IsGeometricQuotient` | `Spec k[ε]/ε² → Spec k` | topological clauses hold; `k → k[ε]/ε²` not iso | Pass | r74 |
| `artinBootstrap` | `F = h_X`, atlas `𝟙` | flat, locally finitely presented, surjective | Pass | r74 |
| §2.14 `brownGersten_vanishing` | `Cone(A[0] → RΓ_Nis)` | `F(∅) ≃ A[1]`; `F(pt ⊔ pt) ≃ A[0]` | Pass | r74 |
| §2.14 dimension | `Spec ℝ` | `H^q_Nis = 0` / `H²_ét(𝔾_m) = ℤ/2` | Pass | r74 |
| §2.19 `upperShriek_smooth`, `_lci` | `𝔸¹_k → Spec k`; `Spec k → 𝔸¹` | `Ω¹[1] = O·dx[1]`; `H⁰ = H¹ = k` both sides | Pass | r74 |
| §3.3 degree | `V(z²) ⊂ ℙ²`; genus 2 | `χ(O(n)) = 2n + 1`, `deg O(1) = 2`; `deg O = 0 ≠ χ(O) = −1` | Pass | r74 |
| `Curve.vectorBundleDegree_pullback` | `z ↦ z²`, `E = O(1)` | `3 − 1 = 2` / `2 · 1` | Pass | r74 |
| §3.3 `curve_serre_duality_ext_hom` | node skyscraper | `dim Ext¹ = 2` / `dim Hom(K, K ⊗ ω) = 1` | Pass | r74 |
| §3.6 Picard torsors | pointless real conic | `Pic X = 2ℤ`, `Pic(ℝ) = ℤ`, cokernel `ℤ/2` | Pass | r74 |
| §5.2 pushforward | `𝔸¹ → Spec k`; degree-`d` point | `[0] ∼ 0`, `deg = 1`; `d[𝔸¹_k]` both sides | Pass | r74 |
| §5.5 `Chow.gysin` | origin along `z ↦ z²`; `{1} → 𝔾_m → 𝔸¹` | `2[pt]` for both `U`; `(ji)^! = i^!j^!` | Pass | r74 |
| §5.12 `bezout_inequality` | line with itself; skew lines; double line | `1 ≤ 1`; `0 ≤ 1`; `1 ≤ 2` | Pass | r74 |
| `hodge_index` | `ℙ¹ × ℙ¹`, `D = (1, −1)` | `D·H = 0`, `D² = −2 ≤ 0` | Pass | r74 |
| `weil_bound` | `ℙ¹/𝔽_q`; `y² = x³ + x` over `𝔽_3` | `0 ≤ 0`; `\|4 − 4\| ≤ 2√3` | Pass | r74 |
| `grothendieck_existence` | `A = k[[t]]`; `𝔸¹_A` | `lim A/t^{n+1} = A`; `Σ tⁿxⁿ ∉ A[x]` | Pass | r74 |
| §5.10 `Num(E × E)` | `y² = x³ + x` over `𝔽̄_p` | `p ≡ 1 mod 4`: rank 4; `p ≡ 3 mod 4`: rank 6 | Pass | r74 |

### Remarks on untouched text

- none

## Not verifiable

- **Elaboration at main's pins.** Only the branch pins can be elaborated with the commands this review allows, so `Suggested.lean` was not elaborated at `2fd255d9`/`1b1ccf4b`, and the repair of R01, step 2, is not tested by a build.
- **Fulton 1998, de Jong 1996, Hartshorne 1977.** Not re-checked: none is cited in the changed passage. r74 records Fulton as having no legal copy; the manifest settles de Jong and Hartshorne as uncertified.
- **Ownership against open pull requests.** Checked through `scratch/overlaps.md` only; the changed sentence adds no object.

## Source issues

- none

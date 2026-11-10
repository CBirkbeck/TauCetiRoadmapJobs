# Review of SchemeAndStackFoundations (pull request #1656 at 7512edb)

**Verdict:** needs changes

This is an incremental re-review of the 98 lines that changed in the folder since `aa653e5`. Nothing outside the folder changed. The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with `sorry` warnings only.

Of the eight previous findings:

- six are repaired (R02–R06, R08);
- R07 is settled by the open pull request that owns that change (see "Previous findings");
- R01, about the description, is not repaired. It is the one finding of this report, and it is P3.

## R01 (P3) — The description's generated blocks still say that the curve dichotomy drops quasi-compactness, and list a merged pull request

This is R01 of the previous review, carried over unrepaired.

- **Location.**
  - The `roadmap-summary` block of the description contains two sentences that are wrong at this head:
    - "The curve dichotomy drops quasi-compactness, degree pullback uses the existing bundle degree and generic rank, and citations identify pinned declarations."
    - "Quasi-compactness follows from the other curve hypotheses."
  - The `merge-order` block begins "**Merge order.** #1276 (SchemeAndStackFoundations) → **this pull request** (#1656)". Its shared-folder line begins "`SchemeAndStackFoundations`: #1276 → **this pull request**".
- **Claim.**
  - The curve dichotomy keeps `QuasiCompact`, as it does on main.
  - #1276 is merged, so it is not part of the merge order.
  - The free-text part of the description is now accurate. It says that `Curve.isAffine_or_isProper` "keeps main's statement, including `QuasiCompact`". So the generated summary contradicts the free text below it.
- **Witness.**
  - `Suggested.lean:735` reads `[QuasiCompact (X ↘ Spec (.of k))]`. Main's `Suggested.lean:706` has the same binder.
  - #1276 is commit `c20f72af` on `origin/main`, and `roadmaps list` does not list it as open.
- **Repair.**
  - Regenerate the `roadmap-summary` block from this head. If it is edited by hand, delete both quasi-compactness sentences. Optionally replace them with "the curve dichotomy keeps main's statement; its docstring writes finite type as `LocallyOfFiniteType` with `QuasiCompact`".
  - Regenerate the `merge-order` block so that #1276 is gone. The shared-folder order then reads: this pull request → #1807 → #1808 → #1854.

## Previous findings

- **R01 — not repaired.** The `roadmap-summary` block still contains "The curve dichotomy drops quasi-compactness…" and "Quasi-compactness follows from the other curve hypotheses." The `merge-order` block still begins "#1276 (SchemeAndStackFoundations) → **this pull request**". See R01 above.
- **R02 — repaired.** `README.md:6681` now reads "for `X` proper and `Y` separated and locally of finite type over `Spec A`". It is followed by a reduction to 0A42 through a quasi-compact open `V ⊇ g_0(X_0)` (`:6687–6697`) and a Check on `∐_{m ∈ ℕ} 𝔸¹_A` (`:6713`).
- **R03 — repaired.** `README.md:6472` locates the obstruction at "Stacks, Lemma 92.23.1 (08V5), part (1), for `X_A → Spec A ⊂ Spec A'` and `G = O_X ⊗_k I`". It adds 05YV, 08LI, 06AG (17) and (6), 08T3, 08R5, 0D14 (1)–(2), and the Čech route.
- **R04 — repaired.** `README.md:975` says that "the dual and hull statements assume `X` integral, as Lemmas 0AY4 and 0AY2 and Remark 0EBH do". The cusp Check is at `:1024–1030`.
- **R05 — repaired.** `README.md:3084–3086` defines the coverings as "the families `{V_i → V}` of étale morphisms over `F` that are jointly surjective, `|V| = ⋃ φ_i(|V_i|)`", citing 03G0, condition (3).
- **R06 — repaired.** `README.md:3745–3768` has ten bullets, one test each. They include the Galois-groupoid Check for `Stack.quotient` (`:3751`) and the square-root-stack Check for `rootStack` (`:3764`).
- **R07 — not repaired in this folder at this head; settled, not raised again.** `Suggested.lean:148` still declares `Ring.IsJapanese.of_complete_local`, as main does.
  - The description says that #1807 makes it a README target, and #1807 comes after this pull request in the same folder. That is true at #1807's head (`afdd14a`):
    - its `Suggested.lean` declares only `Ring.IsNagata.of_complete_local` (line 96);
    - its README italicises *Ring.IsJapanese.of_complete_local* (lines 1394, 1467, 7157);
    - line 1467 resolves the name through `TauCeti.Ring.IsNagata.isJapanese`.
  - Under the overlap rule, this pull request does not restate what #1807 changes.
- **R08 — repaired.** `Suggested.lean:461` reads "Stacks, Lemma 59.63.1 (0A3K), part (1)." `:539–542` gives Bhatt–Scholze, Proposition 4.2.8 (local weak contractibility) and then Proposition 3.2.3 (1) (repleteness).

## Verified sound

### Gate, dependency check and elaboration

- **Worker's gate.** At `7512edb` every counter is 0, including `build=0`, and the result is OK.
- **My rerun** (`gate … SchemeAndStackFoundations --base origin/main`, exit 0):

      gate SchemeAndStackFoundations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

- **Dependency check** (`gate --depcheck … --movable --pr 1656`, exit 0), verbatim:

      depcheck: 235 roadmaps, 2133 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` exits 0 in 28 s. Its output is 48 lines, all of them ``declaration uses `sorry` ``.
- **Signatures.** The diff of `Suggested.lean` changes three docstrings and no statement. I compared the elaborated types at this head (`signatures.md`) with main and with the README:
  - `Etale.artinSchreier_vanishing` keeps `[IsAffine X] [CharP Γ(X, ⊤) p]` and `2 ≤ q`, which is exactly 0A3K (1).
  - `Proetale.isReplete_proetale` is unchanged.
  - `Formal.algebraize_hom` keeps `[IsProper fX] [IsSeparated fY] [LocallyOfFiniteType fY]` over an `AdicRing`, whose `complete : IsAdicComplete ideal carrier` field the reduction uses. It now agrees with `README.md:6681`.
  - No section binder is lost. The one-tactic probe of the previous review still applies, since no declaration was added and no statement changed.
- **Changes against main.**
  - `git diff --numstat origin/main...HEAD` gives README 1298/331 and `Suggested.lean` 49/21. That is 1,347/352, as the description says.
  - Nothing outside the folder changes.
  - The description's claims that the three touched statements, and `Curve.isAffine_or_isProper`, are main's are true. I compared against main's `Suggested.lean`, lines 437, 515, 704 and 919.

### Locators of the changed passages, read in the Stacks chapter texts

| Locator | What the source says | README use |
|---|---|---|
| 0AY2, 0AY4, Remark 0EBH (Divisors lines 853–857, 874–875, 879–882) | Each is stated for integral locally Noetherian `X` (injectivity of `F → F^{∗∗}` iff torsion free; `Hom(F, G)` reflexive for reflexive `G`; hull left adjoint to the inclusion) | §0.6 dual and hull, now at integral generality: correct |
| 03ED, 03G0 (Properties of Spaces lines 1193–1202, 1214–1223) | 03G0 (3): `{U_i → U}` covers iff `|U| = ⋃ φ_i(|U_i|)` | §1.10: correct |
| 044V (Groupoids in Spaces lines 1289–1293) | `Isom(π(x′), π(y′)) = S′ ×_{(y′, x′), U×U} R` | §1.21 Galois groupoid: `R → X ×_ℝ X` is an isomorphism, so the Isom sheaves are subsingletons (locally, then globally): correct |
| 03C5 (Groupoid Schemes lines 1842–1849) | `M` represents `U/R` under (1) equalising, (2) a τ-surjection `h_U → h_M`, (3) a surjection `h_R → h_{U ×_M U}` | `M = Spec ℝ`, `U = Spec ℂ`: (1)–(3) hold, and (3) is an isomorphism: correct |
| 0A3J, 0A3K (Étale Cohomology lines 4438–4447) | 0A3J is the Artin–Schreier paragraph; 0A3K (1) is affine of characteristic `p` with `H^q = 0` for `q ≥ 2` | Docstring at `:461`: correct |
| 08V5 (1) (Cotangent Complex lines 1752–1758) | For thickenings of ringed topoi, a canonical `ξ ∈ Ext²(L_f, G)` vanishes iff a solution exists | §4.6: correct with the next two rows |
| 05YV (More on Morphisms lines 134–142) | A square-zero, quasi-coherent extension of `O_X` gives a scheme | §4.6: a solution is a scheme |
| 08LI (Deformation Theory lines 704–712) | For a strict morphism of thickenings and `F` flat over `S`: `F′` is flat over `S′` iff `f^*J ⊗ F → IF′` is an isomorphism | `I ⊗_A O_{X_A} → O_X ⊗_k I` is an isomorphism because `m_A I = 0`, so the solution is flat over `A′` |
| 06AG (6), (17) (More on Morphisms lines 1245–1283; tags 06AM, 06AY) | Separated or smooth for `f` iff for `f′`, for a flat finite-order thickening | `X ⊂ X_A` over `Spec k ⊂ Spec A`, with `A` Artinian: correct |
| 08T3, 08R5 (Cotangent Complex lines 1783–1788, 847) | `L_{B/A} ≅ L_{X/Y}|_U`; `L_{B/A} = Ω_{B/A}[0]` for smooth `A → B` | `Ext²(Ω_{X_A/A}, O_X ⊗ I) = H²(X, T_X) ⊗ I`: correct |
| 0D14 (1), (2) (Deformation Theory lines 1209–1215) | Torsor under `Ext¹(NL, f^*C)`; automorphisms are `Ext⁰` | On an affine overlap, `Ext¹ = H¹ = 0` and automorphisms are `Γ(T_X ⊗ I)`: correct |
| 01K4 (Schemes lines 1606–1611) | Quasi-compact iff preimages of an affine cover are quasi-compact | A quasi-compact open `V` is quasi-compact over the affine `Spec A`: correct |
| 02IL (Properties lines 251–253) | Every point of a locally Noetherian scheme specialises to a closed point | §4.10 reduction: correct |
| 05GI (4) (Algebra lines 10601–10609) | `IR^∧` lies in the Jacobson radical of `R^∧` | Every maximal ideal of the complete `A` contains `I`: correct |
| 0A42 (Cohomology of Schemes lines 3604–3627) | `X` proper, `Y` separated of finite type: a unique `g` with the given reductions | §4.10, now cited for `Y` of finite type, with the reduction for `Y` locally of finite type: correct |
| bhatt-scholze-2014 lines 798–799 and 1361 | Proposition 3.2.3 (1): a locally weakly contractible topos is replete. Proposition 4.2.8: `Shv(X_proét)` is locally weakly contractible | §2.17 and the docstring at `:539–542`: correct |

### Seeded sample

- Only "1.10 The small étale site of an algebraic space" falls in a changed passage. Its changed covering sentence is checked above. The rest of §1.10 (03G7, 03G2, 03LP, 00XJ) is untouched and was checked by the previous review.
- The other fourteen sampled sections (§§0.5, 1.1, 1.8, 1.9, 1.14, 2.4, 2.9, 2.13, 2.15, 2.19, 3.3, 4.17, 5.4, 5.9) are untouched by the diff. An incremental re-review does not reopen them.

### Duplication, overlaps and ownership

- The diff introduces no new object or Lean name. Every new citation is to Stacks or to Bhatt–Scholze.
- `citations.md` lists no cross-roadmap citation that is found nowhere. Its Lean-name leads for the changed sections (`Formal.algebraize_hom`, `IsReflexive.locallyFree`, `IsReflexive.two_le_depth_stalk`, `Proetale.isReplete_proetale`) are this roadmap's own names. They are declared in `Suggested.lean` or are README-only targets.
- `overlaps.md` lists no dropped id and no id that only an open revision defines.
- #1807, #1808 and #1854 change this folder. The description orders all three after this pull request (apart from the stale #1276, see R01). #1807's handling of R07 is quoted under "Previous findings".

### Remarks on untouched text (no change requested)

- §0.6 cites `isReflexive_iff_forall_affine` to 0AY0 and `isReflexive_iff_forall_stalk` to 0AY3. Both lemmas are stated for integral `X` (Divisors lines 839, 858). The changed hypotheses sentence puts integrality only on the dual and the hull.
  - Both criteria do hold on every locally Noetherian `X`. Stalks of `Hom` from a coherent sheaf commute with taking `Hom` of stalks, and every point specialises to a closed point (02IL). So nothing is false.
  - The clause "stated there for integral `X`", which the README already uses for 0AVU, would match the source.

### Adversarial table (computed values)

The rows for statements the diff changes come first, with values computed in this round. The remaining rows are carried from the previous review (at `aa653e5`); those statements are untouched.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| §0.6 `IsReflexive.dual`, `reflexiveHull` (integral) | cusp `A = k[t²,t³]`, `m = t²k[t]`; `A ⊕ A/m` on the cusp; non-integral `B = k[x,y]/(x²,xy,y²)`, `F = k` | `(A:m) = k[t]` (`t⁻¹·t² = t ∉ A`), `(A:k[t]) = t²k[t] = m`, so `m^∨∨ = m` and `k[t]^∨∨ = k[t]`. `dim m/m² = 2` (`t², t³`), so `m` is not locally free. `(A ⊕ k)^∨∨ = A`, and the unit has kernel `k` (torsion), as 0AY2 says. On `B`: `k^∨ = Ann(m) ≅ k²`, `k^∨∨∨ = k⁸ ≠ k²`, so the dual is not reflexive without integrality | Pass; R04 repaired |
| §1.10 `smallEtaleTopology` coverings | `{Spec ℂ → Spec ℝ}`; empty family over `∅` and over `Spec k`; fold `S ⊔ S → S` | One point of `Spec ℝ` is covered, so it is a covering (it would not be a Nisnevich covering: residue extension `ℂ/ℝ`). The empty family covers `∅` and does not cover `Spec k`. `{j₀, j₁}` covers `T` | Pass; R05 repaired |
| §1.21 `Stack.quotient` | Galois groupoid `Spec ℂ ⊔ Spec ℂ ⇉ Spec ℂ` over `ℝ` | Prestack over `Spec ℝ`: `X(ℝ) = ∅`, so 0 objects. `[X/R]`: Isom sheaves are subsingletons (044V, `j` an isomorphism), and the sheaf of isomorphism classes is `Spec ℝ` (03C5), so there is 1 object and `[X/R] ≃ Spec ℝ` | Pass; R06 repaired |
| §1.21 `BG` Check | `G = ℤ/2` over `ℝ` | `H¹(ℝ, ℤ/2) = ℤ/2`: 2 torsors (`Spec ℝ ⊔ Spec ℝ`, `Spec ℂ`). The sheaf quotient `pt/(ℤ/2) = pt` has 1 section | Pass |
| §1.21 `rootStack`, square-root Check | `X = 𝔸¹`, `L = O`, `s = t`, `n = 2`, including characteristic 2 | Chart `[Spec k[u] / μ_2]`; stabiliser `μ_2` at `u = 0`. Over `t ≠ 0`, `k[u^±] ⊗_{k[t^±]} k[v^±] = k[u^±][ζ]/(ζ² − 1)` with `ζ = v/u`, a `μ_2`-torsor in every characteristic, so the map to `𝔾_m` is an isomorphism. The double cover has degree 2 there | Pass; R06 repaired |
| §4.6 `deformations_of_smooth_schemes` | `ℙ¹`; elliptic `E`; affine `U` | `H¹(O(2)) = H²(O(2)) = 0`, so lifts exist and are unique. `H⁰(O(2)) = k³` = infinitesimal automorphisms. `H¹(T_E) = k`, `H²(T_E) = 0`. On affine `U`, `Ext²(Ω_U, G) = Ext¹(Ω_U, G) = 0`. `G = O_X ⊗_k I ≅ I ⊗_A O_{X_A}`, since `m_A I = 0`, so 08LI gives flatness | Pass; R03 repaired |
| `algebraize_hom` | `Y = ∐_{m∈ℕ} 𝔸¹_A`, `X = Spec k[[t]]`; `X = ℙ¹_A` into the same `Y`; `X = ∅`; non-complete `k[t]`, `I = (t)` | One point `X_0` lands in one copy `V`, and `(a_n) ↦ a = lim a_n ∈ A`. Connected `ℙ¹_A` lands in one copy, and `Γ(ℙ¹_A, O) = A` gives a constant `a`. `X = ∅` has the unique empty `G`. For `k[t]`, the maximal ideal `(t − 1) ∌ t`, so a closed point lies outside `X_0`; this is excluded by `AdicRing.complete` | Pass; R02 repaired |
| `artinSchreier_vanishing` (docstring) | `Spec 𝔽_p`; `Spec 𝔽_p(t)`; `Spec ℤ/p²` | `H¹ = ℤ/p`, `H² = 0`. `cd_p ≤ 1`, so `H^{≥2} = 0`. `CharP (ℤ/p²) p` fails, so it is excluded. This is 0A3K (1) | Pass; R08 repaired |
| `isReplete_proetale` (docstring) | the route | Proposition 4.2.8 (locally weakly contractible), then Proposition 3.2.3 (1) (replete) | Pass; R08 repaired |
| §0.6 `coherent_hartogs`, extension (carried) | `Spec k[t]`, `F = k[t] ⊕ k[t]/(t)`; `𝔸²∖0`; two planes in `𝔸⁴` | `F^∨∨ = k[t]` against `k[t,t⁻¹]`. `Γ(𝔸²∖0, O) = k[x,y]`. Depth 1, `j_*O_U = k[x,y] × k[z,w] ≠ O_X` | Pass (previous review) |
| `exists_linear_normalization` (carried) | `𝔽₂[X,Y]/(XY(X+Y))`; `z = x²+xy+y²`; `k[X,E]/(E²)`; `A = k`; `A = k×k` | `A/(ℓ) ≅ k[T]` for each `ℓ`. `x³ − zx = 0`. `d = 1`, basis `1, E`. `d = 0`. `d = 0`, rank 2 | Pass (previous review) |
| §0.23 dichotomy Checks (carried) | `𝔽_{p²}/𝔽_p`; cusp; node | 2 points over 1. 1 point over the origin. `t = ±1` over the node | Pass (previous review) |
| `smallEtaleBaseChange_isEquivalence` (carried) | `Spec k → Spec k[ε]`; `Spec 𝔽_{p²} → Spec 𝔽_p` | Equivalence by 04DZ. 2 endomorphisms against 4 | Pass (previous review) |
| §0.27 flat extension (carried) | `ℤ→ℤ[1/2]`; `k[x,y]→k[x]`; `ℤ/4→ℤ/2`; `⊕ℤ` over `ℚ` | `(12) ↦ (3)`. `(x²)` against `(x)`. `0` against `ℤ/2`. `0` against `ℚ` | Pass (previous review) |
| §0.28 quotient comparisons (carried) | `ℙ¹`, two points; `𝔸²∖0 → 𝔸²` | `k` against `k × k`. `k` against `0` | Pass (previous review) |
| §1.5 `quotientSheaf.restrict` (carried) | `R = ∅`, `U′ = U ⊔ U`; `Δ ⊔ Γ`; quadratic `L/K` | 2 points against 1. `Γ ∩ Δ = ∅`. Presheaf `∅`, sheaf a point | Pass (previous review) |
| §2.23 equivariant cohomology (carried) | point, `ℤ/2`, `F = ℤ`; `Γ = ℤ`; `Γ = 1` | `ℤ, 0, ℤ/2, 0, …`. `ℤ^ℤ` against `ℤ[ℤ]`. Equivalence | Pass (previous review) |
| `isAffine_or_isProper` (carried) | `𝔸¹`; `ℙ¹`; doubled origin | Affine, not proper. `Γ = k`, proper. Not separated, excluded | Pass (previous review) |
| `genus_baseChange` (carried) | `ℙ¹_k`; `ℙ¹_L` over `k`; `y² = x^p − t` | `g = 0`. `[L:k] > 1`, excluded. `g = (p−1)/2` | Pass (previous review) |
| `vectorBundleDegree_pullback` (carried) | `z ↦ z²`, `O(1)`; `O^r`; `ℙ¹ ↪ V(z²)` | `2 = 2·1`. `0 = 2·0`. Not integral, excluded | Pass (previous review) |
| §3.3 Ext–Hom duality (carried) | nodal cubic, `K` at the node; `U = O_X` | `2` against `1`. `Ext¹(O,V) = H¹(V)` | Pass (previous review) |
| §3.6 Picard torsors (carried) | real conic; elliptic `E` | Cokernel `ℤ/2 = Br ℝ`. `Pic^d ≅ E` | Pass (previous review) |
| §4.5 obstruction theory (carried) | `k[[t]]/(t²)`; `ε ↦ 2ε` over `ℚ` | `dim O ≥ 1`. `v = 4v ⇒ v = 0` | Pass (previous review) |
| §4.9 formal functions (carried) | `Spec A`; `ℙ¹_A` | `M^∧ = lim M/IⁿM`. `H⁰ = A` | Pass (previous review) |
| `grothendieck_existence` (carried) | `X = Spec A` | Finite over the complete `A` | Pass (previous review) |
| `Ring.IsNagata/IsJapanese.of_complete_local` (carried) | `k[[x,y]]`; `ℤ_p`; a domain | Nagata; Japanese through `IsNagata.isJapanese` (probe exit 0) | Pass; R07 settled by #1807 |
| `IsQuasiExcellentRing.isNagata` (carried) | `ℤ`; a field | `IsGRing ∧ IsJ2` gives Nagata | Pass (previous review) |
| `artinBootstrap` (carried) | `F = U`; `Spec L → h_{Spec K}` | An algebraic space; 04S6 (3) | Pass (previous review) |
| `torsorRepresentability`, `Torsor.trivial_iff_section` (carried) | `P = G`; `Spec ℂ/ℝ` | Identity section. No `ℝ`-point | Pass (previous review) |
| `noetherianSpace_vanishing` (carried) | point; `ℙ¹` | `H^{>0} = 0`. `H¹(O(−2)) = k`, `H² = 0` | Pass (previous review) |
| `isAffine_of_H1_vanishing` (carried) | `ℙ¹`; `𝔸²∖0` | `H¹(O(−2)) = k`. `H¹(O)` infinite-dimensional | Pass (previous review) |
| `flat_over_dedekind` (carried) | `S ⊔ 𝔸¹_S`; `k[t,x]/(x², tx)` | Flat. Torsion, excluded | Pass (previous review) |
| `genus_of_finite_etale` (carried) | `[n]` on `E`; genus-2 double cover; `Y ⊔ Y` | `0 = n²·0`. `3 − 1 = 2·1`. Excluded by `hX` | Pass (previous review) |
| `intersectionNumber` (carried) | `ℙ²`, `O(1)²`; `ℙ¹×ℙ¹`, `(1,0)²` | `1`; `0` | Pass (previous review) |
| `hodge_index` (carried) | `H = (1,1)`, `D = (1,−1)`; `H = (1,0)` | `H² = 2`, `D·H = 0`, `D² = −2`. `H² = 0` excluded | Pass (previous review) |
| `weil_bound` (carried) | `y²+y = x³` over `𝔽₂`; `ℙ¹/𝔽_q` | `0 ≤ 2√2`; `0 ≤ 0` | Pass (previous review) |
| `node_local_structure_dvr` (carried) | `a = 0`; `a = επⁿ` | Identity. `u ↦ εu′` | Pass (previous review) |
| `alteration_theorem` (carried) | `𝔸¹`, `Z = 0` | `ℙ¹`, `B = {0,∞}` | Pass (previous review) |
| `semistable_alteration_theorem` (carried) | `ℤ_p[x,y]/(xy − p²)` | One blow-up; `uv = p` | Pass (previous review) |
| Keel–Mori, duality, Brauer class, `Pic^d`, Schlessinger, GRR (carried) | the pins | No carrier at either pin; the docstring is accurate | Pass (previous review) |

## Not verifiable

- **Uncertified and not read:** Hartshorne 1977 and de Jong 1996. They are cited in untouched sections, and the diff does not touch them.
- **Not opened this round:** Grothendieck 1957 (§2.23) and Cadman 2005 (§1.21). The changed §1.21 Checks rely only on the Stacks lemmas above, not on Cadman.

## Source issues

- **Misprint** in stacks-project at More on Morphisms, Section 37.2, paragraph before Lemma 37.2.2 (05YV), p. 3: the source calls `X′` an "nth order thinking"; it should say "nth order thickening"; affects nothing.
- **Misprint** in stacks-project at More on Morphisms, Lemma 37.2.2 (05YV), p. 3: the statement uses `f⁻¹O_S` without naming `f`; it should say that `f : X → S` is the structure morphism; affects nothing.
- **Gap** in stacks-project at Cohomology of Schemes, Lemma 30.28.3 (0A42), p. 76: the source omits the proof that `g` is unique; it should note that the equaliser of two such `g` contains every `X_n`, hence equals `X` by Krull intersection at points of `X_0`; affects the proof.

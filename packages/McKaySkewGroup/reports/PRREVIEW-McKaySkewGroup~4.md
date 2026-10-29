# Review of McKaySkewGroup (pull request #223 at 0b393ea)

**Verdict:** needs changes

Incremental re-review of the 94 lines changed since 4b2d3c1 (README §§2.2, 6.3, 7.5, the summary paragraph, two supplier-contract bullets, and one docstring of `Suggested.lean`), together with everything that cites or is cited by them. The three companion Lean files and every theorem statement of `Suggested.lean` are byte-for-byte unchanged since the previous review, so the previous findings about them carry forward unchanged. Two findings remain: one P1 carried forward, one P3 carried forward. Nothing in the changed passages introduced a new defect.

## R01 (P1) — The companion files still admit data, use forbidden imports and fail elaboration

**Location:** `TauCetiRoadmap/McKaySkewGroup/CBHTraceControls.lean:132–133` (`scalarStarRepresentation … := sorry`); `McKayClassificationTargets.lean:38–39` (`canonicalClassEquiv … := sorry`), `:45–46`; `GeometricMcKayTargets.lean:351–354` (`clusterScheme`, `resolution`, `resolutionMap` all `:= sorry`); `GeometricMcKayTargets.lean:2,6–11` (`import TauCetiRoadmap.AlgebraicVectorBundles.Suggested`, six `Mathlib.<submodule>` imports).

**Claim:** The brief applies the Lean form rules to each `.lean` file in the folder. These three files contain sorry'd data (`def`/`noncomputable def` with body `sorry`), statements that mention that data, imports of another roadmap's module and of Mathlib submodules, and catalogues of small controls. The worker's gate reports `sorry-data=0 imports=0 mathlib-subimports=0` because it scans only `Suggested.lean`; the targeted build does not import these files.

**Witness:** `git diff --stat 4b2d3c1 HEAD -- TauCetiRoadmap/McKaySkewGroup` lists only `README.md` and `Suggested.lean`. A scratch copy of `CBHTraceControls.lean` elaborated with `lake env lean` at this head stops at the 100-error limit (first error at its line 46: `DeformedPreprojectiveAlgebra` unknown; line 47: `deformedPreprojectiveIdeal` unknown).

**Repair:** Delete the three companion files; keep the nine acceptance theorems of `Suggested.lean`, which elaborate on their own (nine `sorry` warnings, no error). Their small controls already live in the README as Checks (for instance the matrix-unit commutator `E₁₀E₀₁ − E₀₁E₁₀ = diag(−1, 1)` of §5.2). Do not replace the admitted schemes, equivalences or representations by empty predicates.

## R02 (P3) — The source manifest is still absent

**Location:** `TauCetiRoadmap/McKaySkewGroup/` (folder listing: `README.md`, `Suggested.lean`, three companion files, `metadata.toml`); `README.md:2153` (`## References`).

**Claim:** The README cites sixteen works (thirteen bibliography entries plus the inline Isaacs, Conze and Tikaradze citations), and §7.5 now cites two locators of KV00, but there is no `sources.toml`, so no source identity, access status or version-specific locator is recorded.

**Witness:** `ls TauCetiRoadmap/McKaySkewGroup/sources.toml` fails. The folder is otherwise unchanged in shape since 4b2d3c1.

**Repair:** Add `TauCetiRoadmap/McKaySkewGroup/sources.toml` (schema `tauceti-roadmap-sources/v1`) with one key per work, the locator scheme and locator, `cited_for`, and the service-recorded access fields; preprint and published versions of one paper in one entry with a version note; paywalled works recorded as `uncertified`. Test the KV00 entry against §7.5's two locators (`§1.1, p. 2` and `§2.1, p. 5` of arXiv math/9812016v2) and the FKS05 entry against §6.5's arXiv v1 p. 30. No source text goes into the repository.

## Previous findings

- R01 — not repaired: the three companion files are unchanged since 4b2d3c1; `CBHTraceControls.lean:133`, `McKayClassificationTargets.lean:39` and `GeometricMcKayTargets.lean:351–354` still end in `:= sorry`. Re-raised as R01 above.
- R02 — repaired: `README.md:1478–1488` now takes the central inputs `Ωe_c` and `Ω(e_c + e_l)` with lifts `Ω(E^c₁₁ + E^c₂₂)` and `Ω(E^c₁₁ + E^c₂₂ + E^l₁₁)`, keeps `θ(e) = 1`, and tests centrality against degree-one arrows and group elements; a separate bullet records that `e_c` and `e_c + e_l` are not central (`e_c a = 0`, `a e_c = a`). Values recomputed in rows N03–N04 below; no new problem.
- R03 — repaired: `README.md:740–747` now states additivity for every `t` and surjectivity, the kernel `ℤδ` and form preservation only under `t.Valid`; `README.md:760–762` adds the `.A 0` negative control; `Suggested.lean:159–163` docstring says the same. The definition's body is unchanged and total. Values in rows N01–N02; the five `.A 0` facts elaborate by `decide` at the pin.
- R04 — repaired: `README.md:295–297` no longer attributes averaging images to AlgebraicVectorBundles; §7.5 (`README.md:1990–2008`) now constructs the sheaf Reynolds projection, its finite locally free image and kernel, naturality and the pullback comparison, then applies it to `ρ_i* ⊗ R`; `README.md:2047–2059` adds the `ℂ[ε]/(ε²)`, trivial-group, two-point, `S₃` and `Q₈` Checks; `README.md:179–184` and `:2061–2065` cite the pinned Mathlib averaging declarations and L0A–L0C. Values in rows N05–N11; the cited declarations exist at the pins (below); no new problem.
- R05 — not repaired: no `sources.toml` in the folder. Re-raised as R02 above (P3, not blocking).
- R06, R07 of the review before last — repaired at 4b2d3c1 (recorded in the previous report); the passages are untouched by this diff.

## Verified sound

The scope of this pass is the diff and what depends on it; everything else is carried from the previous report (PRREVIEW-McKaySkewGroup~3), whose rows are cited by ID below.

Head, gate and build:

- Head `0b393eac50515b396fda9aef611e4040ac99c01a`; worktree clean; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/McKaySkewGroup'` is empty.
- The gate rerun at this head: every counter `0`, `OK`. The worker's record adds `build=0`.
- The dependency check (`gate --depcheck … --movable`) printed `depcheck: 200 roadmaps, 1308 edges, 0 problem(s)`; no UPWARD or CYCLE line, no `moved:` line.
- `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` appended for all 24 declarations (9 theorems, 15 definitions/instances): 9 `declaration uses 'sorry'` warnings, no error, no other warning. Every elaborated type was compared with its README statement: unchanged since the previous review (the only diff is the `rootLatticeQuotientMap` docstring); `exists_repRing_addEquiv_of_isMcKayLabelling` carries `ht : t.Valid`, matching the repaired §2.2 API; `Finite G`, the faithful two-dimensional determinant-one hypotheses and `IsGraphical` are all in the signatures. Nothing changed.
- The same scratch file closed, by `decide`, the five facts the new `.A 0` Check relies on: `¬ (A 0).Valid`, `(A 0).nodes = 1`, `(A 0).finiteType.rank = 0`, `(A 0).cartanMatrix 0 0 = 2`, `(A 0).marks 0 = 1`.
- One-tactic padding probe: no theorem statement changed since the previous report, whose probe (`simp`, `rfl`, `infer_instance` on each of the nine theorem bodies; no closure) carries forward. The three `*Aut` definitions and six instances have real bodies and are the definitions the Layer 4 headlines need.

Pinned-library declarations opened for the changed passages (paths relative to the named library):

| Pinned file and line | Content checked |
| --- | --- |
| Mathlib `RepresentationTheory/Invariants.lean:73` | `Representation.invariants` over `[CommRing k] [Group G]`. |
| Mathlib `RepresentationTheory/Invariants.lean:121,126,141` | `[Fintype G] [Invertible (Fintype.card G : k)]`; `averageMap`; `isProj_averageMap : LinearMap.IsProj ρ.invariants ρ.averageMap`. The README's "finite Γ and invertible group order" matches. |
| Mathlib `Algebra/Module/Projective.lean:164` | `Module.Projective.of_split`: a module with a section into a projective module is projective, as used for the two summands. |
| Tau Ceti `LinearAlgebra/RootSystem/AffineDynkinType/Basic.lean:542` | `marks_affineNode : t.marks t.affineNode = 1` for every `t`, the "affine mark is 1" clause of §2.2. |
| Tau Ceti `LinearAlgebra/RootSystem/AffineDynkinType/Deletion.lean:131,160,188,262,384` | `bourbakiNode`; injectivity, `≠ affineNode` and range equal to the complement of the affine node, all under `t.Valid`; the valid-type principal-submatrix theorem. These are exactly what the kernel and form-preservation bullets need, and why `Valid` is the right hypothesis. |

Cross-roadmap and source citations in the diff, resolved against their current text:

| Citation | Resolved location and what it supplies |
| --- | --- |
| AlgebraicVectorBundles L0A, L0B, L0C | main `TauCetiRoadmap/AlgebraicVectorBundles/README.md:215,228,254`: tensor–Hom adjunction (L0A); `FiniteLocallyFreeSheaf`, pullback, locally constant rank, and the affine restriction of `tildeEquiv` to finite projective modules (L0B); determinants (L0C). No averaging construction there, as §7.5 now says. |
| CharacterTheory Layers 2–3 | main `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:221,241`: Wedderburn blocks `∏ Matₙᵢ(k)` with `∑ nᵢ² = |G|`, primitive central idempotents. These give the matrix-block decomposition and the regular multiplicities `δ_i` used in §7.5. |
| KV00 §1.1, p. 2 | `KV00 line 53–54` (arXiv math/9812016v2): `V_ρ = Hom_G(ρ, V)`, the convention `T_i = Hom_Γ(ρ_i, R)` the README adopts. |
| KV00 §2.1, p. 5 | `KV00 line 185–194`: the Proposition (vertices of the finite diagram ↔ components of the exceptional set; affine vertices ↔ irreducibles) and the Lemma (`E_π` restricted to `P¹_ρ` is `O^{d_π}` for `π ≠ ρ` and `O(1) ⊕ O^{d_π−1}` for `π = ρ`); its proof credits the degree computation to GSV83, as the README says. |

Ownership: the sheaf Reynolds image is now owned here. A search of main and the open heads (`roadmaps grep` for Reynolds/averaging projections on sheaves) found no other roadmap constructing a Γ-invariant subsheaf of a finite locally free sheaf; ReflectionInvariantTheory §1 owns the Reynolds operator on polynomial rings only, which §7.1 cites separately. No open pull request's `Suggested.lean` declares the fully qualified names of this file. Ownership against open pull requests not listed in the brief was not checked.

Adversarial pass on the changed statements (values computed on both sides):

| ID / statement | Instances and computed values | Result |
| --- | --- | --- |
| N01 §2.2 API with `Valid` | `.A 0` (invalid): `C = [2]`, `δ = [1]`, finite rank 0; `x = y = [1]`: affine form `2`, image form `0`; the API's third bullet is now guarded by `t.Valid`, which fails here. `Ã₁` (valid): `x = (1,0)` affine form 2, image −1, finite form `2·(−1)² = 2`; `x = (0,1)`: 2, 1, 2; `x = δ = (1,1)`: 0, 0, 0. | Retain; the `.A 0` Check now records the necessity of validity, and `[2] ≠ [0]`, so it is not the trivial-group matrix. |
| N02 §2.2 kernel and surjectivity under `Valid` | Kernel: `x_i = x_0 δ_i` at every non-affine node, and `δ_0 = 1` (`marks_affineNode`), so `x = x_0 δ`; needs `range_bourbakiNode` (Valid) to cover every non-affine node. Surjectivity: `q(e_{b(i)})_j = δ_ij − 0` since `b(i) ≠ affineNode` (Valid). | Retain with `Valid`; both pinned lemmas exist at `Deletion.lean:188,262`. |
| N03 §6.3 central inputs | `Ω = x ∧ y`; `Ωe_c = e(Ωz_c)e` with `z_c = E^c₁₁ + E^c₂₂` central in `ℂ[Γ]`; `θ(Ωe_c) = Ωz_c`. Centrality of `Ωz_c` in `Λ(V) ⋊ Γ`: against degree-one `w`, both products land in exterior degree 3 = 0; against `1 # h`: `(1#h)(Ωz_c) = (h·Ω) z_c # h = Ω z_c h = Ω h z_c` since `det = 1` fixes Ω. For `e_c + e_l`: `z_l = E^l₁₁`, lift `Ω(E^c₁₁ + E^c₂₂ + E^l₁₁)`. `θ(e) = 1`. | Retain; R02 of the previous report repaired. |
| N04 §6.3 non-central vertex idempotents | Arrow `a = e_l a e_c : c → l` (later factor first): `e_c a = e_c e_l a e_c = 0`, `a e_c = a`. Arrow `b = e_{l′} b e_c`: `(e_c + e_l) b = 0`, `b(e_c + e_l) = b`. | Retain as negative control. |
| N05 §7.5 projector over `ℂ[ε]/(ε²)` | `S = [[0,1],[1,0]]`, `P = (I+S)/2 = ½[[1,1],[1,1]]`; `P² = P` (computed); `im P = A(1,1)`, `ker P = A(1,−1)`; `det[[1,1],[1,−1]] = −2`, a unit in `A`; `(I+S)² = [[2,2],[2,2]] = 2(I+S) ≠ I+S`. Mod ε: same rank-one image over ℂ; `ℂ = A/(ε)` is not flat over `A`. | Retain; all five values match the Check. |
| N06 §7.5 trivial group and two points | `Γ = 1`: `P_F = (1/1)·id = id`, image `F`, also for `F = 0`. Two points, `F = O²`, `C₂` trivial at one point (`P = I`, rank 2) and `−id` at the other (`P = (I − I)/2 = 0`, rank 0). `Γ = 1` on `Γ-Hilb(V) = V`: `R = O_Y`, `T_triv = O_Y`, evaluation `O_Y ⊗ O_Y → O_Y` multiplication, rank 1. | Retain; locally constant but non-constant rank exhibited. |
| N07 §7.5 `S₃` on `O³` | `P = ⅓J`, `J² = 3J`, `P² = (1/9)·3J = ⅓J` (computed); invariants = constant vectors, rank 1; kernel = sum-zero vectors, rank 2; `1 + 2 = 3`. | Retain. |
| N08 §7.5 `Q₈` ranks | `δ = (1,1,1,1,2)`: `Σ δ_i² = 4 + 4 = 8 = |Q₈|`; `Σ δ_i = 6 ≠ 8`. | Retain; the evaluation map is between sheaves of equal rank `Σ δ_i² = |Γ|`, not `Σ δ_i`. |
| N09 §7.5 pullback of the splitting | `f*` is additive and ℂ-linear, so `f*(P_F) = (1/|Γ|) Σ f*(g) = P_{f*F}`; the image of a split idempotent is a direct summand and `f*` preserves direct sums, so `f*(F^Γ) → (f*F)^Γ` is an isomorphism with no flatness; on N05, `f : Spec ℂ → Spec A` nonflat gives rank 1 on both sides. | Retain; L0B's flatness caveat (for internal Hom with a finitely presented source) does not apply to a split summand. |
| N10 §7.5 unit `O_Y → T_triv` | `T_triv = R^Γ` has rank `δ_triv = 1`; fibre of the unit at a geometric point is `K → K[Γ]^Γ`, `1 ↦ 1 ≠ 0`; a fibrewise nonzero map of line bundles is surjective (Nakayama) hence an isomorphism. | Retain. |
| N11 §7.5 fibre of `T_i` | Fibre of `(ρ_i* ⊗ R)^Γ` at a geometric point is `(K ⊗ ρ_i* ⊗ K[Γ])^Γ = Hom_{K[Γ]}(K ⊗ ρ_i, K[Γ])` (via N09 for base change), of dimension the multiplicity of `ρ_i` in the regular module, `δ_i`; `C₂`: `(1,1)`, sum 2; `Q₈`: `(1,1,1,1,2)`. | Retain; rank `δ_i` as stated. |
| N12 `rootLatticeQuotientMap` docstring vs body | Body: `x_{b(i)} − x_0 · δ_{b(i)}`; `Ã₁`, `x = (1,0)`: `0 − 1·1 = −1`; `x = (0,1)`: `1 − 0 = 1`; `x = (1,1)`: `1 − 1 = 0`; `.A 0`: target `Fin 0 → ℤ`, map total. | Retain; docstring now conditions kernel and surjectivity on `Valid`, as the README does. |
| N13 §7.5 `Needs` and supplier contract | Every input named exists: 7.4, 1.1, Layer 2, CharacterTheory Layers 2–3 (main), AVB L0A–L0C (main), three Mathlib declarations (pin, table above), SchemeAndStackFoundations §5.1–5.3 (unchanged citation). | Retain; no upward citation (depcheck 0 problems). |

Rows carried forward from the previous report, for the statements this diff leaves untouched (their instances and values are in PRREVIEW-McKaySkewGroup~3, same IDs): A01–A08 (Layer 0 models, pole equation, classification and conjugacy headlines), A09–A17 (§§1.1–1.2 matrix, highest-root lemma, labelling headlines), A18–A21 (§2.1 ring identities, integral radical, headline), A23–A32 (Layer 3 skew, actions, duality), A33–A37 (§§4.1–4.2 corners, quivers, zigzag), A38–A45 (Layer 5 trace coordinates, CBH), A46–A50 and A52–A60 (Layer 6 curved adapters, reflections, Morita, kernels), A61–A68 (§§7.1–7.4), A69–A71 (§7.5 tautological sign, exceptional lattice, fundamental cycle), A73 (§7.6). A22 and A51 are superseded by N01 and N03–N04; A72 is superseded by N05.

Seeded source sample: of the fifteen targets, only “7.5 Tautological bundles and the exceptional lattice” and “6.3 The Γ-side curved Morita comparison” fall in the diff. For 7.5 the two KV00 locators were re-read at the cache lines above and support the convention and the Proposition/Lemma as restated; the GSV83 and Rei97 locators of the unchanged bullets carry from the previous report. For 6.3 the changed text is a Check whose values are computed in N03–N04; the FKS05 locators are unchanged and carry forward. The other thirteen targets (0.1, 0.2, 1.1, 1.2, 4.1, 4.2, 5.3, 6.1, 6.2, 6.4, 6.5, 7.2, 7.6) are untouched by the diff and carry the previous report's resolutions.

House style on the diff: no LaTeX delimiters, no process words, no pull-request numbers, no absolute paths (gate `latex=0 tex=0 prnum=0 round-labels=0 private-paths=0`); the new Checks are prose and name no Lean counterpart; the summary paragraph's new clause points at an existing section.

## Not verifiable

- The companion files' dependent signatures cannot be certified as Lean statements: their carriers are admitted or unresolved (R01). This is unchanged.
- CBH98 Theorem 0.1, CS03 §6.5, Isaacs Theorem 4.3, Conze99 p. 3 and Spr77 §§4.4–4.5 remain as in the previous report (paywalled or image-only; cited by locator). None of them is touched by this diff, and no new request is raised.

## Source issues

- none new in the changed passages. The FKS05 §8.3 error recorded in the previous report (raw endpoint scalars stated antisymmetric; the dimension-weighted traces are) stands and is unaffected by this diff.

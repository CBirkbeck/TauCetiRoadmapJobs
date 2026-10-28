# GATE-McKaySkewGroup~2: answers to the review of `cdab583`

The review is the single AI review comment posted by CBirkbeck (findings F01–F12), numbered here
H01–H12 in that order. Repairs are in commit `30f098de` on the pull-request branch (not pushed).

## H01 (CBirkbeck) — applied

The scaling claim was wrong for the stated map. `Suggested.lean`, docstring of
`exists_full_corner_equiv_deformedPreprojectiveAlgebra`: "rescaling all arrows by `c` identifies `Π^λ` with `Π^(cλ)`" → "sending every arrow `a` to `c a` and its reverse `a*` to `c a*` is an isomorphism `Π^(c²λ) ≅ Π^λ`". README §5.3 now states both laws: uniform scaling gives `Π^(c²λ)(Q) → Π^λ(Q)`, and scaling only the arrows of `Q` gives `Π^(cλ)(Q) → Π^λ(Q)`. It also adds the reviewer's witness as a Check (`diag(−1,1)` scales to `diag(−4,4)`, the relation at `2²λ`). Over `ℂ` every nonzero uniform rescaling of the weights still gives an isomorphic algebra, because `ℂ` has square roots. The docstring now says that the trace/scalar distinction survives because the factor `δ_i` is not uniform.

## H02 (CBirkbeck) — answered

The finding is correct: `CBHTraceControls.lean`, `McKayClassificationTargets.lean` and `GeometricMcKayTargets.lean` contain `sorry`'d data (`clusterScheme`, `resolution`, `scalarStarRepresentation`, …). The repair is to delete the three files. This job may edit only `README.md` and `Suggested.lean`, so the deletion is left to the worker: `git rm` the three files in the roadmap folder. The README no longer refers to them (the `CBHTraceControls.lean` paragraph of old §5 is gone). Their mathematical content is in the README: the `Q₈` normalization test is in §5.2, and the geometric constructions are in §§7.1–7.5 with signatures in prose. `Suggested.lean` does not import them and contains no `sorry`'d data (gate: `sorry-data=0`).

## H03 (CBirkbeck) — answered

Correct: the three companion modules do not elaborate (unknown constants, missing object file), and the targeted build never covered them. The repair is again to delete them (see H02), which this job cannot do. The retained acceptance file is `Suggested.lean` alone. It builds against the pins, and each of its declarations was elaborated with `#check @name` (see the build section).

## H04 (CBirkbeck) — applied

README §5.3 Checks: the Weyl-algebra nonexistence Check is now stated over a field of characteristic zero, where the trace of a commutator is `0` and the trace of `1` is `dim M ≠ 0` in `k`. It adds the positive-characteristic negative control: `D`, `T` on `k[t]/(tᵖ)` with `[D,T] = 1` give a module of dimension `p`. It also gives the reviewer's `𝔽₂` pair `D = E₀₁`, `T = E₁₀` with `DT − TD = I` (computed: `E₀₁E₁₀ − E₁₀E₀₁ = E₀₀ − E₁₁ = I` over `𝔽₂`). The dimension identity `∑ λ_i dim(e_iM) = 0` is now said to hold in `k`, and in `ℤ` in characteristic zero.

## H05 (CBirkbeck) — applied

`Suggested.lean` now defines `IsMcKayQuiver V Q e` (real body): for all simples `X, Y`, the arrows of `Q` from `e Y` to `e X` and from `e X` to `e Y` together number `dim Hom(X, V ⊗ Y)`. `exists_full_corner_equiv_preprojectiveAlgebra` and `exists_full_corner_equiv_deformedPreprojectiveAlgebra` are restated for every McKay quiver `Q` (`[Quiver.{1} Q] [Fintype Q] [∀ i j, Fintype (i ⟶ j)]`). They replace the old `t.IsGraphical` and orientation hypotheses; `[Nontrivial G]` is dropped because the statement no longer needs an affine type. This covers `C₂` through the Kronecker quiver (`2 + 0 = 2 = dim Hom(sign, V ⊗ trivial)`), every orientation of a graphical type, and the trivial group through the one-loop quiver (`1 + 1 = 2`; both sides `ℂ[x,y]`, resp. the first Weyl algebra for `z ≠ 0`). The zigzag theorem keeps `IsGraphical`, as the reviewer asked: Tau Ceti's `nonisolatedZigzagQuotient` is built on a simple graph. README §4.1 and §5.3 state the same generality and add `C₂`, trivial-group and `Q₈` Checks.

## H06 (CBirkbeck) — applied

`Suggested.lean` adds `rootLatticeQuotientMap t : (Fin t.nodes → ℤ) →+ (Fin t.finiteType.rank → ℤ)`, a real body that sends `x` to `x − x₀δ` read along `bourbakiNode`. It also adds `exists_repRing_addEquiv_of_isMcKayLabelling`: for a McKay labelling by a valid `t`, there is an additive isomorphism `Φ : TauCeti.repRing ℂ G ≃+ (Fin t.nodes → ℤ)` that sends simple classes to basis vectors, turns `[V]·` into `2 − C` and sends `[ℂ[G]]` to `t.marks`. Also: the radical of `r ↦ C Φ r` is `ℤ·[ℂ[G]]`; `rootLatticeQuotientMap ∘ Φ` is onto with kernel `ℤ·[ℂ[G]]`; and the McKay form goes to `t.finiteType.cartanMatrix`. For `C₂` the composite gives trivial ↦ −1, sign ↦ 1, regular ↦ 0, as the reviewer computed; this is now a README §2.2 Check. The "not statable" bullet is removed from the docstring and the README summary.

## H07 (CBirkbeck) — applied

README §3.1: "Define the skew product on the finitely supported carrier `Γ →₀ A`, prove … universal property, associativity, algebra structure" → the skew product is consumed as Mathlib's `SkewMonoidAlgebra`. The supplier contract (From Mathlib) names `SkewMonoidAlgebra.instRing`, `SkewMonoidAlgebra.single_mul_single`, `SkewMonoidAlgebra.liftNCRingHom` and `SkewMonoidAlgebra.liftNCAlgHom`, checked at the pin: `Basic.lean:779, 1042, 742`, `Lift.lean:30`; `single_mul_single` is `single a₁ b₁ * single a₂ b₂ = single (a₁ a₂) (b₁ * a₁ • b₂)`. §3.1 keeps only the equivariant-module equivalence, with three Checks. The sign-action Check `(1#g)(x#1) = −x#g` is retained in §3.2.

## H08 (CBirkbeck) — applied

Layer 7 is rewritten with primary locators, separating source theorems from the comparisons built here:
- `Γ-Hilb(ℂ²)` is irreducible and a crepant (hence minimal) resolution: [BKR01, Theorem 1.2, p. 4] (BKR01 line 122).
- The tautological bundles satisfy `T_i|E_j ≅ O(1) ⊕ O^(δ_i−1)` if `i = j` and are trivial otherwise, giving `deg det T_i|E_j = δ_ij`: [KV00, §2.1, Lemma, p. 5] (KV00 lines 193–202). The incidence of the exceptional curves is [KV00, §2.1, Proposition] (KV00 lines 185–190).
- The numerical fundamental cycle exists and is unique and minimal: [Rei97, §4.5, Proposition, p. 84] (Rei97 lines 3697–3704).
- The exceptional invariant triples: Springer LNM 585 §4.5 (paywalled, cited by locator, uncertified).

The FKS scope is corrected from §§8.1–8.2 to §§8.1–8.3: the endpoint display `ε(h) + ε(h̄) = 0` is preprint §8.3, p. 30 (FKS05 lines 1159–1170). The `C₂` chart Check fixes the positive sign: the sign summand on `E` is `V∗ ⊗ O / O(−1) = O(1)`, degree `+1`, and the convention `Hom_Γ(R, ρ)` would give `−1`.

The `sources.toml` manifest is not created: it lies outside the files this job may edit. Entries to record: Rei99 (arXiv `math/9911165`, read, not cited), KV00 (`math/9812016v2`), BKR01 (`math/9908027v2`), Rei97 (`alg-geom/9602006v1`) and FKS05 (`math/0311485v1`), all fetched through the sources service as open-repository texts. GSV83 (Numdam; the service found no legal copy) is cited only as KV00's attribution. IN96 is not cited.

## H09 (CBirkbeck) — answered

Correct: the three companion files import roadmap modules and Mathlib submodules, and none starts with `import Mathlib`. The repair is to delete them (H02), outside this job's edit set. `Suggested.lean` has the required form: `import Mathlib` followed by the seven pinned `TauCeti.*` modules it uses (gate: `imports=0`, `mathlib-subimports=0`).

## H10 (CBirkbeck) — answered

Correct: `quotientProjection_native` (`rfl`), the projection-invariance and finiteness wrappers, and the sorried boundary theorems `cyclic_one_eq_bot` and `trivial_component_empty` are padding. They go when the companion files are deleted (H02). Their content is now in README Checks: §7.1 "`Γ = 1`: `S^Γ = S`, `X_Γ = V`, `q` the identity"; §7.3 and §7.5 "for `Γ = 1` the exceptional set is empty and the lattice is zero". None was moved into `Suggested.lean`.

## H11 (CBirkbeck) — applied

The README is reorganized into the required shape:
- the title `# Roadmap: …` and a `**Summary.**` paragraph;
- `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` (From Mathlib, From Tau Ceti, From TauCetiRoadmap.X), `## How to read the build`;
- Layers 0–7 with `### k.n` subsections, each target carrying its own `*Needs:*` line, and every layer ending with `### Examples` and `### Dependencies`;
- `## Downstream consumers`, `## Worked examples` and `## References`.

New `**Checks.**` blocks:
- §§6.2–6.5: `s_a` is an involution; the braid relation on `(x_a, x_b)`; `m_aΔ_a(1) = 2X_a − ΣX_b`, so the unit component of `d²` is `s_a(c) − c`.
- The centre lift (§6.3), using the reviewer's matrix-unit case: `θ(e_c) = E^c_11 + E^c_22`, the two-block element, and the noncentral `E^c_12` with `e w e = 0`.
- The Fourier normalization of `μ_a` and the carrier dimension `16δ_a²` (§6.4); the `Q₈` endpoint test and the adjoint rescaling (§6.5).
- §§7.1–7.6, including the reviewer's requested `Γ = 1`, `C₂` exceptional-chart and dual-number cases (§7.4).

Process wording is removed, including "landed native", "existing", "corrected", "secondary source records" and "inspected". The completion-criteria list, which restated the layers, is folded into them.

## H12 (CBirkbeck) — applied

README §7.2: the sentences that commissioned "a terminating finite search space", "exact … certificates" and "Return exact finite polynomial relation and coefficient certificates" are replaced. The new target asks for homogeneous invariants of degrees `(6,8,12)`, `(8,12,18)`, `(12,20,30)` that generate `S^Γ` and satisfy the displayed relations, with the induced isomorphism (Springer §4.5). The route is algebraic independence of the two lowest invariants, freeness over them, and equality of the Hilbert series with Molien's. The fundamental cycle (§7.5) is defined by effectivity, anti-nefness and minimality. Its proof route is mathematical: an anti-nef `Z ≥ Y` with `Y·E > 0` contains `Y + E`, the steps are positive roots, and the only dominant root is the highest root. The `Q₈` Check `X² = Z(Y² − 4Z²)` at `x = 1, y = 2` gives `900 = 4·225` and is kept as a §7.2 Check.

## Build and gate

- `lake build TauCetiRoadmap.McKaySkewGroup.Suggested`: `Build completed successfully (9046 jobs)`. The only warnings are 9 `declaration uses 'sorry'` warnings, one per theorem.
- Gate: `gate McKaySkewGroup: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 162 roadmaps, 1176 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.
- `roadmaps resolve` on the README: no cross-roadmap citations and no Lean names found nowhere.
- Signature check: `#check @name` for all 24 declarations of `Suggested.lean` was appended temporarily to the file and elaborated through the permitted build; the file was then restored. The elaborated types match the README statements:
  - `exists_repRing_addEquiv_of_isMcKayLabelling` keeps `[Finite G]`, `t.Valid` and `IsMcKayLabelling V t e`.
  - The two quiver theorems keep `[Finite G]`, `finrank = 2`, faithfulness, `det = 1`, `[Fintype Q]`, `Fintype` arrows and `IsMcKayQuiver V Q e`.
  - `IsMcKayQuiver` elaborates with free universes for `G` and `Q` and an inferred `Quiver` level.
  - No binder was lost.

## Adversarial pass on changed statements

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| `IsMcKayQuiver` | `C₂` Kronecker; `C₂` one arrow each way; trivial group with one loop; `Q₈`/`D̃₄` | `2+0 = 2`, `1+1 = 2` against `dim Hom(sign, V⊗triv) = 2`; loop `1+1 = 2 = dim Hom(triv, V⊗triv)`; `D̃₄` edge `1+0 = 1` | holds | new definition |
| polynomial corner for every McKay quiver | trivial group; `C₂`; odd `C₃` | `ℂ[x,y] ≅ ℂ⟨a,a*⟩/(aa*−a*a)`; `Sym(ℂ²)⋊C₂` with `f = 1` against `Π(Kronecker)`; `C₃` symmetric relation `Y X = X Y` is preprojective, with no sign obstruction (unlike the exterior case) | holds | `[Nontrivial G]` dropped |
| CBH corner for every McKay quiver | trivial group, `z = c` | `T(V)/([x,y]−c)` against `ℂ⟨a,a*⟩/([a,a*]−c)`; sign difference absorbed by `a ↦ i a`, `a* ↦ i a*` (`c² = −1`) | holds | `[Nontrivial G]` dropped |
| uniform scaling law | star rep `a = E₁₀`, `a* = E₀₁`, `c = 2` | `[a,a*] = diag(−1,1)`, scaled `diag(−4,4) = 4·diag(−1,1)` | `c²λ` is correct and `cλ` false | fixed |
| `exists_repRing_addEquiv_…`, kernel | `Ã₁` | `C(a,b) = (2a−2b, 2b−2a) = 0 ⇔ a = b ⇔ ℤ·(1,1)` | holds | new |
| same, quotient | `Ã₁`, `D̃₄` | `π(1,0) = −1`, `π(0,1) = 1`, `π(1,1) = 0`; `D̃₄`: trivial ↦ `−(1,1,1,2)` = −highest root | holds | new |
| same, form | `Ã₁` sign and trivial | `(0,1)C(0,1) = 2 = 1·2·1`; `(1,0)C(1,0) = 2 = (−1)·2·(−1)` | holds | new |
| same, `[V]·` | general | `Φ(V·ρ_i)_j = dim Hom(ρ_j, V⊗ρ_i) = (2−C)_{e j, e i} = ((2−C) *ᵥ single (e i))_j` | holds with no symmetry used | new |
| same, unused hypotheses | trivial `G` | `IsMcKayLabelling` impossible: `2 = 2 − C₀₀` needs `C₀₀ = 0`, but the diagonal is 2 | `Nontrivial`, `hdim`, `hdet` not needed | omitted |
| Weyl-algebra Check | char 0; `𝔽₂`; `k[t]/(t^p)` | `Tr[D,T] = 0` against `Tr 1 = dim M`; `𝔽₂`: `E₀₁E₁₀ − E₁₀E₀₁ = I`, `Tr I = 2 = 0`; `[d/dt, t] = 1`, dimension `p` | the claim needs char 0 | fixed |
| `Ẽ₈` marks Check | Tau Ceti `e8Edges` | `(Cδ)₀ = 12 − 12 = 0`, `(Cδ)₈ = 2 − 2 = 0`, `Σδ² = 120`; swapping nodes 1 and 3 gives `(Cδ)₀ = 1` | holds | new Check |
| odd-cycle skew parameter | `n = 3`, `4` | ratio factor `(s_{i−1}t_i)/(s_i t_{i+1})` telescopes to 1; `(−1)³ = −1`; `n = 4` with `s_i = (−1)^i` makes every ratio `+1` | holds | new Checks |
| `m_aΔ_a(1)` | ordinary zigzag | `ε_a(2Y_a + ΣY_b) = 2X_a − ΣX_b`; `−x_a(·) = s_a(c) − c` | consistent with `d² = l(s_a c) − r(c)` | new Check |
| braid relation | `a – b` | both words give `(−x_b, −x_a)` | holds | new Check |
| `μ_a` Fourier formula | `1 ⊗ id ⊗ 1` | `(δ_a/|Γ|)Σχ_a(γ⁻¹)γ = z_a`, idempotent | holds | new Check |
| `Q₈` endpoint coefficients | `φ_ab(v) = v⊗1`, `φ_ba(1) = y⊗x − x⊗y` | raw `1, −2`; weighted `2·1 = 2`, `1·(−2) = −2` | antisymmetric only when weighted | Check |
| dihedral invariant relation | `m = 2`, `x = 1`, `y = 2` | `X = −30`, `Y = 17`, `Z = 4`: `900 = 4(289 − 64)` | holds | Check |
| exceptional degrees | `E₆/E₇/E₈` | `6·8 = 48`, `8·12 = 96`, `12·20 = 240 = 2|Γ|`; relation degrees `24, 36, 60` | holds | Check |
| Molien `C₂` | — | `½(1/(1−t)² + 1/(1+t)²) = (1+t²)/(1−t²)²` | equals the series of `XY = Z²` | Check |
| `q` not flat at 0 | `C₂` | `S/(x²,xy,y²)` has length 3, not 2 | flatness only on `V°` | Check |
| `C₂` cluster chart | `(y − ax, x² − b)` | image `(b, ab, a²b)`; `b ≠ 0` gives orbit `±(√b, a√b)`; `(x²,xy,y²)` has length 3, so it is not a cluster | holds | Check |
| tautological degree sign | `C₂` | sign summand on `E` is `O²/O(−1) = O(1)`, degree `+1`, matching KV00 Lemma | positive convention | Check |
| fundamental cycle | `Q₈`, `C₂`, `C₃` | `Z·E_c = −4 + 3 = −1`, `Z·E_k = 0`; the smaller cycle gives `+1`; `C₃`: `E₁ + E₂` (`A₂` highest root) | holds | Check |
| pole equation | octahedral, dihedral, `(2,3,6)` | `23/12 = 2 − 2/24`; `2 − 1/n`; `2` is impossible | holds | Check |
| quaternion map | `i·j`, `j·i` | `!![0,I;I,0]` = image of `k`; reverse = image of `−k` | homomorphism | Check corrected |

## Ownership, moves and sources

- Ownership: `IsMcKayQuiver` and `rootLatticeQuotientMap` are McKay-specific; `roadmaps resolve` found no other owner, and their bodies use only pinned Tau Ceti carriers. The generic skew product is now cited from Mathlib (H07). No notion moved down, and no supplier was added.
- Sources: Springer LNM 585 and GSV83 are cited by locator without the text (paywalled, or no legal copy found). They should be recorded as `uncertified` when the worker writes `sources.toml`. No `needs-references.toml` request is made, because every load-bearing claim of Layer 7 has a locator in a text read here.
- Not done in this job: deleting the three companion Lean files (H02, H03, H09, H10) and creating `sources.toml` (H08). Both lie outside the two files this job may edit.

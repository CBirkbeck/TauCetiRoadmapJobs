# Review of GromovWittenTheory (pull request #990 at 32ade49)

**Verdict:** needs changes

:robot: Independent AI review, incremental re-review of the 29 lines changed since `c8ad671` (`README.md` only; nothing outside the folder). The two source and statement findings of the previous review (its R01 and R02) are repaired, and the repairs were checked against the sources, against the supplier sections they newly cite, and by recomputing every instance they add. Two findings carry over, both P3 and neither in the folder's text: the branch still pins Tau Ceti `a91d3aa` while the README reads it at `2fd255d`, and the folder-name conflict with #1998 is still unaddressed in the description. No new finding. Gate, dependency check and elaboration pass on an independent rerun.

## R01 (P3) — The README and the docstring read Tau Ceti at `2fd255d`, but the branch still pins `a91d3aa`

This is the previous review's R03 (and the one before it, R01), still not repaired.

**Location:** `README.md:66`, “### From Tau Ceti (commit 2fd255d)”, and the contract below it. `Suggested.lean:31–47`. `lake-manifest.json:8`.

**Claim:** The branch manifest pins Tau Ceti `a91d3aaf` (Mathlib `6b7abb3c`); main pins `2fd255d9`. At `a91d3aa` the files the contracts name are absent, among them `RingTheory/NovikovSeries/Basic.lean`, `RingTheory/NovikovModule/Basic.lean`, `Topology/Sheaves/Cech/Colimit.lean`, `Geometry/Symplectic/Manifold/AlmostComplex/Basic.lean` and `AlgebraicGeometry/Curves/NodalGluing/Basic.lean`. All exist at `2fd255d`, so the contracts are right about main's pin and wrong about the branch's own.

**Witness:** `lake-manifest.json:8` reads `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; `git merge-base --is-ancestor origin/main HEAD` fails (12 commits ahead, none from main). The five files above are absent under the worktree's `.lake/packages/TauCeti` and present under main's.

**Repair:** Merge or rebase the branch onto origin/main. No line of the folder changes; `Suggested.lean` imports only `Mathlib`, so the build is unaffected.

## R02 (P3) — Pull request #1998 writes the same folder, and no order between the two is stated

This is the previous review's R04 (and the one before it, R02), still not repaired.

**Location:** the folder `TauCetiRoadmap/GromovWittenTheory/` (all three files) and this pull request's description.

**Claim:** #1998 (head `c41b144`, “algebraic Gromov–Witten theory and quantum cohomology”) adds a different roadmap under the same folder name; the heads conflict in all three files. The objects differ (Behrend–Fantechi classes on the numerical Chow ring there, analytic stable maps and implicit atlases here), so this is a naming and order conflict, not a double owner. Neither description says which pull request keeps the name.

**Witness:** `scratch/overlaps.md`: “#990 and #1998 conflict in `TauCetiRoadmap/GromovWittenTheory/README.md`, `…/Suggested.lean`, `…/metadata.toml`”. `roadmaps list` shows both as new roadmaps named GromovWittenTheory. The description in `scratch/pull-request.md` names #987, #974 and other suppliers and nothing about #1998.

**Repair:** State in this pull request's description that this roadmap keeps the folder `GromovWittenTheory` (the name HamiltonianFloerOperations already cites on main, `README.md:17`, “GromovWittenTheory G0/G5–G7”) and that #1998 takes another folder name before either merges.

## Previous findings

- R01 — repaired: §3.2 gains the API bullet `π^* 𝔼_g ≅ 𝔼_g` along one-mark forgetting with the tail and bridge cases, and §5.4 states the pullback form `I_(g,n,0) = π^* p_(1*)(…)`, the genus-one `s ∈ {0, 2}` consequence and the genus ≥ 2 vanishing for every `n` when `m ≥ 4`; §3.4's third bullet is now the `n = 0` case; the `T² × ℂP³` witness is a Check.
- R02 — repaired: §2.3 cites “Pardon, Lemma 9.3.2, p. 100” for the homology pushforward along a smooth path, and §3.4's degree-two bullet cites “Kontsevich–Manin (2.10), p. 6” and says the source leaves the characteristic class uncomputed.
- R03 — not repaired: `lake-manifest.json:8` still reads `a91d3aafa8cd…`; `README.md:66` still reads “From Tau Ceti (commit 2fd255d)”. It is R01 above.
- R04 — not repaired: the description still names no relation to #1998, which `roadmaps list` shows open at `c41b144`. It is R02 above.
- Settled findings: no repair report marks either carried finding “not actionable in this package”; the branch's commit messages say nothing of the kind.

## Verified sound

### Gate, dependency check, build and Lean form

- **Gate rerun at `32ade49`:** every counter `0`, `OK`, exit 0. The worker's gate at this head also lists `build=0`.
- **Dependency check** (`--movable`, board merge order, main content): `depcheck: 237 roadmaps, 2310 edges, 0 problem(s)`. No UPWARD or CYCLE line. The new `*Needs:*` items (ComplexCurveModuli D7 item 1, AlgebraicTopology Stage 5 item 1) are roadmaps on main that Layers 3 and 5 already consumed.
- **Elaboration:** `lake env lean TauCetiRoadmap/GromovWittenTheory/Suggested.lean` exits 0 with no output (41 s wall, cold cache). The file is unchanged since the previous review: 66 lines, `import Mathlib` alone, the module docstring, the namespace, no declaration, so there is no `#check @name` comparison to run and nothing to probe for padding.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GromovWittenTheory'` is empty.

### The changed passages against their sources

| Locator | Source line, page | What it says | README passage |
|---|---|---|---|
| KM94 Definition 2.2 | lines 128–131, p. 4 | maps defined for `g ≥ 0`, `n ≥ 0`, `n + 2g − 3 ≥ 0` | Conventions “Stable range” row; References |
| KM94 (2.9)–(2.10) | lines 208–217, p. 6 | genus one, `Σ\|γ_i\| ∈ {0, 2}`, lifts of two basic classes; `(2.10)` is `(∫ X(V) ∧ γ) e²` with `e² = c₁(𝒪(1))` on the coarse `ℙ¹`; `X(V)` is left to a later section | §3.4 bullet 2, §5.4 bullet 2 |
| KM94 2.2.5, genus ≥ 2 | line 218, p. 6 | `I_(g,n,0) = 0` unless `dim_ℂ V ≤ 3` | §5.4 bullet 3; §3.4 bullet 3 |
| KM94 2.4.5 | lines 408–421, p. 10 | `E_(g,n) = R¹π_*𝒪`; it is the pullback of `E_(0,3) ≅ 0`, `E_(1,1)`, `E_(g,0)`; the formula `p_(1*)(c_G(E ⊠ TV) ∧ p_2^*(γ₁ ∧ ⋯ ∧ γ_n))` | §3.2 bullet 4; §5.4; References |
| Pardon Lemma 9.3.2 | line 4366 (proof 4367–4378), p. 100 | `GW^β_(g,n)(X) ∈ H_•(M̄_(g,n) × X^n)` is independent of `J`; the proof joins `J₀, J₁` by a smooth path of ω-tame structures and uses the parametrized moduli space | §2.3 parenthesis |

The page numbers were read from the `=== page N ===` markers of the cached texts (KM94: page 4 at line 116, page 6 at line 205, page 10 at line 390; Pardon: page 100 at line 4344).

### Supplier sections the repair newly cites (on main)

- **ComplexCurveModuli D7 item 1** (`README.md:194–196` there): forgetting a mark followed by contraction of the newly unstable tails and bridges, constructed in analytic families on charts (bridge coordinates `xv = t₁t₂`, tail by its attaching chart), with arrow descent, setwise forgetting `forgetAuxiliarySet`, iteration coherence and base change. This is what §3.2's “contraction charts of D7 item 1” and the iterated pullback to `M̄_(1,1)` and `M̄_(g,0)` use.
- **AlgebraicTopology Stage 5 item 1**: the Künneth theorem over a field through the cross product, with naturality. §5.4 uses it for the Künneth decomposition of `H^*(M̄ × X; ℚ)`; the formula `p_(1*)(p_1^* a ⌣ p_2^* b) = (∫_X b) a` then follows from §2.1's definition of `p_(1*)` as the weighted adjoint (pair with `p_1^* ψ`, integrate over the product). Stage 5 item 1 was already a contract of this roadmap (`README.md:31`, §6.1, §6.5).
- **CharacteristicClasses C3 item 2**: pullback and isomorphism invariance of `c_i`, the Whitney, dual and line-twist formulas, `c_r = e(E_ℝ)`. §3.4 and §5.4 cite exactly these.

### Adversarial pass on the changed statements

Coefficients ℚ; `s = Σ deg γ_i`, `m = dim_ℂ X`.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §3.2 bullet 4, `π^* 𝔼_g ≅ 𝔼_g` by restriction, tail case | `M̄_(2,1) → M̄_(2,0)`: two elliptic curves `E₁, E₂` joined at a node, mark on a rational tail attached to `E₁` | on the tail, at most one simple pole, residue theorem forces residue `0`, differential `0`; matching forces the residue of `E₁` at the attaching branch to be `0`; restriction to `E₁ ∪ E₂` is the identity on the `2`-dimensional space `H⁰(ω_(E₁)) ⊕ H⁰(ω_(E₂))`; target fibre has dimension `1 + 1 + 0 = 2` | Correct, ranks `2 = 2` |
| §3.2 bullet 4, bridge case | `M̄_(1,2) → M̄_(1,1)`: cycle of two spheres, one mark each, forget mark 2 | source fibre: `(c₁ dz/z, c₂ dw/w)` with `c₂ = −c₁`, dimension `1`; residues of `c₂ dw/w` at the bridge's two branches are `c₂, −c₂ = −c₁, c₁`; restriction to the surviving sphere gives `c₁ dz/z`, residues `c₁, −c₁` at the two branches which become the one node: matched; target fibre `ℂ · dz/z`, dimension `1`; kernel of restriction: `c₁ = 0` forces `c₂ = 0` | Correct, injective, ranks `1 = 1` |
| §3.2 bullet 4, the wrong model (extension by zero) | same bridge | extension by zero of `c₁ dz/z` puts residue `0` on the bridge against `±c₁ ≠ 0` on the sphere: not residue-matched; so the inverse is not extension by zero | The Check discriminates |
| §3.2 bullet 4, self-bridge | `M̄_(2,1) → M̄_(2,0)`: a genus-one curve `E` with a rational bridge attached at two points of `E`, the mark on the bridge | residues of `E`'s differential at the two attaching points: `−c, c`; after contraction the two points are one self-node with residues `−c, c`: matched; dimension `1 + 1 = 2` on both sides (`b₁ = 1`) | Correct |
| §3.4 bullet 2, class form | `X = ℂP¹`, `δ = pt`; `X = ℂP²`, `δ = H` | `λ₁ = (1/12)[pt]^∨` from `(1/12)(1/2) = 1/24`; `I(pt) = −(1/12)[pt]^∨`, weighted integral `−1/24`, agreeing with the earlier bullet; `∫ c₁(Tℂ P²) ⌣ H = 3H·H = 3`, `I(H) = −3λ₁`, pairing `−3/24 = −1/8`; wrong reading `−(1/24)[pt]^∨` gives `−1/48 ≠ −1/24` | Correct |
| §3.4 bullet 2, `X(V)` component | general `m` | `(∫ X(V)_(2m−2) ⌣ δ) [pt]^∨ = −(1/12)(∫ c_(m−1) ⌣ δ) [pt]^∨` for all degree-two `δ`, so `X(V)_(2m−2) = −(1/12) c_(m−1)(TX)` by perfectness on `X`; the other components pair to `0` against degree-two `δ` | Correct |
| §5.4 bullet 1, degree of the pulled-back class | general | `2mg + s − 2m = s + 2(g − 1)m` | Correct |
| §5.4 bullet 1, `n = n₀` | `g = 1, n = 1`; `g ≥ 2, n = 0` | `π = id`, the bullet is the Hodge–Euler formula itself | Degenerate case consistent |
| §5.4 bullet 2, `g = 1` | `X = T²`, `(1, 3, 0)`, insertions `α, β, 1` | `s = 2`, `I = π^*(−(∫ c₀ ⌣ αβ) λ₁) = −π^* λ₁ ≠ 0`; `(1, 2, 0)` on `ℂP²` with `(H, H)`: `s = 4 ∉ {0, 2}`, `I = 0` although `4 = dim_ℝ M̄_(1,2)` | Correct; `s ∈ {0, 2}` is sharp |
| §5.4 bullet 3, `g ≥ 2`, `m ≥ 4` | `g = 2`: `8(g−1) = 8 > 6`; `g = 3`: `16 > 12`; boundary `m = 3`, `g = 2`, `n = 0`: `6 = 6` | vanishing for `m ≥ 4`; for `m = 3` the degree count allows a top class, and the bullet claims nothing, matching KM94's `dim_ℂ V ≤ 3` | Correct |
| §5.4 Check, `T² × ℂP³`, `(2, 2, 0)`, `(α, β)` | as stated | `s + 2(g−1)m = 2 + 8 = 10 = 6·2 − 6 + 4 = dim_ℝ M̄_(2,2)`; `X`-degree needed `8`, `αβ` supplies `2`, so the `c₈` part has `X`-degree `6` (complex `3`) and Hodge degree complex `5`, real `10 > 6 = dim_ℝ M̄_(2,0)` | Correct, and refutes a non-pulled-back model |
| §5.4 Check, `ℂP²`, `(1, 2, 0)` | `(H, H)`, `(H, 1)` | `0`; `−3π^* λ₁`, agreeing with §5.2's `I(γ, 1) = π^* I(γ)` and `⟨I_(1,1,0)(H)⟩ = −1/8` | Correct |
| Conventions, stable range | integers | `n + 2g − 3 ≥ 0 ⇔ 2g − 2 + n ≥ 1 ⇔ 2g − 2 + n > 0` | Correct |
| §2.3 citation | Pardon's hypotheses | smooth path of ω-tame `J`, pushforward to `H_•(M̄_(g,n) × X^n)`, stable range `2g + n > 2`; the README claims the class-valued form and the auxiliary-reduction comparisons as its own | Correct |

Rows for the statements the diff leaves untouched are those of the previous report (its “Adversarial pass” table, 34 rows), unchanged: §0.1–§0.4, §1.1–§1.2, §2.1–§2.2, §3.3, §4.1–§4.3, §5.1–§5.3, §5.4 `g = 0`, §6.1–§6.4, §7.1–§7.2, §8.1–§8.6 and the four headline theorems.

### Headline theorems

Unchanged: the Summary's four headline theorems (the eight Kontsevich–Manin properties; `I_(1,1,0)(1) = χ(X)·1`; the unital CohFT over `Λ_ω` and the associative quantum product; string, dilaton, divisor and the genus-zero TRR) are named in the docstring as not statable at the pins, and the reasons given by the previous review (no Chern class, no pseudoholomorphic stable-map moduli, no implicit atlas, no Čech cup product at Tau Ceti `2fd255d`) still hold; the diff touches none of them.

### Overlaps and ownership

- `scratch/overlaps.md` at this index lists no dropped id, no id only an open revision defines, and the one folder conflict (R02).
- The Hodge-bundle pullback along forgetful maps is a property of this roadmap's own `𝔼_g` (§3.2, passed by the previous review), constructed on ComplexCurveModuli's analytic stable-domain groupoid; ComplexCurveModuli on main defines no Hodge bundle. `roadmaps grep -i 'Hodge bundle'` over main and every open head finds the abelian-scheme Hodge bundle `e^*Ω¹` (PELModuli, ArakelovGeometryAndAbelianHeights and their consumers; a different object), the analytified Hodge bundle of AdicSpacesPartII–III on main (modular curves), and StableReductionPartII §5.1 at `rev/1841` (`E_(g,n) = f_*ω` on the algebraic stack over arbitrary bases, with base change but no forgetful-map pullback statement). None is on the analytic carrier, and §3.2 assumes no GAGA comparison, so the pullback bullet has one owner. Ownership against open pull requests whose files the brief does not give was checked only through `roadmaps grep`.

## Not verifiable

- #1998's head was read only through `roadmaps list`; its files are not among the checkouts the brief gives.
- Mathlib names were checked at the branch pin `6b7abb3c` only; main's Mathlib pin `1b1ccf4` is not checked out in this worktree.

## Source issues

- none new. The previous review's entries (the KM94 (2.9) coefficient error and the `X(V)` cross-reference misprint, the KM98 stable-range misprint and dilaton gap, the Kock (5.1.7.2) gap) were re-read at their lines and stand.

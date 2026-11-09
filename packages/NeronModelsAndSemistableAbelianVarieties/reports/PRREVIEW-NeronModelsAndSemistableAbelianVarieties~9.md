# Review of NeronModelsAndSemistableAbelianVarieties (pull request #852 at e816215)

**Verdict:** needs changes

Incremental re-review of the 119 lines changed since 4c22d44. All the changes are in `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md`; `Suggested.lean` is unchanged since 8986e52. The change correctly drops the ReductiveGroupsPartII RG2.3.1 citation for quotients of locally finite-type groups (on main, RG2.3.1 is about smooth affine models). But it replaces that citation, and the AlgebraicModuliForArithmeticGeometry §7.9 route to the identity component, with GroupSchemesOverABase. That roadmap may not be cited, and it consumes this roadmap's 2.3. The push gate fails on it (`dropped = 15`).

## R01 (P1) — 2.1–2.2 hand their constructions to GroupSchemesOverABase, which may not be cited and consumes this roadmap

**Location.** `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md` lines 44–47, 121–125, 279, 481–490, 681, 1176–1179, 1190–1203, 1217–1228 and 1443–1445. These are the 15 lines the gate reports, and this diff adds every one of them. For example, lines 1217–1228: "Define `ComponentGroup` … as the étale group of connected components `π₀(M_k/k)` of GroupSchemesOverABase 4.8 … are GroupSchemesOverABase 4.8's and are not restated. … *Needs:* 2.1; GroupSchemesOverABase 4.8."

**Claim.** The following are no longer targets of this roadmap: the relative identity component `M⁰`; the field-level properties of `M_k⁰` (open, closed, normal, geometrically connected, compatible with extension of `k`); and `Φ_A` with its projection, kernel, universal property, finiteness, étaleness and Galois description `Φ_A(k) = Φ_A(k^sep)^{Gal}`. The README now says they belong to GroupSchemesOverABase 0.2, 4.6 and 4.8, and does not restate them.

That roadmap is on the project's list of roadmaps that may never be cited as suppliers, and the merge order does not list it. It also consumes this roadmap: its supplier contract and its 4.2 both need 2.3 here, and 2.3 needs 2.1. So these objects have no admissible owner, and the two roadmaps cite each other: GroupSchemesOverABase Layer 4 needs Layer 2 here, and Layer 2 here needs its Layers 0 and 4.

Downstream, every target that needs 2.1 or 2.2 now rests on that supplier: 2.3–2.6, 2.8, 3.1, 3.3, 3.4, 4.5, 4.7, 4.14, 6.1, 6.4a–6.4c and 6.8. Two consumers are affected:
- HeegnerPointEulerSystems (#1423, README line 167) takes "rational component points and geometric components are kept distinct" from §§2.1–2.2, which 2.2 now disclaims.
- RelativeJacobiansAndIntegralCurveModels (#1232, README lines 75 and 825) cites §§2.1–2.2.

**Witness.** The gate reports `dropped = 15`. GroupSchemesOverABase at its head (#1522), README line 257: "From NeronModelsAndSemistableAbelianVarieties. 2.3 … (4.2)"; its 4.2 *Needs:* this 2.3 (lines 774–775). `ORDER.txt` has no GroupSchemesOverABase line.

**Repair.**
1. **2.1.** Make the construction a target here again.
   - Specialise AlgebraicModuliForArithmeticGeometry §7.9 `spaceSectionComponentCriterion` to `B = Spec R` and `P = M`. That roadmap is at merge-order line 34, and this README already cites §7.9 at lines 141, 553 and 1778. `M` is smooth, separated and of finite type over the Noetherian reduced `Spec R`, and its identity components are smooth of constant dimension `g`. So `M⁰` is an open subgroup, of finite type and smooth over `R`, and its formation commutes with base change. Hence its special fibre is `M_k⁰` and its generic fibre is `A`.
   - State again, as parts of the target, that `M_k⁰` is open, closed and normal in `M_k`, geometrically connected, and compatible with extension of `k`.
   - State that `M_k⁰` agrees with `TauCeti.FiniteTypeCommHopfAlgCat.identityComponentSpec` (Tau Ceti `TauCeti/Algebra/AlgebraicGroup/Connected/GroupScheme.lean:141`) when `M_k` is affine and `k` is algebraically closed.
   - *Needs:* 1.5; AlgebraicModuliForArithmeticGeometry §7.9; Mathlib `Scheme.Hom.fiber`.
2. **2.2.** Make `Φ_A` a target here.
   - Define it as the finite étale `k`-group that corresponds, under Tau Ceti's `TauCeti.FiniteEtaleScheme.galoisEquivalenceGrp` (`TauCeti/AlgebraicGeometry/FiniteEtale/Galois/Basic.lean:179`), to the finite group of connected components of `M_{k^sep}` with its `Gal(k^sep/k)`-action.
   - Prove: the faithfully flat projection `M_k → Φ_A` with kernel `M_k⁰`; its universal property; `Φ_A(k) = Φ_A(k^sep)^{Gal(k^sep/k)}`; and agreement with `TauCeti.FiniteTypeCommHopfAlgCat.componentGroupScheme` (`TauCeti/Algebra/AlgebraicGroup/Connected/ComponentGroup/FiniteEtale.lean:51`) in the affine, algebraically closed case.
   - Do not reinstate the ReductiveGroupsPartII RG2.3.1 citation that the text at 4c22d44 used for this quotient. On main, RG2.3.1 (ReductiveGroupsPartII README line 3800) states smooth affine models over a discrete valuation ring, not quotients of locally finite-type groups. If an fppf-quotient input is wanted, SchemeAndStackFoundations §1.17 (`artinBootstrap`) is an earlier owner.
3. **Delete every other GroupSchemesOverABase mention.**
   - Lines 121–125: the supplier bullet.
   - Lines 481–490: the `### From TauCetiRoadmap.GroupSchemesOverABase` block.
   - Line 681: the table row.
   - Line 279: the clause. Write "the component group of 2.2 is for smooth finite-type groups over any field and agrees with `componentGroupScheme` in the affine algebraically-closed case".
   - Lines 1176–1179: the Layer 2 introduction.
   - Lines 44–47: the scope bullet. Replace both clauses with "the Néron identity component and component group (2.1–2.2); the Chevalley decomposition of every smooth connected commutative group over a perfect field (2.3), applied to the identity fibre; the theorem for noncommutative groups is not part of this roadmap". This keeps valid 2.3's pointer at line 1251 ("the ownership split … is recorded under Scope and ownership").
   - Lines 1443–1451, Layer 2 Dependencies: restore "Tau Ceti's affine identity components and component groups" and AlgebraicModuliForArithmeticGeometry §7.9.
   - Remove #1522 from the pull request's depends-on and merge-order blocks.

**Tested on the refuting instance.** After these edits, the gate's `dropped` list is empty, because each of its 15 lines is one of the passages above. GroupSchemesOverABase's edge to 2.3 (its line 257) becomes one-way. Two things are again backed by a target of this roadmap: the nonsplit `Iₙ` Check of 2.2 (fixed points `2, 1, 1` at `n = 4, 5, 1`, computed below), and HeegnerPointEulerSystems' rational-versus-geometric citation.

## Previous findings

- none — the previous report (at 4c22d44) raised no finding of its own and accepted. The §1.9a Check whose repair it confirmed is unchanged at this head: it now sits at README 1068–1083 ("Let `R` be the local ring of `𝒜` at a closed point `x` of the fibre over `s` …"), shifted by 15 lines.

## Verified sound

**Gate.** I reran it on e816215:

```text
gate NeronModelsAndSemistableAbelianVarieties: … statement-hygiene=0 forbidden=0 dropped=15 readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
```

All 15 `dropped` hits are GroupSchemesOverABase lines this diff adds (R01). Every other check is zero, and the worker's run reports `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty. The 991 outside files that `changes.md` lists come from the merge of main (7077e27b), not from this pull request. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

**Dependency check (movable):**

```text
depcheck: 237 roadmaps, 2297 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This is not a false positive. GroupSchemesOverABase is not in the merge order, so the check has no edge for it; the cycle in R01 comes from reading its README at #1522 (lines 257, 774–775, 1061).

**Elaboration.** I ran `lake env lean` on `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/Suggested.lean` at the pins: exactly four `declaration uses 'sorry'` warnings (lines 68, 83, 111, 123), exit 0, 13 s. The file is unchanged since 8986e52.

**Signatures.** I compared the worker's elaborated types of `LocalExistence`, `DedekindExistence`, `HasGoodModel`, `GoodIsogeny` and `EquationGoodComparison` with the README. The DVR, fraction-field, `IsIntegral`/`IsNoetherian`/integrally-closed-stalk/dimension-one, `IsElliptic` and `IsMinimal` binders are all present; none is dropped.

**Imports, headlines and padding.**
- Imports are `import Mathlib` plus three `TauCeti.*` modules present at the pin.
- There is no `set_option`, no `lemma` and no sorry'd data.
- Headline theorems are unchanged: 1.7, 1.9, 5.2 and 6.5 are stated, with `HasGoodModel` as their real-bodied definition. The non-statable headlines are named in the docstring: Grothendieck's criterion, Néron–Ogg–Shafarevich, the cokernel identification and the Tate system.
- The diff adds no Lean name, so the earlier one-tactic probe stands (none of the four admitted theorems closes by one tactic).

**Changed passages against the pins and main.**
- `identityComponentSpec` is at Tau Ceti `Algebra/AlgebraicGroup/Connected/GroupScheme.lean:141`, and `componentGroupScheme` at `…/ComponentGroup/FiniteEtale.lean:51`. Both live under `variable {k} [Field k] [IsAlgClosed k]` for finite-type Hopf algebras, so the README's scoping "affine and `k` algebraically closed" is exact.
- Neither Mathlib nor Tau Ceti at the pins has an identity component or component group for non-affine group schemes (I grepped `Mathlib/AlgebraicGeometry` and `TauCeti` by object). So this roadmap, or AlgebraicModuliForArithmeticGeometry §7.9, must own them.
- `TauCeti.FiniteEtaleScheme.galoisEquivalenceGrp` is at `TauCeti/AlgebraicGeometry/FiniteEtale/Galois/Basic.lean:179`.
- AlgebraicModuliForArithmeticGeometry §7.9 `spaceSectionComponentCriterion` exists at #853's head (its README line 9792). Its hypotheses are: a locally Noetherian base, a quasi-separated group space locally of finite presentation, and smooth identity components of locally constant dimension. Its conclusions: an open group subspace of finite type, smooth over a reduced base, compatible with base change.
- On main, the ReductiveGroupsPartII sections the edited contract keeps all exist: RG2.0a (line 943, `normOne`), RG2.3.2 (line 4044, `lftMappingProperty`) and RG2.3.7 (line 5201, `Lang.lang_surjective`). RG2.3.1 (line 3800) is smooth affine models, so its removal is correct.
- No roadmap at main or at an open head cites the API names this diff drops from 2.1–2.2 (`NeronIdentity.open`, `NeronComponents.rational`, …); `roadmaps grep` finds none outside this pull request.

**Seeded sample, where it meets the change.**
- **2.1** is changed. Its locator, SGA 7 I, Exposé IX, §1.1, pp. 321–322, is not readable legally (see below). Its mathematics is checked in the table.
- **2.4** needs 2.1. Conrad Prop. 2.16 (`conrad` line 228, printed p. 6) gives the unique maximal torus of a smooth connected commutative affine group, with formation compatible with field extension. Thm. 3.1 (`conrad` line 259, p. 7) descends the torus and the abelian quotient of a semi-abelian group over any field. Together they support 2.4 as written.
- **6.4a** needs 2.1–2.2. Mazur III Lemma 3.3, p. 149 (`mazur1977` lines 4657–4681) gives finiteness of `M/M⁰`, the fppf sequence for `J⁰[p^m]` and the direct-limit diagram. Milne ADT III Lemma 5.3, printed p. 267 (`milne-adt` lines 9615–9626) proves that a complex of flat finite-type group schemes over a Noetherian base that is exact on geometric fibres is exact. Both support 6.4a's cited use.
- **1.8** has a Check that uses 2.2's `good` (`Φ_A = 0`), which the change keeps.
- The other sampled targets (1.4, 1.6, 2.7, 3.6, 3.7, 3.9, 4.11, 5.0b, 5.2, 6.7, 6.14) are untouched and do not cite 2.1–2.2 in their *Needs:* lines. I computed rows for them below; the earlier reports' locator checks stand.

**Remarks on untouched text (no change requested).**
- LocalFieldsRamification Layers 3–4 are cited at lines 209, 593, 3420 and 3436. #617 (kim-em) rewrites LocalFieldsRamification as Layers 0–2, with Hasse–Arf recorded as Tau Ceti's `TauCeti.LocalFieldsRamification.hasseArf`. The completed roadmap on main still has Layer 3 (line 724) and Layer 4 (line 1154).
- 6.4a uses `G = M⁰` over a Dedekind scheme, while 2.1 is stated over a discrete valuation ring. §7.9's locally Noetherian base covers the Dedekind case.
- The backticked API names in 2.1–2.2 (`NeronIdentity.generic_iso`, `NeronComponents.map`, …) are not declared in `Suggested.lean`. This is the README-wide convention the earlier reports passed, and the gate's `readme-ids-missing` is 0.

**Ownership against open pull requests.** I checked with the roadmap index (461 open pull requests) by object: π₀ of a group scheme over a field, identity component over a base, `componentGroupScheme`. The only other owner of the non-affine constructions is GroupSchemesOverABase (#1522), which may not be cited (R01).

**Adversarial table.** It has new rows for every changed statement and for the sampled targets, and carries the previous report's rows (marked "carried, r8") for the untouched statements.

| Statement or convention | Instances tried | Computed values | Result / change |
|---|---|---|---|
| 2.1 `IdentityComponent`, rewritten | good `y² + y = x³ − x` over `ℤ_p`, `p ≠ 37`; split `I₅`; `dim A = 0`; wrong model "closure of `A` in `M`"; `generic_iso`; `map` for `[m]`; `good` | `Δ = 37`, so `M⁰ = M`, `M_k⁰ = E_k`; `I₅`: `M_k ≅ 𝔾_m × ℤ/5`, `M_k⁰ = 𝔾_m`, `M⁰` = `M` minus the 4 non-identity components; `dim A = 0`: `M = M⁰ = Spec R`; closure of `A` is `M` (flat), whose special fibre has 5 components, so "connected fibres" excludes it; `(M⁰)_K = A⁰ = A`; `z ↦ z^m` sends `𝔾_m` into `𝔾_m`; abelian-scheme fibres are geometrically connected | mathematics correct; owner inadmissible (R01) |
| 2.1 Checks against the rewritten 2.1 | good; split `Iₙ`, `n > 1`; good, `dim A = g > 0` | `M_k⁰ = E_k`; `M_k⁰ = 𝔾_m` against `n` components of the regular fibre; `M_k` proper, connected, of dimension `g`, so not affine | correct |
| 2.2 `ComponentGroup`, rewritten | good; split `I₅` over `𝔽₅`; nonsplit `Iₙ`, Frobenius `−1`, `n = 4, 5, 1, 2, 0`; `map` for `E_q → E_{q^m}`; projection and kernel; affine `k = k̄` | `Φ = 0`; `Φ(k^sep) = ℤ/5`, Frobenius trivial, `Φ(k) = ℤ/5`; fixed points `{0,2}`, `{0}`, `{0}`, `{0,1}`: `2, 1, 1, 2`; `n = 0`: `ℤ` has 1 fixed point against the formula's 2, so `0 < n` is needed; `v(q) = n`: `ℤ/n → ℤ/mn`, `r ↦ mr`, cokernel `ℤ/m`; `M_k → Φ_A` is flat (target a disjoint union of field spectra), and the fibre over `0` is `M_k⁰`; `componentGroupScheme` is the constant group on `ConnectedComponents (PrimeSpectrum H)` (FiniteEtale.lean:51–55), which is `π₀` for `k = k̄` | mathematics correct; owner inadmissible (R01) |
| Scope bullet, lines 44–47; supplier bullet, 121–125; contract block, 481–490; table row, 681 | merge order; never-cite list; GroupSchemesOverABase at #1522 | `ORDER.txt`: no GroupSchemesOverABase line (this roadmap is line 66); on the brief's never-cite list; its line 257 supplier "2.3 … (4.2)", lines 774–775 4.2 *Needs:* 2.3, line 1061 Layer 4 Dependencies; here 2.1 *Needs:* its 0.2, 4.6 and 2.2 its 4.8, so GroupSchemesOverABase Layer 4 ↔ Layer 2 here | R01 |
| GS4.2 clause (line 47): "which 2.3 does not use" | GroupSchemesOverABase 4.2 *Needs:* | its edge runs GroupSchemesOverABase → 2.3, so the clause is true, but the gate refuses the name and 2.3's pointer (line 1251) depends on it | R01 (repair keeps the pointer valid) |
| Variant clause, line 279 | `componentGroupScheme` in the affine, `k = k̄` case | constant group on connected components, the same as `π₀(M_k/k)` there | correct statement; name → R01 |
| ReductiveGroupsPartII contract (RG2.3.1 dropped) | sections on main | RG2.3.1, line 3800: smooth affine `O`-models; RG2.0a, line 943; RG2.3.2, line 4044 with `lftMappingProperty`; RG2.3.7, line 5201 | correct, no change |
| Layer 2 introduction (1176–1186) and Dependencies (1443–1451) | against 2.1–2.2 | Dependencies drop "Tau Ceti's affine identity components and component groups" while 2.1–2.2 still name `identityComponentSpec`, `componentGroupScheme` | consistent only under the inadmissible owner; restore under R01 |
| 2.4 toric characters (sample, needs 2.1) | split `𝔾_m`; `[m]`; nonsplit | `X^* = ℤ`; induces `m`; Frobenius `−1` on `ℤ`; `conrad` lines 228, 259 | correct; supply through 2.1 (R01) |
| 6.4a connected Kummer (sample, needs 2.1–2.2) | `A = 0`; `m = 1`; split Tate, `m > 1`; additive in characteristic `p` | all zero; all zero; generic rank `m²`, special `μ_m` rank `m`; `𝔾_a`, `[p] = 0`, not an epimorphism; `mazur1977` lines 4657–4681, `milne-adt` lines 9615–9626 | correct |
| 1.6 weak models (sample) | `j = 𝟙`; Néron → weak; `WeakNeronBlowup` | every smooth separated quasi-compact `X` is its own weak model; `Etale → Smooth`; `(π, t)` is the maximal ideal of a 2-dimensional regular local ring, not invertible, so `𝟙_E` does not extend | correct |
| 2.7 smooth locus (sample) | `I₀*`; good | central component of multiplicity 2 not in `X_sm`; four multiplicity-1 components, `Φ(k̄) = (ℤ/2)²`; `X_sm = X` | correct |
| 3.6 Weil orthogonality (sample) | semistable `(g, t, a)`; Tate; good; `m = 1` | `rk T_f(A) = 2a + t`, `rk T_t(A^∨) = t`, sum `2g`; `(1, 1)`; `(2, 0)`; all trivial | correct |
| 3.7 inertia (sample) | Tate curve; good | `σ ↦ [[1, t_ℓ(σ)], [0, 1]]`, `(σ − 1)² = 0`, image in `ℤ_ℓ(1) = T_t`, nonzero when `t_ℓ(σ) ≠ 0`; `σ − 1 = 0` | correct |
| 3.9 Picard identity (sample) | split `Iₙ`; smooth model | `Pic⁰` special fibre `𝔾_m` against `n` components of `N`; `Pic⁰ = N` | correct |
| 4.11 odd-factor torsors (sample) | `g = 2`; rational root; irreducible sextic; `f = h·h̄`, `h` cubic over quadratic `L` | `#J[2] = 2⁴ = 16 = #W[2]`; `(x − a)` odd factor; `W_m[2](K) = ∅`; point of `W[2](K)` not from `W_m[2](K)` | correct |
| 6.7 discriminant (sample) | `I₀`, `I₁`, `II`; `I₅`; `y² = x³ + 32` over `ℤ₂` | `v(Δ) = 0, 1, 2`, one component each; `5`; `Δ = −16·27·32²`, `v₂ = 14 > 10` | correct |
| 1.4, 5.0b, 6.14 (sample; carried, r8) | markings `ι`, `ι ∘ [−1]`; `y² = x³ − x` at 5; `GSp_{2g}(ℤ/N)` | composite `[1]`; affine points `1+1+1+2+2 = 7`, `#E(𝔽₅) = 8`, `a₅ = −2`; `< N^{4g²}` | correct |
| 1.7 `LocalExistence`, 1.8 `HasGoodModel`, 1.9 `DedekindExistence`, 5.2 `GoodIsogeny`, 6.5 `EquationGoodComparison` (headline; carried, r8) | `dim A = 0`; good elliptic over `ℤ_p`; split `I₅`; Tate curve; `S = Spec ℤ[1/N]` | `Spec R`; abelian scheme; five components; no proper smooth model; abelian scheme after shrinking | correct, binders retained |
| 1.9a closure Checks (carried, r8) | closed point `x`, `𝒜 = E`, `g = t`; generic point; `P = (0,0)` on `y² + y = x³ − x` | `J ∩ R = (g)`; dimensions `0` and `1`; `V(ḡ) = ∅` at `η`; `5P = (1/4, −5/8)`, `(t − 2/5)(t − 2/3) ≡ t² mod 2` | correct |
| 1.1–1.3, 1.10, 2.3, 2.6, 2.8, 2.9, 3.1–3.5, 3.10–3.14, 4.2–4.7, 4.14, 5.0b–5.3i, 5.6, 6.0a, 6.4, 6.4c, 6.9–6.13 (carried, r8) | as in the previous report | as in the previous report (e.g. `(t,a,u)` rows, `Φ` by Kodaira type `0, ℤ/2, ℤ/5, (ℤ/2)², ℤ/4, 0, ℤ/2, ℤ/3`, `−29`, `N(E[5]) = 1`, `F² + 2F + 2 = 0`) | correct |

**Declared gaps.** None declared; none needed by the diff.

## Not verifiable

- SGA 7 I, Exposé IX (Springer LNM 288), §§1.1–1.2, pp. 321–323 (the locators of 2.1–2.2), and 10.4/11.6.1 (2.4). The sources service resolves only the paywalled publisher (DOI prefix 10.1007) and records the work as `uncertified`, and it is not among the operator-held texts. The rewritten 2.1–2.2 keep the locators of 4c22d44.
- The previous report's list of uncertified sources stands; none of those passages changed.
- The four admitted theorems of `Suggested.lean` are checked for elaboration only, not proved.

## Source issues

- none

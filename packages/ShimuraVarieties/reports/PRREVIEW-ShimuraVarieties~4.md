# Review of ShimuraVarieties (pull request #933 at 4b3416f)

**Verdict:** needs changes

Incremental re-review of the 24 README lines changed since f92fe3c: the repaired §7.0i.1 (the Mumford–Tate group as the fixer of untwisted Hodge tensors, Deligne's group inside `GL(V_B)×G_m`, the finiteness of the Galois action by Deligne's proof (ii), the locators by number), the three new supplier contracts (ShimuraData, ArithmeticGaloisRepresentations, NeronModelsAndSemistableAbelianVarieties), the scope and downstream sentences, the fixed ShimuraData anchor, the Deligne reference, and the semialgebraic clause in §3.5a and its contract. `Suggested.lean` and `metadata.toml` are byte-identical to the head the previous review read. The gate passes and the dependency check is clean. Four of the five previous findings are repaired; the repair of the old R01 is mathematically right in substance but introduced two small defects (one normalisation value, one degenerate case), and the pull-request description's merge-order block is still incomplete.

## R01 (P3) — The pull request description's merge-order block still omits StratifiedSpacesAndTameTopology

**Location.** The description (data): "It depends on no other author's open pull request." README lines 83 and 811 import StratifiedSpacesAndTameTopology Layer 4 and §4.9(a).

**Claim.** Every other author's open pull request that this roadmap cites is listed in the "must merge first" list.

**Witness.** `roadmaps list` shows `#1519 StratifiedSpacesAndTameTopology (new) @mycaule`; the folder is not on main. AffineMorseLefschetz A4.1, newly cited at lines 83 and 811, is on main and needs no entry.

**Repair.** Add #1519 (StratifiedSpacesAndTameTopology, mycaule) to the list of other authors' pull requests that must merge first, and drop "It depends on no other author's open pull request". Carried from the previous report (its R05).

## R02 (P3) — §7.0i.1 says the homothety `2·id` scales the polarization tensor by `4`; under the action of `GL(V_B)` on `V_B^∨` the value is `4⁻¹`

**Location.** README line 1893: "a polarization `ψ∈V_B^∨⊗V_B^∨⊗ℚ(−1)` is a rational Hodge tensor that the homothety `2·id∈𝐆(ℚ)` scales by `4`"; line 1903 (fifth Check): "is scaled by `4` under `2·id∈𝐆(ℚ)` … contains `2·id` with multiplier `4`".

**Claim.** The value by which `2·id` scales the tensor `ψ` is `4`.

**Witness.** `GL(V_B)` acts on `V_B^∨` by the contragredient, `(g·f)(v) = f(g⁻¹v)`, which is the action under which the untwisted tensor spaces of §7.0i are representations of `GL(V_B)` and under which `ψ⊗ψ^∨` has fixer `GSp(ψ)`. For `g = 2·id`: `(g·ψ)(v,w) = ψ(v/2, w/2) = ψ(v,w)/4`. Deligne's own formula gives the same: `g t = ν(g)^p t` for `t` of type `(p,p)` (deligne82 lines 1019–1020), with `ν(2·id) = 4` and the untwisted part of `ψ` of type `(−1,−1)` in his weight convention, so `g·ψ = 4⁻¹ψ`. The symplectic multiplier `ψ(gv,gw) = ν(g)ψ(v,w)` is `4`; the two numbers are inverse to each other, and the README uses the multiplier's value for the action on the tensor. The conclusion of the sentence (the homotheties are not in the fixer of the twisted tensors) is unaffected.

**Repair.** At line 1893 write "scales by `4⁻¹`" (or "multiplies by `ν(2·id)⁻¹ = 4⁻¹`, its symplectic multiplier being `4`"), and in the fifth Check "is scaled by `4⁻¹` under `2·id∈𝐆(ℚ)`, whose symplectic multiplier is `4`". Tested on the instance: with `V_B = ℚ²`, `ψ(v,w) = v₁w₂ − v₂w₁`, `g = 2·id`, the contragredient gives `(g·ψ)(e₁,e₂) = ψ(e₁/2, e₂/2) = 1/4`, and `ψ(ge₁, ge₂) = 4`. The scalar `c(g)` of the same sentence, defined by `g·ψ = c(g)ψ`, is then `4⁻¹` for `g = 2·id`, and `(g, c(g)⁻¹) = (2·id, 4)` fixes `ψ⊗(generator of ℚ(−1))` under Deligne's convention that `λ ∈ G_m` acts on `ℚ(1)` by `λ⁻¹` (deligne82 lines 1015–1016), as the sentence claims; only the displayed value `4` changes.

## R03 (P3) — The projection of Deligne's group to `GL(V_B)` is not injective for the zero abelian variety

**Location.** README line 1893: "record that its projection to `GL(V_B)` is injective, since `(1,λ)` fixes `ψ` only when `λ=1`".

**Claim.** For every abelian variety `A/E`, the projection of the fixer of all rational Hodge tensors in `GL(V_B)×G_m` to `GL(V_B)` is injective.

**Witness.** For `dim A = 0`: `V_B = 0`, `ψ = 0`, and every `(1,λ)` fixes `ψ`. The only tensor spaces are `ℚ(m)`, of type `(−m,−m)`, with a nonzero Hodge tensor only for `m = 0`; so Deligne's group is all of `G_m`, and its projection to the trivial group `GL(0)` has kernel `G_m`. The README's Conventions fix no positive dimension (its CM convention allows a "nonempty product CM algebra", line 20, but the abelian variety itself is unrestricted), and ShimuraData §1.2 explicitly allows the trivial object ("no central `G_m` is asserted in that case").

**Repair.** Add the hypothesis in the sentence: "for `A` of positive dimension (so that `ψ ≠ 0`), its projection to `GL(V_B)` is injective …", and record the zero variety as a negative control in the fifth Check: "for `dim A = 0` Deligne's group is `G_m` and the projection is not injective." Tested on the instance that refuted the original: with `ψ ≠ 0`, `(1,λ)·ψ = λψ` (Deligne's convention on `ℚ(−1)`) equals `ψ` only when `λ = 1`.

## Previous findings

- R01 — repaired: line 1893 now characterises `𝐆` as the fixer of the untwisted rational Hodge tensors, gives Deligne's group inside `GL(V_B)×G_m` with injective projection and image `𝐆` via `ψ⊗ψ^∨`, restricts "`ρ_ℓ(σ)` carries `t` to `t^σ`" to untwisted spaces with the `χ_ℓ(σ)^p` factor on twisted ones, replaces the lattice argument by Deligne's proof (ii), and cites Propositions 2.9(b), 3.1(c), 3.4, Theorem 2.11 by number and page. The repair introduced R02 and R03 above.
- R02 — repaired: lines 1904 and 2218 link `#12-mumfordtate-group`; line 2797 adds the Deligne reference with the author-version note.
- R03 — repaired: contracts for ShimuraData (line 103), ArithmeticGaloisRepresentations (line 105) and NeronModelsAndSemistableAbelianVarieties (line 107); scope sentence at line 13; SatoTateGroups §9.10 and AutomorphicBundles §1.1 named at line 2785.
- R04 — repaired: line 811 adds "On the semialgebraic structure these laws coincide, through the identification of the two dimensions in StratifiedSpacesAndTameTopology §4.9(a), with the product and fibre-dimension laws of AffineMorseLefschetz A4.1, which they specialize to rather than add to"; line 83 says the same.
- R05 — not repaired: the description still reads "It depends on no other author's open pull request" (R01 above).

## Verified sound

**Gate and dependency check.** The worker's gate at 4b3416f: every scanner 0, `depcheck=0`, `build=0`, OK. I re-ran the dependency check with the brief's command:

```
depcheck: 236 roadmaps, 2083 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The suppliers of the changed passages precede this roadmap (merge order line 106): ComplexComparisonPartII 39, AbelianSchemesAndArithmeticModuli 41, ArithmeticGaloisRepresentations 42, NeronModelsAndSemistableAbelianVarieties 47, ShimuraData 105; AffineMorseLefschetz is on main; StratifiedSpacesAndTameTopology (#1519, a new folder) is not in the order and is placed after its suppliers. The two roadmaps the downstream sentence names are later: AutomorphicBundles at line 169 and SatoTateGroups (not in the order; it consumes AutomorphicBundles §§1.2–1.3). `git diff --stat origin/main...HEAD` outside the folder: empty. `git diff --stat f92fe3c HEAD`: README only, 16 insertions, 8 deletions.

**Lean.** `Suggested.lean` is unchanged. I elaborated a scratch copy with `#check @` for all five declarations (`lake env lean`): the only warnings are the two `sorry`s (lines 70 and 83), and the five elaborated types are identical to the worker's `signatures.md` and to the previous reports; no section binder is lost. Imports, form, one-tactic probes, headline list and the not-statable docstring: as in the previous reports.

**Supplier citations of the changed passages, each resolved at the cited head (`roadmaps show`) or on main:**

- ShimuraData (#1038) §1.2 "Mumford–Tate group" (its README line 186, anchor `#12-mumfordtate-group`): `mumfordTateGroup` as the smallest `ℚ`-subgroup whose real extension contains `h(S)`; finite generation of `I_MT` by the noetherian ideal theorem (line 202); `mumfordTateMinimal` (206), `mumfordTateWeight` (208); §1.3 geometric connectedness (227); §1.4 reductivity for polarizable `V` (246). ShimuraData states no fixed-tensor description, as the contract says.
- ArithmeticGaloisRepresentations (#856) §1.11 (line 1282, anchor `#111-uniqueness-of-lattices-and-symplectic-models`): `Conj_H = H//H = Spec O(H)^H`, `χ_H` conjugation invariant over every field, `Conj_H(K)` the semisimple classes for `K` algebraically closed, the `GL_n → 𝔸^{n−1}×G_m` instance (lines 1350–1370); §2.1 "Decomposition groups" (1502); §2.2 "Ramification and Frobenius" (1677): `IsUnramifiedAt`, arithmetic Frobenius lifts (`frobCharpoly` uses an arithmetic lift), so "Its Frobenius is arithmetic; §7.0i.1 inverts it" is right.
- NeronModelsAndSemistableAbelianVarieties (#852) §5.1 (line 3024, anchor `#51-néronoggshafarevich`): good reduction over a henselian DVR iff inertia acts trivially on `T_ℓ(A)`, `ℓ ≠ char k`, with the non-henselian place-wise form delegated to §5.2; §3.10 (1810) semistable reduction after a finite separable extension; §3.7 (1716) `(σ−1)² = 0` on `T_ℓ(A)` for inertia. The contract's "Section 5.6 uses the direction from trivial inertia to good reduction" matches §5.6's text ("Apply NeronModelsAndSemistableAbelianVarieties §5.1 to get good reduction").
- StratifiedSpacesAndTameTopology (#1519) "## Layer 4: o-minimal structures, cells, dimension, triangulation" (anchor as linked) and §4.9 (line 651): "(a) the dimension of 4.5 equals AffineMorseLefschetz A4.1's semialgebraic dimension defined from CAD cells … A4.1's product and fibre-dimension laws … remain A4.1 targets". AffineMorseLefschetz on main, A4.1 (line 353): "Own semialgebraic dimension from CAD cells, its independence, finite-union/product/closure and fiber-dimension API". The new clause at lines 83 and 811 states exactly this specialization.
- AutomorphicBundles (#1069) §1.1 (line 814): `finiteTensorStabilizer`, finitely many mixed tensors cutting out a reductive group, Deligne Proposition 3.1(a–c); SatoTateGroups (#1725) §9.10 (line 2510): "prove here Deligne's inclusion `G_ℓ^{Zar,0} ⊆ MT(A)⊗ℚ_ℓ`", via Theorem 2.11 and Proposition 2.9(b). Both are later than this roadmap, so this roadmap may own the two statements and the downstream sentence is consistent; SatoTateGroups at its head still plans the inclusion itself, which is a matter for that roadmap's review (the earliest owner is here).
- Own references: §7.0i (line 1876: tensor spaces from `H_B`, duals and Tate twists; Tate lines retained with the cyclotomic twist), §5.7, and the §7.0 ordering sentence (line 1791, "used by no later section", meaning no later section of this roadmap, consistent with the downstream sentence).
- The `roadmaps resolve` lead "ModularCurves §5b" (line 1299, outside the diff) resolves: ModularCurves on main has "### 5B. Full ordered bases and fixed pairing" (its line 1313); the resolver is case-sensitive. The two Lean-name leads are this roadmap's own declarations, present in `Suggested.lean`.

**Source.** deligne82, Milne's author version fetched through the sources service from jmilne.org (author-page licence; now recorded as `deligne82` in the package manifest): Proposition 2.9 at line 798 (page marker 18), (b) at lines 805–807, proofs (i)–(iii) at lines 816–825 (page 19); Main Theorem 2.11 at line 848 (page 19); Proposition 3.1 at line 927 with (c) at line 932 (page 22); the Mumford–Tate group inside `GL(V)×G_m` at lines 1012–1020 (page 24), with `λ ∈ G_m` acting on `ℚ(1)` by `λ⁻¹` (lines 1015–1016) and the projection description `g t = ν(g)^p t` (1019–1020); Proposition 3.4 at line 1021 (page 24). Every locator of line 1895 and of the reference at line 2797 agrees.

**Adversarial table.** Rows for the changed statements first, with the values computed; rows for untouched statements are carried from the previous reports, whose values I did not recompute.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §7.0i.1: `𝐆` = fixer in `GL(V_B)` of all untwisted rational Hodge tensors | CM curve, `K`-action tensors in `V_B⊗V_B^∨`; non-CM curve, `ψ⊗ψ^∨`; `dim A = 0` | fixer of the `K`-endomorphisms is the centralizer of `K` in `GL_2`, `Res_{K/ℚ}G_m = 𝐆`; fixer of `ψ⊗ψ^∨` is `GSp(ψ) = GL_2 = 𝐆`; for `V_B = 0` both sides trivial | holds | — |
| §7.0i.1: both inclusions of the fixer characterisation | `t` rational of type `(0,0)`; `t` fixed by `𝐆` | `h(S)` acts on `T^{p,q}` by `z^{−p}z̄^{−q}`, trivially on `(0,0)`, so the fixer contains `h(S)`, hence `𝐆` by minimality; `𝐆 ⊃ h(S)` so a `𝐆`-fixed `t` is `h(S)`-fixed, hence `(0,0)`; Prop 3.1(c) for reductive `𝐆` | holds | — |
| §7.0i.1: finitely many untwisted tensors cut out `𝐆` | chain of fixers `Fix(F)`, `F` finite | ideals `J_F` increase to `J_∞ = I_MT`; `O(GL(V_B))` noetherian so `J_∞ = J_F` for some finite `F` | holds | — |
| §7.0i.1: `2·id` scales `ψ` by `4` | `V_B = ℚ²`, `ψ = e₁^∨∧e₂^∨`, `g = 2·id` | contragredient: `(g·ψ)(e₁,e₂) = ψ(e₁/2,e₂/2) = 1/4`; multiplier `ψ(ge₁,ge₂) = 4`; Deligne `ν(g)^p` with `p = −1`: `1/4` | value inverted | R02 |
| §7.0i.1: Deligne's group projects injectively onto `𝐆` | `(1,λ)` on `ψ ≠ 0`; `g ∈ 𝐆`, `c(g)` with `g·ψ = c(g)ψ`; `t ∈ T⊗ℚ(p)`; `dim A = 0` | `(1,λ)·ψ = λψ = ψ` iff `λ = 1`; `t⊗ψ^{⊗p}` untwisted Hodge so `g·t = c(g)^{−p}t`; `(g,c(g)⁻¹)` acts on `t` by `c(g)^{−p}·(c(g)⁻¹)^{−p} = 1` with `λ` acting on `ℚ(p)` by `λ^{−p}`; for `V_B = 0` the group is `G_m` and the kernel is `G_m` | holds for `ψ ≠ 0`; fails for `dim A = 0` | R03 |
| §7.0i.1: the transported tensor depends only on `σ = τ|_Ē` | `τ, τ'` with the same restriction | `(t^τ)_ét = σ(t_ét) = (t^{τ'})_ét`; `C_AH → H_ℓ` injective (deligne82 line 819) | holds | — |
| §7.0i.1: étale action on a `ℚ(p)`-twisted space is `ρ_ℓ(σ)·χ_ℓ(σ)^p` | `p = 1`, `σ = Frob_v` geometric | `ℚ_ℓ(1) = χ_ℓ`; `χ_ℓ(Frob_v) = q_v^{−1}`, matching the third Check's `q_v^{−1}` | holds | — |
| §7.0i.1: finiteness of the Galois action via proof (ii) | `C` the rational Hodge tensors of one space, `m = dim C` | kernel closed (factors through continuous `ρ_ℓ`, `C → C_ℓ` injective); image profinite and a subgroup of `GL_m(ℚ)`, countable; countable profinite is finite (Baire) | holds | — |
| §7.0i.1: `Γ_E^𝐆` open, independent of `ℓ` | untwisted defining `t_i`; CM curve over `ℚ` | `ρ_ℓ(σ) ∈ 𝐆(ℚ_ℓ)` iff `(t_i^σ)_ℓ = (t_i)_ℓ` for all `i` iff `t_i^σ = t_i`; kernel of a finite-image action; CM over `ℚ`: `E^𝐆 = K` | holds | — |
| §7.0i.1: Deligne's inclusion `G_ℓ^{Zar,0} ⊆ 𝐆_{ℚ_ℓ}` | `[Γ_E : Γ_E^𝐆] = n` | closure of `ρ_ℓ(Γ_E)` is a finite union of translates of the closure of `ρ_ℓ(Γ_E^𝐆) ⊂ 𝐆_{ℚ_ℓ}`; identity components agree | holds | — |
| §3.5a / line 83: on the semialgebraic structure the laws specialize to AML A4.1 | `A = {xy = 0} ⊂ ℝ²`; `ℝ × A`; fibres `A_x` | `dim A = 1` in both senses (SST §4.9 Check); `dim(ℝ×A) = 2 = 1+1`; `{x : dim A_x = 1} = {0}` of dimension `0`, part over it dimension `0+1 = 1`; `{x : dim A_x = 0} = ℝ∖{0}` of dimension `1`, part over it `1+0 = 1` | holds | — |
| Scope sentence (line 13), contracts (103, 105, 107), downstream (2785) | each named object against its supplier | `mumfordTateGroup`, `mumfordTateMinimal`, `mumfordTateWeight`, finite generation: ShimuraData lines 186–208; `Conj_H`, `χ_H`, `GL_n` instance: AGR 1350–1370; NOS, §3.10, §3.7: NMSAV 3024, 1810, 1716; `finiteTensorStabilizer`: AB 814; inclusion: STG 2515 | resolves | — |
| §7.0i.1 Checks 1–4, `γ_ℓ(v)` well defined, characteristic polynomial, inner form, `Conj_𝐆(ℚ)` non-injectivity (carried) | as in the review at f92fe3c | as there | as there | — |
| §3.5a laws, §5.9a, §§0.1–0.2, `CMType`, `reflexField_*`, Conventions, §§1.3, 1.5, 4.4, 4.9, 4.9a, 4.10, 5.1, 3.9, 8.17, 7.5, 7.0e, 8.1, 8.3, 8.6, 6.4, 8.5 (carried) | as in the review at e7d7bdc | as there | as there | — |

**Shape at the changed lines.** The three new contracts follow the existing paragraph form (bold link, imports by name, what is assumed, what is constructed here); the scope sentence names the owner of each object; the Deligne reference carries edition and page convention; no process words, pull-request numbers, LaTeX or machine paths in the diff. The fifth Check computes a value and names the wrong model (a fixer of twisted tensors) it excludes.

**Convention noted, no change needed.** The exponent in `(g, c(g)⁻¹)` is right under Deligne's convention that `λ` acts on `ℚ(1)` by `λ⁻¹` (deligne82 lines 1015–1016), which the sentence adopts by citing page 24; the computation is in the table.

## Not verifiable

- L. van den Dries, *Tame Topology and o-minimal Structures* (CUP 1998), cited at §3.5a for Chapter 4 §1: publisher landing page only; uncertified, as in the previous reports.
- The seeded sample's targets (0.6, 1.1, 2.3, 3.7, 4.9b, 4.11, 5.9, 5.12, 7.0, 7.0c, 7.3, 8.1, 8.9, 8.13, 8.18) are untouched by the diff; only §7.0's ordering sentence (line 1791) cites the changed §7.0i.1 and was checked for consistency. The verification of the full reviews stands for the rest.
- Kazhdan 1983, the Annals pagination of AGHMP and the texts listed in the earlier reports outside the seeded sample: unchanged, not re-attempted.
- Ownership against open pull requests the brief lists without files was not checked beyond the `roadmaps grep` index.

## Source issues

- **Gap** in deligne82 at Proposition 2.9(b), proof (iii), printed p. 19: the source says a Galois-stable positive definite form on the absolute Hodge classes shows the action factors through a finite quotient; it should also use a Galois-stable lattice, since the rational orthogonal group of a positive form is infinite; affects nothing (proofs (i) and (ii) are complete, and the README now uses (ii)).

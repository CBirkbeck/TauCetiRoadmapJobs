# PORT-VirtualFundamentalClassPartII

- Branch: `roadmap/virtual-fundamental-class-part-ii`, from main `0f9f711`.
- Head commit: `fd554cb` — "VirtualFundamentalClassPartII: roadmap (README, Suggested.lean, metadata)".
- Folder: `TauCetiRoadmap/VirtualFundamentalClassPartII/{README.md,Suggested.lean,metadata.toml}`; nothing outside it changed.

## Build

`lake build TauCetiRoadmap.VirtualFundamentalClassPartII.Suggested`:

    ✔ [18238/18239] Built TauCetiRoadmap.VirtualFundamentalClassPartII.Suggested (6.2s)
    Build completed successfully (18239 jobs).

Warnings: 0. The file declares nothing (no headline theorem is statable at the pins), so there is
no `sorry` warning either.

## Gate

    gate VirtualFundamentalClassPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency check (`gate --depcheck … --movable`), run on the final README:

    depcheck: 252 roadmaps, 2395 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

## Draft pull request body

Extend the Behrend–Fantechi virtual fundamental class of VirtualFundamentalClass beyond separated
Deligne–Mumford stacks with the resolution property and smooth bases. The roadmap builds integral
Chow groups of Deligne–Mumford stacks of finite type over an arbitrary field whose diagonal is
quasi-compact and separated, with no separatedness of the stack assumed, together with their
integral operations (flat pullback, pushforward along proper representable morphisms, localisation,
exterior products, refined Gysin maps with algebraic-space sources). Through the finite cover by a
scheme that every such stack has, it adds rational pushforward along every proper morphism, Gysin
maps and Chern classes on stacks, and it identifies the rational groups with VirtualFundamentalClass's
groups on separated stacks. On these groups it proves the intersection ring of a smooth stack with
Poincaré duality, Vistoli's isomorphism with the Chow groups of a moduli space, the ring structure of
the Edidin–Graham comparison and the degree `[κ(x) : k]/|Aut(x̄)|` of a closed point. It then frees the
virtual class from the resolution property and from separatedness. It also proves the relative
obstruction class and the relative characterisation of obstruction theories, the no-obstruction and
obstruction-bundle formulas, and regular-immersion pullback and functoriality over bases of pure
dimension, reduced or not, through Kresch's restricted invariance of the canonical rational
equivalence. The final layers give deformation invariance of virtual counts over a regular curve and
the perfect relative obstruction theory `(Rπ_* F^*T_X)^∨ → L_{M/𝔅}` of spaces of maps from prestable
curves to a smooth scheme over any pure-dimensional base, which AlgebraicGromovWittenTheory
specialises to stable maps.

AI assistance: Claude (Opus 5.5) performed the port, the supplier, ownership and source checks, the
adversarial mathematical pass and the Lean validation.

## Dependencies still in pull requests

New-roadmap dependencies, cited in the README by name and section, checked at their current heads:

- VirtualFundamentalClass (another author's new roadmap; §§0.2–0.3, 1.4–1.6, 2.1–2.5, 3.1–3.5, 4.1–4.5,
  5.1–5.5, 6.1–6.6, 7.1–7.7, 8.1–8.5, 9.1–9.6 all exist with the cited subjects).
- StackPointsAndResidualGerbes (§§0.1, 0.3, 0.5, 1.3, 2.3, 2.5, 4.5, 5.3, 5.4 exist with the cited subjects).
- StableReductionPartII (§5.15 states the Edidin–Graham comparison with the hypotheses the README repeats).

AlgebraicGromovWittenTheory is named only as a downstream consumer and in one comparison clause
(9.3, 9.5); it is in no `*Needs:*` line and no supplier contract.

All other suppliers are on main: SchemeAndStackFoundations, EquivariantIntersectionTheory,
StableReduction, EnhancedDerivedSheaves, DerivedModuleAlgebra. The 23 cited SchemeAndStackFoundations
sections and its 30 backticked names were resolved on main. The same section numbers also hold at the
head of its open revision (the multi-roadmap pull request that revises SchemeAndStackFoundations), so
none of these citations breaks when that revision merges.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already stated nothing. Its docstring lists the twelve
headline theorems and the carrier each one lacks. I re-checked each against the pins: no algebraic
or Deligne–Mumford stack predicate, no Chow groups of algebraic spaces or stacks, no flat pullback,
Chern classes, normal cones or Gysin maps in the Tau Ceti Chow API (`Chow/Basic.lean`,
`Chow/ClosedImmersion.lean` only), no equivariant Chow groups, and no cotangent complex of a morphism
of schemes or stacks. Grep over both pinned trees found only ring-level cotangent files. So the
"not statable" verdict stands for all twelve. Kresch's `P`-divisor identity is statable on schemes
using `Chow.RatEquivFamily`, but it is a tool inside 8.1 and not a headline, so it stays in the README.

One docstring edit: "The pinned Mathlib has no algebraic stacks" now says that Mathlib has the
descent condition `CategoryTheory.Pseudofunctor.IsStack` for `Cat`-valued pseudofunctors and no
algebraic stacks. That was true before, but the edit says precisely what the pin has.

Binder check: `Suggested.lean` has no declaration, so there is no elaborated signature to compare.
Instead I put `#check @name` for all 26 library declarations the README and docstring cite into a
scratch copy of `Suggested.lean`, built it once, and then restored the file. All 26 elaborate at the
pins. For example, `TauCeti.AlgebraicGeometry.Spaces.IsAlgebraicSpace : SchemePresheaf → Prop`,
`TauCeti.AlgebraicGeometry.PrestableFamily : (X ⟶ S) → Prop`, and
`AlgebraicGeometry.Scheme.Hom.higherDirectImage : (X ⟶ Y) → ℕ → X.Modules ⥤ Y.Modules`.

## Supplier replacements and duplication removals

- **Supplier added (precision, no restatement removed):** Tau Ceti's
  `TauCeti.AlgebraicGeometry.Chow.RatEquivFamily` and `RatEquivFamily.cycle`
  (`TauCeti/AlgebraicGeometry/Chow/Basic.lean`) carry the scheme-level rational equivalences, and
  `RatEquiv` is defined as the subgroup of their cycles. The README now names them in the Tau Ceti
  contract. 2.3's scheme comparison now says that every element of `W_i(X)` is a finite
  `RatEquivFamily X i` whose cycle is `∂` of it, and its `*Needs:*` line cites them. Before, 2.3
  compared only with `RatEquiv`.
- **Duplication sweep by object** (roadmaps on main and the open roadmap pull requests, through
  `roadmaps grep`/`show`): integral and non-separated Chow groups of stacks, Chow groups of algebraic
  spaces, generic stabilisers and degrees of stack morphisms, proper covers (Rydh), the moduli-space
  comparison, the Edidin–Graham ring structure, degrees of residual gerbes, `P`-divisors and Kresch's
  rational equivalence, virtual classes without the resolution property, relative obstruction
  classes, Kodaira–Spencer maps and obstruction theories of spaces of maps. No second owner:
  - VirtualFundamentalClass owns only the separated, resolution-property, smooth-base versions, and
    the README imports them.
  - EquivariantIntersectionTheory puts "Chow groups of stacks that are not global quotients" and Chow
    groups of algebraic spaces out of its scope.
  - MotivicStructuresInModuliOfCurves consumes VirtualFundamentalClass's rational groups and requests
    a different object (rational Chow groups of quotient-stratified Artin stacks) from
    SchemeAndStackFoundations.
  - AlgebraicGromovWittenTheory §§4.1–4.3 is the stable-map special case of 9.3–9.5. 9.3 says in one
    clause how it is more general, and AlgebraicGromovWittenTheory is a consumer, not a supplier.

  Nothing was removed, so "Scope and ownership" needed no new deferral.
- The board package VirtualFundamentalClasses plans the same Chow core. It is under review with
  `needs_changes` and is later in the merge order (this roadmap is earlier). Per the maintainer
  decision recorded with this package, it is not an owner.

## Other README edits (an upstream reviewer's reading)

1. **5.2, third Check (imprecise claim):** it said "integrally `p_* : ℤ/2 → 0`" for the coarse map of
   `[𝔸¹/μ₂]`. That map is not representable, so 3.2 gives no integral pushforward. The Check now says
   this, and that on cycles no integral pushforward agrees with 4.1 (`p_*[Bμ₂] = (1/2)·[0]`). On Chow
   groups the zero map `ℤ/2 → 0` would agree rationally, so the claim is restricted to cycles.
2. **8.4, route (imprecise wording):** "Since `B` does not map to `𝔐 × B`" became "Since `B` is not a
   stack over `𝔐 × B`". A morphism `B → 𝔐 × B` may exist (for `𝔐 = B𝔾_m`, through the trivial bundle).
   The point is that `B` is not given one, so 4.2's commutation with proper pushforward over
   `𝔐 × B` does not apply to `X → B`.
3. **8.1, missing API list:** its six definitions (the groups `Z_*`, `W_*` of algebraic stacks, the
   deformation space `M°_F G`, `P`-divisors and the two `P`-divisor operations) had their properties
   only as "Prove" bullets. A **API.** block now states three more facts, all checked:
   - smooth pullback `q^* : Z_i(𝔛) → Z_{i+r}(𝔛′)`, `W_i(𝔛) → W_{i+r}(𝔛′)`, commuting with `∂` and
     composition, carrying cycles of closed substacks to cycles of their preimages; it is restriction
     on open substacks and 3.1's flat pullback between stacks of Convention 1. A chart `U → 𝔛′` of
     relative dimension `r_U` gives a chart of `𝔛` of relative dimension `r_U + r`, which is where
     the shift by `r` comes from;
   - restriction of the deformation space to an open substack of the target;
   - additivity of `D·` and its compatibility with restriction to nonempty opens, which always meet
     `U` and `U′` because `M` is irreducible.

Process words, LaTeX, pull-request numbers and machine paths: none (grep and gate `residue=0`,
`latex=0`, `prnum=0`, `private-paths=0`). The `gap:` slugs keep the form that roadmaps on main use
for declared supplier gaps (for example AlgebraicModuliForArithmeticGeometryPartII).

## Adversarial mathematics pass

Every row was recomputed for this port. Sources were re-read in the cached texts where a row cites
one. `Suggested.lean` has no declaration, so the context and binder rows (items 2–3 of the brief)
are empty. The generality of each README statement was checked against its source instead.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conv. 1, the class of stacks | `Bℤ`; `𝔸¹/ℤ` (char 0); `B S₃`; scheme of finite type; qs algebraic space | `Bℤ`: fibre of the diagonal `⊔_ℤ Spec k`, not qc → excluded, and not qs → no base of 9.1. `𝔸¹/ℤ` not qs → excluded. `e(BS₃) = 6`. Scheme: the diagonal is an immersion (separated, qc) → included. Space: the diagonal is a monomorphism (separated), qc → included | holds | — |
| Conv. 1, `μ₂` in char 2 | `μ₂ = Spec k[x]/(x−1)²` | not reduced → `Bμ₂` is not DM, so the examples need `char ≠ 2` | holds | — |
| Conv. 2, regular local immersion charts | `Spec k → BG`; `η_b : B𝔾_m×{b} → B𝔾_m×B`; diagonal of `BG` | `U = V = Spec k`, `U → G` the unit section, open and closed, codim 0. `V = B`, `U = {b}`, the fibre product is `{b}`, codim 1. `U = V = G`, codim 0 | holds | — |
| Conv. 5, degree witness | `BG → Spec k`, `Spec k → BG`, composite | `(1/|G|)·1`; `(|G|/1)·1 = |G|` = rank of `G → Spec k`; product 1 | holds | — |
| Conv. 6, truncation and dualisation witnesses | elliptic curve; curve; abelian surface; `ℙ¹`, `E = [O(1) →0 Ω]` | `Hom(O[1],O[2]) = H¹(O) = k`; `Hom(O[1],O[3]) = H²(O) = 0` on curves and `k` on `A`; `rk E = 1−1 = 0`, `Ob = O(−1)`, degree −1 | holds | — |
| Conv. 7 witness | `Spec k → B𝔾_m` | `dim B𝔾_m = −1`, `rk Ω_{pt/B𝔾_m} = 1`, vd 0; relative diagonal = unit section of `𝔾_m`, unramified | holds | — |
| 1.1, proper covers | rydh2015 lines 81–85 re-read; `L` (doubled line); `B_{𝔸¹}G`; base change along `BG → Spec k`, `⊔_ℕ Spec k` | Rydh: "quasi-compact DM stack with qc separated diagonal → finite fp surjective `Z → X`, étale over a dense qc open", as stated. For `L`: the valuative criterion gives two extensions of one generic point in a separated `Z`, so no separated cover. `Q ×_L Q = Q ⊔ Q|_{t≠0} ≅ Q ×_{𝔸¹} G`, so `L → B_{𝔸¹}G` has degree 2; a separated `X` would give a finite étale `P → X` of degree 2 over `t ≠ 0` and 1 over 0. `id_{BG}` has a non-scheme source; `⊔_ℕ` is not qc | holds | — |
| 1.1, DM 4.12 | deligne-mumford1969 lines 1012–1019 re-read | `g` proper surjective generically finite, `T′ ⊆ T″` open, `T″` projective → `T′` quasi-projective | holds | — |
| 1.2, `k(𝒱)` and `e(𝒱)` | `BG`; `[𝔸¹/μ₂]`; `Bμ₂`; `[Spec ℂ/(ℤ/4)]` over ℝ; `[ℙ¹/μ₂]` | `k(BG) = k`, `e = |G|`; `e = 1`, `k = k(x²)`; `e = 2`; `k = ℂ^{ℤ/4} = ℝ`, `e = |ker| = 2` (acting-group order 4 is wrong); `Γ(O) = k` (trdeg 0) vs `k(t²)` (trdeg 1 = dim) | holds | — |
| 1.3, degree | inertia sums; coarse `[𝔸¹/μ₂] → 𝔸¹`; `Bμ₂ → {0}`; `ℤ/p` quotient in char p; `L → B_{𝔸¹}G`; dominant base change along `y = s³` and `y = s²` | ℤ/2: 1+1 = 2. `S₃`: `[S₃:Z(c)] = 1,3,2`, sum 6. `Bμ₃/ℚ`: `1 + (3/3)·2 = 3` with 2 components. `[𝔸¹/μ₂]`: the non-dominant component is dropped → 1. Coarse map 1; `Bμ₂ → {0}` 1/2. `ℤ/p`: `(1/p)·p = 1 = p/p`. `L → B_{𝔸¹}G`: `(2/1)·1 = 2` = rank of `Q → 𝔸¹`. `y = s³`: the fibre product `[{x² = s³}/μ₂]` is integral, degree 1 = 1. `y = s²`: `x = ±s`, not integral → excluded by hypothesis | holds | — |
| 2.1, cycles | `[V(x²)/μ₂]`; `∅`; `⊔_ℕ` atlas | `2·[Bμ₂]` (length 2); `Z_i(∅) = 0`; the pullback of `[Spec k]` is no element of the free group | holds | — |
| 2.2, `A_0([𝔸¹/μ₂]) = ℤ/2` | origin; `P(y)` with `P(0) ≠ 0`, including inseparable `P` in char p; ℚ, `x⁴+1` | `ord_{Bμ₂} g(y) = 2·ord_0 g`, even. `k[x]/P(x²) = K[x]/(x² − ȳ)`, `K = k[y]/P`, `ȳ ≠ 0`, char ≠ 2 → étale over `K`, reduced, coefficient 1 (holds even for inseparable `P`). `div(y²+1) = [W]`. So `ℤ/2`, and `⊗ℚ = 0` | holds | — |
| 2.2, `BG` | `A_0`, `W_{−1}` | `A_0 = ℤ`; `W_{−1}(BG) = k^×` ∋ 2 ≠ 1 over ℚ; `∂` lands in `Z_{−1} = 0` | holds | — |
| 2.3, comparisons | `Spec k`; `L`; schemes vs `RatEquivFamily` | `A_0 = ℤ` = `equivIntOfUnique`; `A_0(L) = ℤ²/ℤ(1,1) ≅ ℤ` (`div t = [0₁]+[0₂]`) vs `A_0(𝔸¹) = 0`; a finite family per summand, with `RatEquivFamily.cycle` = `∂` | holds | cite `RatEquivFamily` |
| 3.1, flat pullback | `π : Spec k → BG`; coarse map; étale 2-isogeny `π : E′ → E` | `π^*[BG] = [Spec k]` (not `|G|`). Coarse map: `[0] ↦ 2[Bμ₂] = 0` in ℤ/2. Isogeny: the sum of `π^*([P]−[O])` is `(2Q+T) − T = 2Q = π̂(P) = O` → 0, while `[P]−[O] ≠ 0` | holds | — |
| 3.2, representable pushforward | `𝔸¹ → 𝔸¹ × BG`, `φ = t`; `Spec k → BG → Spec k`; `ℙ¹ → Spec k` | `f_*div t = |G|[0×BG]`, `div N(t) = [0×BG]`, factor `|G|/1`; `|G|·c = 1` is impossible for `|G| > 1`; `[κ(P):k]` | holds | — |
| 3.3, push–pull and localisation | `π` against itself; `Bμ₂ ⊆ [𝔸¹/μ₂]`; ℙ¹ with two points | both sides `|G|[Spec k]` (`Σ_z [κ(z):k] = |G|`); `ℤ → ℤ/2 → 0 → 0` exact; kernel `ℤ(1,−1)` | holds | — |
| 3.4, exterior product | `K/k` separable of degree 2; purely inseparable of degree p; `BG × BH` | `K⊗K = K×K`: 2+2 = 4. Local of length p → `p[Spec K]`, `p·p = p²`. `[B(G×H)]` with coefficient 1 | holds | — |
| 3.5, homotopy invariance and Gysin maps | `𝔸¹ → pt`; non-scheme `X/ℝ`; `O(−1)` on ℙ¹; `z ↦ z²`; `Spec k → BG`; flat and non-flat base change | `[1] = div(x−1)`, `Z_{−1} = 0`. `A_0(X) = 0` (`div t = [0_X]`) and `A_1(X×𝔸¹) = 0`. `−[pt]`. `2[pt]`. `[G] ↦ |G|[Spec k]`. `t ↦ (t²,t)`: both `2[pt]`; `{0} → 𝔸¹`: `[pt]` vs `c_1(O)∩[pt] ∈ A_{−1} = 0` | holds | — |
| 4.1, rational pushforward | `BG → Spec k`; coarse; `L × B(ℤ/2) → L` | `1/|G|`, then `|G|·(1/|G|) = 1`; `2·(1/2)[0] = [0] = div y`; `(1/2)[0₁]` | holds | — |
| 4.2, stack Gysin | `π : Spec k → BG`; diagonal of `BG`; `X/ℝ` | `|G|^{−1}·|G| = 1`. Diagonal: `Y = Spec k`, `deg = |G|²`, `f^![Y] = [G]`, `r_*[G] = |G|·|G|[BG]` → `[BG]`. `X/ℝ`: `κ = ℂ` over 0 but nearby functions are real at 0 → no affine neighbourhood | holds | — |
| 4.3, Chern classes | `L ⊕ L^∨`; `BG`; `μ_n` | `c = 1 − c_1(L)²`; `c_i ∩ [BG] ∈ A_{−i} = 0`; `A^1_{μ_n} = ℤ/n` | holds | — |
| 4.4, agreement | `B(ℤ/2)`; `O(1)` on ℙ¹ | 1/2 in both theories; `[pt]` in both | holds | — |
| 5.1, product and Poincaré duality | projection formula for `BG → Spec k`; `[ℙ¹/μ₂]`; `L`; `𝔸¹ ⊔ 𝔸¹ → 𝔸¹`; `L → 𝔸¹`; vistoli1989 Prop. 5.6 (lines 1719–1750) re-read | Both sides of the formula are `(1/|G|)[Spec k]`; the weighted product `|G|[BG]` would give `[Spec k]`. `[𝒫]² ∈ A_{−1} = 0`. `[0₁]·[L] = [0₁]` (SchemeAndStackFoundations §5.6 Check, verified on main). `ℚ²` in dim 1 and 0 in dim 0. `L` is excluded (pullback not separated). For separated `ℳ`, "`T` separated ⇔ `t` separated" holds by cancellation of properness of diagonals | holds | — |
| 5.2, moduli spaces | `BG`; `ℤ/p` quotient (invariants `k[x, y^p − x^{p−1}y]`); base change to `y = 0`; `⊔_ℕ` | `(1/|G|)[Spec k]`; `deg = (1/p)·p = 1 ≠ 1/e = 1/p` (`k(y^p)` not perfect); `2·(1/2) = 1`; not qc → excluded | holds | reword the `[𝔸¹/μ₂]` Check (no integral `p_*`) |
| 5.3, Edidin–Graham ring | `𝔾_m` with weights (1,2) on `𝔸²∖0`; `μ_n` acting trivially; `𝔾_m` on `𝔸¹`; edidin-graham1998 Prop. 15 (lines 1069–1076) re-read | `ℤ[t]/((1t)(2t)) = ℤ[t]/(2t²)`, `⊗ℚ = ℚ[t]/(t²)`, `t ↦ [Bμ₂]` (zero of `x`, stabiliser `μ₂`); `ℤ[t]/(nt) ⊗ ℚ = ℚ`; not DM → excluded | holds | — |
| 5.4, degree of points | `BG`; `Spec K`; `ℤ/4` gerbe; `[ℙ¹/μ₂]` | `1/|G|`; `[K:k]` (p when purely inseparable); `[ℝ:ℝ]/2 = 1/2 = 2/4` (1/4 is wrong); `div(t²/(t²−1)) = 2[𝒫] − [𝒪]`, `∫ = 1 = 1` | holds | — |
| 6.1, comparison bundle | `[0→0]` vs `[O→O]`; ℙ¹, `E = [O(−4) →0 Ω]` with `1+ξ`; `F ⊕ [G →id G]` | `P = 𝔸¹_X`, rank `0+1 = 1+0`. `Hom_D(E,E) = k ⊕ k ⊕ H¹(O(−2)) = k³`, chain maps `k²`, homotopies `H⁰(O(−2)) = 0`; `P` is the nonsplit extension of `O(4)` by `O(2)`, i.e. `O(3)²`; split `k²` at a point. Rank `rk F_1 + rk H_0` | holds | — |
| 6.2, virtual class | ℙ¹ with `O(1)`; the 6.1 theory; `L` with `𝓛_n`; `d + r < 0` | −1 (dual convention +1). Degree 4 directly, and degree 4 through `P` as `c_1(O(3)²/O(2)) = c_1(O(4))`. `n[0₂]`, and the opposite gluing gives `n[0₁] = −n[0₂]`. 0 | holds | — |
| 6.3, relative formulas | `Spec k[ε]/ε²`; node × ℙ¹; `k[x]/(x^p)` in char p; `pt ⊔ 𝔸¹`; `Spec k → B𝔾_m`; behrend-fantechi1997 Prop. 7.3 (lines 1702–1711) re-read | `[𝔜] = 2[pt]`. `−[𝔜×pt] ↦ −([ℓ_a]+[ℓ_b])`. `s = 1` vs `dim X − d − r = 0`, `[X] = p[pt] ≠ c_1(O)∩[X] = 0`. `[pt]` (a single exponent 1 would give 0). `[pt] ∈ A_0`. The exponent in BF 7.3 is `rk h¹(E^∨)` | holds | — |
| 7.1, relative obstruction class | `Spec k → B𝔾_m`; `k[x]/x²`, `x ↦ ε` into `k[ε]/ε³` | torsor `1+J ≅ J = Hom(O,J)` (the absolute group is 0); `(ε+aε²)² = ε² ≠ 0` for all `a`, all chars | holds | — |
| 7.2, characterisation | char 2, `k[x]/x²`, `φ = (0,id)`; ℙ¹ with `O(1)` | `H^{−1}(φ) = 0`; `φ^*ω(g) = 0` (`ω(g)` lives on the `H^{−1}` summand of the split `L_X`), but `(x+ax²)² = x² ≠ 0` in `k[x]/x³` → (3) fails; `H^{−1}(E) = O(1) ≠ 0` | holds | — |
| 8.1, groups of algebraic stacks | `B T_{𝔸¹}`; `⊔_n 𝔸ⁿ`; `[𝔸¹/μ₂]` | `Z_i = Z_{i+1}(𝔸¹)`, `[BT]` in degree `1−1 = 0`; `β_n = ν/ξ_1 ∈ W_n(𝔸^{n+1})`, in no `⊕_i W_i`; `div(x²) = 2[0] ↦ 2[Bμ₂]` | holds | API block added |
| 8.1, deformation space | `Spec k → BG`; 2 points → `Spec k`; `{0} → 𝔸¹` | `R = Spec k`, `S = G`, quotient = `B_{ℙ¹}`(`G` off 0, trivial at 0), and `B_{𝔸¹}G` of 1.1 for ℤ/2; ℙ¹ with 0 doubled (1 point and 2 points); `Spec k[t,u]`, `x = tu`, fibre at `t = 0` is `Spec k[u]` | holds | — |
| 8.1, `P`-divisors | kresch1999b Defs. 1.4–1.6 and Cor. 1.10 (lines 83–190) re-read; `a` vs `2a` on `𝔸²/ℚ`; nodal cubic | `D·(M,a) = ({a=0}, 1) = 0` vs `({a=0}, 1/2) ≠ 0`, both with boundary 0. `φ = (τ−1)/(τ+1)`: Weil divisor 0, `|D| = {node}`, `D·(M, τ+2) = (node,3)+(node,1) = (node,3)` | holds | — |
| 8.1, `β` and invariance | behrend-fantechi1997 lines 823–825 re-read; double deformation `k[s,t,ξ,η,ν]/(sη−tν)`; plane with `p = y` and `p = x`; `𝔸¹ × Spec k[ε]/ε²`; `𝔅′ = 𝔅` | `∂β = [C_{u^*C/C}] − [ρ^*C_{X′/Y′}]`. The hypersurface is normal (singular locus has codim 3); `ord_W s = ord_W t = 1`; `ω = (W, t/s) = (W, η/ν)`, `∂ω = [η=0]−[ν=0] = D·[E] − E·[D]`, so `β = ν/η`. `ξ ↦ ξ+a` fixes `ν/η`; `ν/(η+b) ≠ ν/η`. `I^n/I^{n+1} = ⟨t^n, t^{n−1}ε⟩`, `[C] = 2[T-line]`, `β = 2·(ν/T)` (`Y_red` gives 1·). `β = 0` | holds | — |
| 8.2, regular pullback | open immersion; `{0} → 𝔸¹`; node with `V(a+b) = Spec k[a]/a²`; `𝔸¹ × Spec k[ε]/ε²` | restriction; `[Z]`; `−2[pt×pt]` on both sides (`a+b` is a nonzerodivisor); `v^!(2[𝔸¹]) = 2[pt] = [𝔜′]` (`𝔜_red` would give `[pt]`) | holds | — |
| 8.3, functoriality | `id`; `𝔸¹ × Z → Z`; non-qc `Z′ = pt ⊔ ⊔_ℕ pt`; behrend-fantechi1997 lines 1721–1736 re-read | equal; `dim 𝔠_{X′} = 1−1 = 0` over `𝔸¹` (dim 1); every choice of `Z′_0` gives `[pt]`; hypotheses match Prop. 7.5 | holds | — |
| 8.4, deformation invariance | `x² − b y²`; `xb = 1`; `m + r = 1`; doubled-line base; `𝔸¹ ⊔ 𝔸¹`; `y² = x^p − a` over `𝔽_p(a)` | 2 at split, non-split and double fibres; 1 vs 0 (not proper); no degree; 2 at `0₁`, `0₂` and `t ≠ 0`; 1 vs 0 (not connected); maximal ideal `(y)`, `∂_x = p x^{p−1} = 0`, `∂_y = 2y = 0` → regular and not smooth, count 1, `k`-degree p | holds | reword "`B` is not a stack over `𝔐 × B`" |
| 9.1, spaces of maps | `X = Spec k`; `⊔_ℕ`; `ℙ¹ → ℙ^r`; `id_{ℙ¹}` from a point | ⇔ `M → 𝔅` étale; not qc → excluded; dim `(r+1)(d+1) − 1`; `H⁰(T_{ℙ¹}) = k³` vs 0 | holds | — |
| 9.2, duality and base change | genus-g curve; nodal fibre; `R = k[x_i]/(x_i)²` | `χ(L) = e+1−g`, `χ(ω) = g−1`; `2g(Ẽ)−2+#branches`; `t·x_1 = x_1² = 0` → not flat and not Noetherian, `Rπ′_*O` free of ranks 1 and g | holds | — |
| 9.3, obstruction theory | `X = Spec k`; ℙ^r (Euler sequence); elliptic `C → C`; `L` | étale ⇔ (the naive cotangent complex vanishes); `χ = (r+1)(d+1)−1 = (r+1)d + r`; `rk E = 0`, `Ob = O`, `c_1(O)∩[M] = 0`; vd `0+0+1·1 = 1 = dim L` | holds | — |
| 9.4, global resolution | `V = O`; embedded point; `L = O` (not ample) | `χ = 1−g`; `H⁰(L^{−N}) = k`; `G = O`, `H = 0`, `[0 → R¹π_*O]` misses `O_M` | holds | — |
| 9.5, virtual dimension | ℙ² lines; CY3; abelian threefold `g = 0`; `Spec k ⊔ ℙ¹`; ℙ¹ with a doubled point; `ℙ¹ × 𝔸¹` | `−3+3+2 = 2`; `n` (`g = 2, n = 0`: 0); 3 = dim X; `ℓ = 0` → 0 (vs 1); `2+1 = 3 = h⁰(O(2))`; `2+2 = 4 = dim PGL₂×𝔸¹`, `β = div t = 0`, `A_0 = A_{−1}(ℙ¹) = 0`. The formula agrees with AlgebraicGromovWittenTheory §4.3's `(1−g)(d−3) + n + c₁·β` | holds | — |

Duplication by object (item 9) is the sweep above. The pinned objects the README relies on were
opened at the pin. `AlgebraicGeometry.Scheme.ord` has junk value 0 at coheight ≠ 1 and for `f = 0`
(`Mathlib/AlgebraicGeometry/OrderOfVanishing.lean`, `def ord`). `IsAlgebraicSpace` has no
quasi-separatedness, which Convention 1 adds. `RatEquivFamily` asks for locally finite supports and
dimension `k + 1` through `pointsOfDimension`.

## Unresolved

- **The two declared supplier gaps are still open at VirtualFundamentalClass's head (`cd5dcf5`).**
  `gap:closed-substacks-of-stacks`: its §2.1 uses integral closed substacks without stating them or
  their images under proper morphisms. `gap:normal-cones-of-local-immersions`: its §1.5 forms normal
  cones of representable closed immersions only. The package's acceptance was conditional on them,
  and the README keeps both as "What VirtualFundamentalClass must provide" declarations.
- Main has moved past the branch point (the citation resolver reports `2b9ce21`). The branch is on
  `0f9f711` as the brief requires; no file of this folder exists on the newer main.
- Ownership against open pull requests was checked with the `roadmaps` tools (`grep`, `show`,
  `overlaps`, `resolve`) at the heads indexed 2026-11-16. No text read during the job contained
  instructions, so there is nothing suspicious to quote.


Pull request: #2446 (roadmap/virtual-fundamental-class-part-ii at fd554cb)

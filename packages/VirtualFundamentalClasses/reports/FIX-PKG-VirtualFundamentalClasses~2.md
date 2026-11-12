# Repair of VirtualFundamentalClasses (package), round 2

Findings of `reports/REV-PKG-VirtualFundamentalClasses.md` (one review, ids R01–R15), each checked
against the cached sources, the pinned Mathlib and Tau Ceti, and the supplier roadmaps on main.
Files changed: `packages/VirtualFundamentalClasses/README.md`, `Suggested.lean` (module docstring
only), `sources.toml`. `metadata.toml` and `design/plan.json` are unchanged (no supplier gap was
needed).

## R01 (P1) — applied

Convention 1 now makes every algebraic space and stack quasi-separated (diagonal quasi-compact and
quasi-separated, via `RepresentableProperty` of SchemeAndStackFoundations §1.19), distinct from
`IsSeparatedStack`; behrend-fantechi1997 lines 168–170, vistoli1989 (7.14). Witnesses: `Bℤ`
excluded, `B(S₃)` and non-separated `BG` kept, `𝔸¹/ℤ` excluded. Same correction in the
`Suggested.lean` docstring.

## R02 (P2) — not actionable in this package: choosing the single owner of the shared Behrend–Fantechi core between two open roadmaps (VirtualFundamentalClass and this one) is a scope and merge-order decision

Checked with `roadmaps show`: VirtualFundamentalClass, another author's new folder, plans the
same stack Chow/Gysin theory, cone stacks, obstruction theories and virtual class. Neither roadmap is
on main, and VirtualFundamentalClass is not in ORDER.txt. Making either the owner deletes most
layers of the other, which is a re-plan.

Edited here: the Boundaries no longer call GromovWittenTheory symplectic (two open pull requests
share that folder name). They also state that 11.2–11.6 are owned here for every base, and that a
stable-map roadmap verifies 11.1 and consumes them.

## R03 (P1) — applied

§1.1: "base change of a proper cover along any morphism is a proper cover" → the base change is
proper and surjective, and is a proper cover when its source is a scheme (e.g. `q` representable
by schemes). Added the `B(ℤ/2)` negative control. The doubled-origin argument now uses
a dominating component. §5.1's `E_X → E` was repaired the same way.

## R04 (P2) — applied

Convention 1 has a standing clause: every `μ₂` sign example and every `Bμ₂` example assumes
`char k ≠ 2`. In characteristic 2, `μ₂` is ramified and `[𝔸¹/μ₂]` is not DM. Tests in
characteristic 2 use constant groups (1.5 with `p = 2`). The clause covers every sign example in
Layers 1–6 and Convention 4's witness.

## R05 (P1) — applied

§2.2 Check: "`W_i(BG) = 0` for every `i`" → `W_i(BG) = 0` for `i ≠ −1`, `W_{−1}(BG) = k^×`
(`2 ∈ ℚ^×` for `k = ℚ`), `∂ = 0` because `Z_{−1}(BG) = 0`, hence `R_i(BG) = 0`. Locator:
vistoli1989 lines 901–906. No other `W` statement had the error; `W_2(𝔸³)` in 4.4 is correct.

## R06 (P1) — applied

§7.3: the two-term étale-local representative is now asserted for `τ^{≥−1}E`, built as
`[coker(L^{−2}→L^{−1}) → L^0]` (BF lines 679–688). §7.3 also proves that `h¹/h⁰(E^∨)` depends only
on `τ^{≥−1}E` (line 669). §7.4's "every local presentation" now reads "of `τ^{≥−1}E`". In the
`O[2]` Check, `O[2]` has no two-term model while its truncation is the zero complex. The Examples
line was adjusted to match.

## R07 (P1) — applied

§7.4: Lemma 2.2 is now stated only for complexes with cohomology in degrees `[0,1]`, with
`O`-linear morphisms and 2-morphisms. The zero morphism's automorphisms are
`Hom(E, F[−1]) = Hom(h¹E, h⁰F)`. For arbitrary complexes there is only the construction through
`τ_{[0,1]}`. New Check: `k[2]` (`End = k`, induced map unique), plus a two-term positive case. §9.3's
use was re-pointed to two-term complexes.

## R08 (P1) — applied differently

§8.3: base change gives an isomorphism on `h⁰` and a surjection on `h^{−1}`. Flat base change is
now `τ^{≥−1}(u^*τ^{≥−1}L) ≅ τ^{≥−1}L'`; `c` is an isomorphism when `u` is flat or `L` perfect. Transitivity is now a six-term exact sequence, plus a triangle for smooth `u`. §10.7's datum
replaces the lower row by `c`, `c'`, `b` and a class `κ`.

Why "differently": the review offered to supply the full cotangent triangle from an owned
construction. No roadmap on main owns the full cotangent complex of morphisms of stacks or ringed
topoi, and this roadmap excludes it (Boundaries). So the datum was restated with the morphisms that
exist here. In case (b) (`Z, Z'` smooth over `𝔐`), `L_v = [v^*Ω_Z → Ω_{Z'}]` is defined globally
through the graph, with its cone triangle. `κ = u^*ε_h[1] ∘ g^*κ_v` uses the new
`ε_h : h^*Ω_{Z/𝔐} → τ^{≥−1}L_{X/𝔐}` of 8.3. In case (a) (`v` smooth), the datum is a morphism to
§8.3's smooth triangle. Other places with the same pattern: §8.5's derivation of
`0 → I/I² → Ω_Y → Ω_{Y'} → 0` now uses the exact sequence. §11.3 needs no change (`π` is flat).
§10.6 now rests on the stated `h⁰`-iso/`h^{−1}`-surjection. New Checks: the reviewer's
`k[x,y,z]/(xy,xz,yz)` for both base change and transitivity. The §10.7 Check on `(s,t) ↦ st` was
recomputed (`b = id`, `κ = κ_v`).

## R09 (P2) — applied

§11.2: "`Rπ_* ⊣ π^!` on `D(O_M)`" → sheafified duality
`Rπ_*RHom(L, π^!K) ≅ RHom(Rπ_*L, K)` for `L ∈ D_QCoh` and `K ∈ D^+_QCoh`, with
`π^! = Lπ^* ⊗ ω_π[1]`. It is built on étale charts from SchemeAndStackFoundations §2.19 and glued.
`Lπ^* ⊣ Rπ_*` on all modules is kept separate. §2.19 was added to the contracts.

## R10 (P1) — applied

§11.4: "`Ext^i_{𝒞_T}(F^*Ω_X, π^*J) ≅ Ext^{i−1}_T(g^*E, J)`" → same degree `i`, derived by the
projection formula: `H^i(𝒞_T, F^*T_X ⊗ π^*J) = H^i(T, Rπ_*F^*T_X ⊗ J)`. Citation is BF line 1609,
whose subscript misprint is noted. Recomputed: for `ℙ¹ → 𝔸¹`, `k ≅ k` (i=0), `0 ≅ 0` (i=1); for the
elliptic translate, `k ≅ k` in both degrees.

## R11 (P2) — applied

§10.8 deformation invariance now requires fibre virtual dimension zero, `m + r = 0` (equivalently
`[M,E]^vir ∈ A_1(M)_ℚ`), with `𝔐` of pure dimension `m`, and says why. New Check: `ℙ¹ × B` with
`Ω_{M/B}` is excluded, and `M = B`, `E = 0` gives count `1` and `[B]`. Item 7 of the
`Suggested.lean` docstring was changed to match.

## R12 (P1) — applied

§10.4 Check: "`c_s(O^s) ∩ [pt] ∈ A_{−s} = 0`" → zero for `s > 0`; for `s = 0`, `E = 0`, `vd = 0`,
the class is `[Spec k]`. Degrees are `1, 0, 0` for `s = 0, 1, 2`, consistent with the
no-obstruction item.

## R13 (P3) — applied

§11.5 Check: "a double line" → the square-zero thickening `O_{ℙ¹} ⊕ k_p` with `L` the pullback of
`O(1)`, where `H⁰(L^{−N}) = k` for all `N > 0`. The plane double line is kept as a contrast
(`H⁰(O_D(−N)) = 0`). The Check now says that reducedness is sufficient and that nonreducedness
alone does not cause failure.

## R14 (P1) — applied

The invented names were replaced as follows. `FiniteLocallyFreeSheafOfRank` became AVB's
`isFiniteLocallyFreeOfRank`, i.e. Tau Ceti `FiniteLocallyFreeSheaf.isConstantRank`.
`relativeSpecUniversalProperty` became `relativeSpecHomIso`/`CommMon.relativeSpecHomEquiv`.
`linearSpecBaseChangeIso` became `QuasicoherentLinearScheme.pullback` with
`QuasicoherentLinearScheme.linearSpecPullbackIso`. `extensionObstruction` was dropped; §0.25 is
cited in prose. The §4.1 *Needs* was changed too, and the mappings for `homologyOneIso` and
`totalSpaceBaseChangeIso` were kept.

## R15 (P3) — applied

README only. §3.5 has a third Check: unit `[Spec k] × [𝒲] = [𝒲]` (coefficient 1 for `BG`), and
the empty factor gives `0`. §10.8 has a third Check: the sign-sensitive `ℙ¹` theory
`[O(1) → Ω]` gives count `−1`, against `+1` for the wrong dual. A fourth §10.8 Check comes from R11.

## Checks run

- `lake env lean packages/VirtualFundamentalClasses/Suggested.lean` (from the content checkout):
  exit 0, no output (no errors, no warnings). No `TauCeti.*` import, so no targeted build was
  needed. The file still has zero declarations: no headline is statable at the pins (no algebraic
  or DM stack carrier). The mechanical `#check @name` signature comparison therefore has an empty
  domain; no binder could be lost, and none changed.
- Dependency check, exact output:

  ```text
  depcheck: 236 roadmaps, 2133 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. Every
  new pinned name was opened at the pin:
  - `TauCeti/AlgebraicGeometry/RelativeSpec/UniversalProperty.lean:455` (`relativeSpecHomIso`);
  - `VectorBundle/LinearScheme/BaseChange.lean:52, 99` (`QuasicoherentLinearScheme.pullback`,
    `QuasicoherentLinearScheme.linearSpecPullbackIso`, inside that namespace);
  - `VectorBundle/FixedRank.lean:52` (`FiniteLocallyFreeSheaf.isConstantRank`);
  - `VectorBundle/TotalSpace.lean:229`;
  - Mathlib `RingTheory/Kaehler/JacobiZariski.lean:537, 544, 552` (`Algebra.H1Cotangent.δ`,
    `exact_map_δ`, `exact_δ_mapBaseChange`);
  - Mathlib `RingTheory/Kaehler/Basic.lean:781` (`KaehlerDifferential.exact_mapBaseChange_map`).

  Supplier names were checked on main: SchemeAndStackFoundations §§1.19, 1.20 (`IsProperStack`,
  `.baseChange`) and 2.19; DerivedModuleAlgebra §§0.8, 0.10 and its name map (line 56); and
  AlgebraicVectorBundles' label map (README lines 147, 345–372).
- `sources.toml` parses. New locators were recorded: stacks-cotangent Lemma 6.2 (08QQ),
  vistoli1989 Appendix (7.14), and behrend-fantechi1997 Notations and Conventions. No new source
  was needed, and nothing was added to `needs-references.toml`.

## Adversarial pass on every added or changed statement

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Conv. 1 quasi-separated | `Bℤ`; `B(S₃)`; `BG` (doubled-origin `G`); `𝔸¹/ℤ` (char 0); doubled-origin line | `Bℤ`: diagonal fibre `ℤ`, not quasi-compact, inertia `ℤ×Bℤ` infinite → excluded; `B(S₃)`: `e = 6`, kept; `BG`: diagonal qc qs, not proper → kept; `𝔸¹/ℤ`: not qs → excluded; scheme of finite type: Noetherian → kept | consistent with 1.1, 1.4 |
| Conv. 1 char ≠ 2 clause | char 2, char 3 | char 2: tangent space of `μ₂` at 1 is `k[u]/(u−1)²`, dimension 1 → ramified; char 3: `μ₂ = {±1}` étale, `e(Bμ₂) = 2`, `A_0([𝔸¹/μ₂]) = ℤ/2` | kept |
| 1.1 base change | `id_{Spec k}` along `B(ℤ/2)`; `E → 𝓜` vector bundle; open `U ⊆ 𝓜` | `B(ℤ/2)`: source has Aut `ℤ/2`, not a scheme; `E_X`, `X_U` are schemes | proper cover only in the last two |
| 1.1 non-example | dominating component `X₁` of a putative cover of `BG` | `G_{X'₁}` = two copies glued along a nonempty open that is not closed in irreducible `X'₁` → not separated; torsor over a scheme entirely over 0: two copies of `ℤ/2`-torsor, separated | contradiction only via the dominating component |
| 2.2 `W(BG)` | `k = ℚ`, `i = −1, 0`; `k = 𝔽₂` | `W_{−1} = ℚ^×` ∋ 2 ≠ 1; `W_0 = 0`; `Z_{−1} = 0` so `∂ = 0`; `A_0 = ℤ` unchanged; `𝔽₂^×` trivial, which is why `ℚ` is used | corrected |
| 3.5 unit Check | `[Spec k]×[BG]`; `∅ × 𝒢` | coefficient 1 (an `e`-weighting would give `|G|`); `Z_*(∅) = 0` | added |
| 7.3 truncation | `O[2]`; `k` over `k[ε]/ε²`; `O[1]` | `O[2]`: `h^{−2} = O`, truncation `0`, `h¹/h⁰` trivial; `k`: resolution `…A→A→A`, `τ^{≥−1}k = [k --ε--> A]`, `h⁰ = k`, `h^{−1} = 0`; `O[1]`: its own model | corrected |
| 7.4 Lemma 2.2 domain | `k[2]`; `[0→k]` both sides; `[0→k] → [k→0]`; Frobenius on `𝔾_a` | `End(k[2]) = k` vs one induced map; `End = k` = `O`-linear endos of `𝔸¹`; `Aut(0) = Hom(k,k) = k = Hom(k[−1],k[−1])`; Frobenius is additive, not `O`-linear, so `O`-linearity is needed | restricted |
| 9.3 route | `J = k` on `Spec k` | `C(k) = 𝔸¹ = h¹/h⁰([0→k])`, a two-term complex | in domain |
| 8.3 base change (`h⁰` iso, `h^{−1}` onto) | `k[x,y]/(xy) → 𝔸¹`, fibre at 0 | `h^{−1}`: `k[y] → 0` onto; `h⁰`: `k[y]dy` iso | holds without flatness |
| 8.3 flat base change truncated | `A = k[x,y,z]/(xy,xz,yz)` over `k[t]`, `t = x+y+z`, `B = A/t` | `c = xyz ∉ I²` (degree 3 < 4); `dc = 0` (coefficients in `I`); `tc ∈ I²`; `h^{−2}(B⊗^L τL) ⊇ k·c ≠ 0`; `τL_{B/k}` has no `h^{−2}` | truncation required |
| 8.3 `c` iso when `u` flat or `L` perfect | `t ↦ t²` (u not flat, `L` perfect); `π` in 11.3 (flat) | both sides `[A --2t--> A]`, `h^{−1} = h⁰ = k` | holds |
| 8.3 transitivity sequence | origin in `𝔸¹`; `{0} ⊂ 𝔸¹` with both sides smooth; `A`, `B` above | `0→0→k→k→0→0→0`, `∂(t) = dt` iso; `0 → k → k → 0`; triangle would force `h^{−2}(u^*τL_A) = 0` but it contains `kc` | sequence true, triangle false |
| 8.3 smooth triangle | `𝔸¹ × M → M`; chart `U' → 𝔸^d_U → 𝔸^d_W` | split, quotient `O^d = Ω_{U'/U}` | holds |
| 8.3 `ε_h` | `Z = 𝔐`; `h = (f) : X → 𝔸¹_𝔐` | `Ω_{𝔐/𝔐} = 0` gives `ε = 0`; `dz ↦ df` lifting into `τL_X` | consistent |
| 8.5 deduced sequence | `{0} ⊂ 𝔸¹` over `k` | `I/I² = k → Ω|_0 = k → 0` | exact |
| 10.4 Check | `s = 0, 1, 2` | classes `[pt]`, `0`, `0`, degrees `1, 0, 0` | corrected |
| 10.7 datum | `v = id`; `Z×𝔸¹ → Z`; `(s,t) ↦ st`; conic `C ⊂ ℙ²` | `L_v = 0`, `F ≅ u^*E`; split triangle, `κ = 0`; `L_v = [O → O²]`, `dz ↦ t ds + s dt`, `b = id`, `κ = κ_v`, all three squares commute; conic: `u^*φ_E[1]` kills the `Ext¹(N^∨, V)` part, so the third square holds for the Check's `F` | consistent |
| 10.8 deformation | `M = B, E = 0`; `ℙ¹×B, Ω_{M/B}`; `ℙ¹` with `[O(1)→Ω]`; `BG` | `m+r = 0`, count 1, pushforward `[B]`; `m+r = 1`, class in `A_1` → excluded; count `−1` (wrong dual `+1`); `1/|G|` | corrected |
| 11.2 duality | `π : ℙ¹ → pt`, `K = k`, `L = O, O(−1)` | `Hom(k,k) = k = H¹(O(−2))`; `Hom(0,k) = 0 = H¹(O(−1))`; `(RΓO)^∨ = k = RΓω[1]` | holds on `D_QCoh` |
| 11.4 Ext degree | `ℙ¹ → 𝔸¹`, `J = k`; elliptic translate | `i=0`: `k ≅ k`, `i=1`: `0 ≅ 0` (old shift gave `k ≅ 0`); elliptic: `E = k ⊕ k[1]`, `Ext⁰ = k = H⁰(O)`, `Ext¹ = k = H¹(O)` | corrected |
| 11.5 Check | `O_{ℙ¹} ⊕ k_p`; plane double line | `H⁰(O(−N) ⊕ k_p) = k`; `H⁰(O_D(−N)) = 0` via `0→O_ℓ(−N−1)→O_D(−N)→O_ℓ(−N)→0` | corrected |
| Supplier names | pinned files above | all present with the stated namespaces | resolved |

## For the maintainer

- R02 needs a human decision. Two open roadmaps own the same core: VirtualFundamentalClass
  (another author, new folder, not in ORDER.txt) and this one (ORDER.txt line 401). Whichever
  becomes the owner, the other must be rewritten to cite it, possibly with a Part II for its
  remaining material.
- Two open pull requests use the folder name GromovWittenTheory: one on closed symplectic manifolds
  and one on algebraic Gromov–Witten theory. ORDER.txt lists GromovWittenTheory at line 309, before
  this roadmap. If that entry is the algebraic one, which builds the stable-map specialisation of
  11.2–11.5, its position is inconsistent with this roadmap owning 11.2–11.6. This roadmap names
  neither as a supplier, so the dependency check cannot see the conflict.
- Ownership against open work was checked with `roadmaps show`/`roadmaps grep` for
  VirtualFundamentalClass and both GromovWittenTheory heads, and by `roadmaps overlaps` (no
  conflicting head, no dropped or revision-only id). No other open roadmap claims the new targets
  added here. The full cotangent complex of stacks is owned by no roadmap on main, which is why
  R08 was settled without it.
- No section, layer, target or Lean name was renumbered, renamed or deleted. Other roadmaps' citations
  of this roadmap are unaffected. New consumed sections: SchemeAndStackFoundations §2.19 and
  DerivedModuleAlgebra §§0.8, 0.10, both on main.
- Three source issues stay as in the review: BF Lemma 2.2's overclaim, BF lines 1045–1046's
  truncated triangle, and BF line 1609's misprinted subscript. The README notes each where it is
  used.

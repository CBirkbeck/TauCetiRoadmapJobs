# FIX-DESIGN-VirtualFundamentalClassPartII~12

Findings of REV-DESIGN-VirtualFundamentalClassPartII~11: two, both P2.

## F01 (P2) — applied

Changed:
- 6.3: "Assume moreover that `H⁰(E)` is locally free" → "Assume moreover that `E` has a global resolution
  and that `H⁰(E)` is locally free". A clause adds that the first case needs no assumption, since
  `[0 → H⁰(E)]` is a resolution there.
- 8.2: "with a global resolution" → "Let `E` have a global resolution `F•` … with the global resolution
  `u^*F•`".

Verification:
- 6.2 defines the class only for a global resolution `F•`. Convention 7 and the Layer 6 header assume
  only perfectness and constant rank.
- behrend-fantechi1997 states the hypothesis itself:
  - Proposition 7.3 assumes global resolutions (line 1704);
  - Proposition 7.2 derives that `u^*E` has one *if* `E` does (line 1684).
- With `v = id`, the old 8.2 claimed a resolution for every perfect `E`.
- In 6.3's second case the hypothesis is not automatic. When `H⁰(E)` is locally free, so is
  `H^{−1}(E)`. `E` is then an extension classified by a class in `Ext²(H⁰(E), H^{−1}(E))`. A resolution
  `[F^{−1} → F^0]` would make that class a Yoneda product through the locally free image of `d`. On a
  stack without the resolution property nothing guarantees such a factorisation.

The repair also covers:
- the Layer 6 header, which gains one sentence: the class of 6.2 is formed when `E` has a global
  resolution, and every statement about it assumes one;
- the stability of resolutions under pullback, which is VirtualFundamentalClass §6.5 at its open head
  ("show it is stable under the pullbacks …"). 8.2's *Needs:* line now reads §§6.4–6.5, as do Layer 8's
  Dependencies and the plan's 8.2 `prerequisites`;
- `plan.json`:
  - 6.3 gains the hypothesis "E has a global resolution (automatic when H^{-1}(E) = 0: [0 -> H^0(E)])",
    and its statement opens with the same condition;
  - 8.2 gains the hypothesis "E has a global resolution F.", its statement names `u^*F.`, and its
    locator adds Proposition 7.2, lines 1682–1685.

Same pattern elsewhere: every other place the class is used already assumes a resolution or carries
one:
- 6.2 is stated "for a global resolution `F•`";
- 8.3 says "with global resolutions";
- 8.4 says "with a global resolution";
- 9.4 constructs one;
- the Layer 6 and Layer 8 Examples and every Check of 6.2, 6.3 and 8.2 use explicit two-term complexes of
  locally free sheaves.

## F02 (P2) — applied

Changed: 3.5's "`s^*` is the inverse of the flat pullback …, an isomorphism on algebraic spaces
(stacks-chow-spaces Lemma 27.3)" → a "Prove homotopy invariance on algebraic spaces" paragraph. It
states the result for a constant-rank bundle over a quasi-separated finite-type space, with locator and
route. It is backed by a first API bullet, two Checks, and a matching plan `api` entry and tests.

Verification:
- stacks-chow-spaces Lemma 27.3 (lines 1986–1990) is the integral isomorphism `p^* : CH_k(X) → CH_{k+r}(E)`
  for good `X/B`. Situation 2.1 (lines 57–61) with `B = Spec k` makes "good" mean quasi-separated and
  locally of finite type.
- Its flat pullback, Definition 10.1 (lines 484–494), is the cycle of the scheme-theoretic preimage.
  That is 3.1's `f^*[𝒱] := [𝒱 ×_𝒢 ℱ]`, so under 2.3 the lemma is a statement about this roadmap's groups.
- No supplier states it. SchemeAndStackFoundations §5.2 `chow_affine_bundle` (main) covers schemes.
  VirtualFundamentalClass §2.3 (open head) is rational and for separated stacks.
- 4.3 is rational and uses 3.5, so it cannot supply the statement.

The route is the source's proof (lines 1991–2007):
- surjectivity by Noetherian induction from a dense open subscheme (Remark 7.2, lines 314–315), with
  3.3's localisation sequence and `chow_affine_bundle` (Lemma 25.1);
- injectivity through `ℙ(N ⊕ O_U)` and the projective-bundle formula on spaces (Lemmas 27.1–27.2).

That formula needs the integral first Chern class on spaces: Definition 18.1, passing to rational
equivalence by Lemma 21.2. It also needs the key formula, Lemma 20.1, proved there by étale
localisation to schemes. Neither input is owned by any roadmap, so the README names both as steps of
this statement. They reduce to SchemeAndStackFoundations §§5.3 and 5.4 respectively.

Other edits that follow from this:
- 3.5's *Needs:* line, the plan's 3.5 `prerequisites` and Layer 3's Dependencies now cite
  SchemeAndStackFoundations §§5.2–5.5. All are already in the supplier contract, which lists §§5.1–5.6.
- 3.5 now says why `U = ℱ ×_𝒢 T` satisfies the hypothesis: `f` is of finite type, and its diagonal is
  quasi-compact because `Δ_ℱ` is quasi-compact and `Δ_𝒢` quasi-separated (Convention 1).
- Convention 4's list of integral statements and the Layer 3 scope bullet now include homotopy invariance
  on algebraic spaces. Without that, Convention 4's "exactly when" would be false.
- The `sources.toml` locator and `cited_for` of stacks-chow-spaces gain the new lemmas.

Same pattern elsewhere: none. Every other source lemma of 2.1, 2.2, 2.3, 3.3, 5.1, 5.2 and 5.4 sits
under "Prove". That covers stacks-chow-spaces Lemmas 4.1, 10.3, 13.2 and 15.2, Definitions 3.1, 15.1
and 32.1, and vistoli1989 Proposition 5.6 and (6.1). A search for "inverse of", "an isomorphism on" and
"is an isomorphism" found no other fact used without being proved.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.5 homotopy invariance | `c = 0`; `U = ∅` | `N = U`, `p = id`, iso; `0 → 0` | holds | none |
| 3.5 homotopy invariance | `U = Spec k`, `N = 𝔸¹` | `A_0(pt) = ℤ → A_1(𝔸¹) = ℤ·[𝔸¹]`, `[pt] ↦ [𝔸¹]`; `A_{−1}(pt) = 0 = A_0(𝔸¹)` (closed point `a` is `div(x − a)`); `[1] ∈ Z_0(𝔸¹)` not in `p^*Z_{−1}(pt) = 0` | iso on classes, not on cycles | Check added |
| 3.5 homotopy invariance | the non-scheme space `X` of 4.2 over `ℝ`, `N = X × 𝔸¹` | `div(t) = [0_X]` (order of `z` at `0` on the chart `𝔸¹_ℂ` is `1`); a closed point of `𝔾_{m,ℝ}` is `div(m_P)`, `m_P(0) ≠ 0`, so `A_0(X) = 0`. Directly: `[0_X × 𝔸¹] = div(t)`; any other integral curve is `div(g)`, `g ∈ ℝ[t, s]` irreducible with `t ∤ g` (order `0` along `0_X × 𝔸¹`), so `A_1(N) = 0`; `A_1(X) = ℤ`, `A_2(N) = ℤ` | holds, both degrees | Check added |
| 3.5 homotopy invariance | non-reduced `U = Spec k[ε]/(ε²)`, `N = U × 𝔸¹` | `A_0(U) = ℤ·[pt]`, `A_1(N) = ℤ·[N_red]`, `p^*[pt] = [N_red]`; the cycle of the subspace `U` is `2·[pt] ↦ [N] = 2·[N_red]` (3.1 API) | holds | none |
| 3.5 homotopy invariance | elliptic curve `E`, `N = E × 𝔸¹` | `A_0(E) = ℤ ⊕ E(k)`, torsion kept in `A_1(E × 𝔸¹)` integrally; rationally the torsion would vanish | integral statement is the one needed by 3.5 | none |
| 3.5 hypotheses on `U` | `f = id_𝒢`; `f : Spec k → BG`; diagonal argument | `U = T`; `U` a `G`-torsor over `T`; `Δ_ℱ = (base change of Δ_𝒢) ∘ Δ_f`, `Δ_ℱ` quasi-compact, `Δ_𝒢` quasi-separated, so `Δ_f` quasi-compact | `U` qualifies | sentence added |
| 3.5 rank | `N` of ranks `c₁ ≠ c₂` on two components | no single shift `j ↦ j + c` | constant rank needed; `N_{ℱ/𝒢}` has rank `c` | stated |
| 3.5 plausible wrong `s^*` | restriction of cycles to the zero section; `E = O(−1)` on `ℙ¹` | restriction gives `[ℙ¹]`; `s^![ℙ¹] = c_1(O(−1)) ∩ [ℙ¹] = −[pt]` (existing first Check, 4.3) | excluded | none |
| 6.3 first case resolution | `H^{−1}(E) = 0`; `Spec k → B𝔾_m`, `E = Ω_{pt/B𝔾_m}` | `Hⁱ(E) = 0` for `i ≠ 0`, so `E → H⁰(E)[0]` is an isomorphism and `[0 → H⁰(E)]` resolves it; `[0 → k]`, class `[pt]`, dimension `−1 + 1 = 0` | automatic, as the clause says | clause added |
| 6.3 second case resolution | `E` with split class (all Checks: differential `0`) against a class `e ≠ 0` in `Ext²(H⁰, H^{−1})` | `e = 0`: `[H^{−1}(E) --0--> H⁰(E)]` resolves `E`; `e ≠ 0`: a resolution makes `e` a Yoneda product `Ext¹(I, H^{−1}) × Ext¹(H⁰, I)` with `I = im d` locally free, not guaranteed without the resolution property | hypothesis needed | hypothesis added |
| 6.3 Checks after the change | node `× ℙ¹`; `k[x]/(x^p)`; `pt ⊔ 𝔸¹`; `Spec k[ε]/(ε²)` | resolutions `[O(1) → Ω]`, `[A → A dx]`, `[0 → 0] ⊔ [O → Ω]`, `[0 → 0]`; values `−[𝔜 × pt]`, `p·[pt]`, `[pt]`, `2·[pt]` unchanged | hold | none |
| 8.2 with the resolution | `v = id` | `u^*F• = F•`, `[X/𝔜, E]^vir = [X/𝔜, E]^vir`; no claim on `E` without a resolution | holds | hypothesis added |
| 8.2 `u^*F•` resolves `u^*E` | derived pullback | `Lu^*[F^{−1} → F^0] = [u^*F^{−1} → u^*F^0]` (locally free terms), and `Lu^*` of an isomorphism is one; `rk = rk F^0 − rk F^{−1} = r` | holds | none |
| 8.2 obstruction-theory property | cone `C` of `φ` | `C ∈ D^{≤−2}`, so `Lu^*C ∈ D^{≤−2}`: `H⁰` iso and `H^{−1}` onto for `Lu^*E → Lu^*L_{X/𝔜}`; composed with the base-change map of VirtualFundamentalClass §6.4 | holds | none |
| 8.2 Checks after the change | `{0} → 𝔸¹` with `[0 → Ω_{X/𝔜}]`; node with `[O(1) → Ω]`; `𝔸¹ × Spec k[ε]/(ε²)` with `0` | `[Z] = [Z]`; `−2·[pt × pt]` both ways; `2·[pt] = 2·[pt]` | hold | none |
| 8.4 uses 8.2 | `η_b : 𝔐 × {b} → 𝔐 × B` | 8.4 assumes a global resolution, so 8.2's new hypothesis is met; the zero-loci Check uses `[V^∨|_X → Ω_{P/B}|_X]` | holds | none |
| Layer 6 header sentence | 6.1, 6.2, 6.3, Examples | 6.1 takes two resolutions, 6.2 one, 6.3 now one; the zero-locus example is a two-term complex | consistent | sentence added |

## Checks run

- **Dependency check** (after all edits):

      candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
      depcheck: 245 roadmaps, 2240 edges, 0 problem(s)

  There is no UPWARD and no CYCLE line. An earlier run in the same session, before the Convention 4
  and scope edits, counted 246 roadmaps and 2242 edges, also with 0 problems. The edits add no
  supplier, so the change in counts comes from the content index, not from this roadmap.
- **Citation resolver** (`roadmaps resolve`): no cross-roadmap citation and no Lean name is
  unresolved.
- **README against plan:** a script compared the local targets of all 33 *Needs:* lines with the plan's
  `target:` prerequisites, leaving out supplier and gap items. All 33 agree. For the three changed
  targets the non-local prerequisites match their *Needs:* lines:
  - 3.5: VirtualFundamentalClass §1.5, the gap, SchemeAndStackFoundations §§5.2–5.5;
  - 6.3: VirtualFundamentalClass §§3.3, 9.1;
  - 8.2: VirtualFundamentalClass §§6.4, 6.5, 9.1, 9.3.

  The gaps' `neededBy` lists are unchanged.
- **`plan.json`:** it parses and re-serialises in its original format (indent 1, UTF-8, no trailing
  newline).
- **`sources.toml`:** it parses (TOML). One entry changed (stacks-chow-spaces `locator` and
  `cited_for`). No key was added.
- **Style scan of the added lines:** no LaTeX delimiters, process words or machine paths.
- **Elaboration:** none. This is a design, there is no `Suggested.lean`, and no `#check` comparison
  applies.
- **Gate failures:** none were listed for this round.

## Notes for the maintainer

- **Ownership of integral homotopy invariance on algebraic spaces.** Searched by object in the open
  heads, on main and in the board's packages ("homotopy invariance", Chow groups or Chern classes with
  "algebraic space(s)"). No owner was found:
  - VirtualFundamentalClass §2.3 (open head) is rational and for separated stacks;
  - SchemeAndStackFoundations §5.2 (main) covers schemes only;
  - the stopped board package VirtualFundamentalClasses stated Gysin maps for scheme sources only (its
    4.3) and rational homotopy invariance on stacks (its 5.1).

  This roadmap is therefore the owner. It is the only roadmap whose 2.3 identifies `A_*` of algebraic
  spaces with stacks-chow-spaces' groups, and 3.5 consumes the statement. The integral first Chern class
  on algebraic spaces and the projective-bundle formula on them are stated as steps of the same
  statement, not as separate targets.
- No source was fetched. Every new locator is in the cached stacks-chow-spaces and behrend-fantechi1997
  texts, read at the lines cited. No `needs-references.toml` was written.
- No name another roadmap cites changed. No section, layer or target was renumbered. Every new
  cross-roadmap citation is a section already in the plan's `suppliers` list:
  - VirtualFundamentalClass §6.5;
  - SchemeAndStackFoundations §§5.3–5.4.
- Untrusted text: the review contained no instruction beyond its findings.

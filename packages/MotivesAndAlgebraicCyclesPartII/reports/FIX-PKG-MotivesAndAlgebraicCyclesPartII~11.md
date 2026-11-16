# Repair report: MotivesAndAlgebraicCyclesPartII, package round 11

Findings of `REV-PKG-MotivesAndAlgebraicCyclesPartII~10`: five (three P2, two P3). All five were verified against the sources and suppliers and applied. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## F01 (P2) — applied

Verified. DiamondEtaleCohomology §C4.5, at the head of its open pull request, defines partial properness as separatedness plus the `(R, R⁺)` extension property, equivalently `0`-truncated, quasiseparated and with unique lifts. Scholze line 2620 (Corollary 12.2, p. 63) uses "partially proper" for the wider class of stacks with `X(R, R⁺) = X(R, R°)`. `b^* B(ℤ/2)` lies in the essential image but is not `0`-truncated.

Change in §12.1: "consists of the partially proper v-stacks, characterized by independence of `R⁺`" → this layer's own definition (restriction `X(R, R⁺) → X(R, R°)` an equivalence for every perfectoid Huber pair over `N`, the class of Scholze Cor. 12.2), together with the exact relation: for `X` separated over `N` it is §C4.5 partial properness of `X → N`, and §C4.5 is narrower. The second API bullet is restated the same way. A new Check covers `B(ℤ/2)`. The canonical compactification clause now says "of `X → N` (§C4.13)".

I adjusted the reviewer's wording in one respect. They wrote "for a separated `X` this is partial properness of `X → ∗`". I wrote it relative to `N`, because the v-stacks of §12.1 live over `N`. Since `N(R, R⁺) = N(R, R°)`, a §C4.5 lifting square for `X → N` is the same as a point of `X(R, R°)`. This holds with no need to argue separately that `N → ∗` is partially proper.

Same pattern elsewhere: the Scope line on Layer 12 also said "partially proper v-stacks", next to the line giving "partially proper maps" to DiamondEtaleCohomology. It now reads "the v-stacks whose values do not depend on the ring of integral elements (called partially proper in §12.1; the partially proper v-stacks of DiamondEtaleCohomology are its separated members)". The layer heading and the layer introduction keep the term, which is now defined in §12.1.

## F02 (P2) — applied

Verified. Over `K` = the completed perfection of `𝔽_p(x)((t))`, let `K⁺ ⊊ O_K` lie over the `x`-adic valuation ring of `k = 𝔽_p(x)^perf`. Then `id_K ∈ Spa(K, O_K)(K, O_K)` has no extension to `(K, K⁺)`, so the open disc over `Spa(K, O_K)` (point `id`, `T = 0`) is not independent of `R⁺`. This agrees with DiamondEtaleCohomology §C4.5, Checks ("iff the residue field is algebraic over `𝔽_p`").

Change: the third Check of §12.1 is replaced by two Checks in my own words:
- The first applies the criterion to `X × N` for a v-stack `X` over the point. Over `C` = the completed algebraic closure of `𝔽_p((t))` (residue field `𝔽̄_p`), `Spa(C, O_C)` and its open disc are unchanged. The perfectoid closed disc gains exactly one point: `b^* a^*` gives `O_C + C⟨T^{1/p^∞}⟩°°`, and the only point added is the rank-two specialization of the Gauss point at `∞` of `ℙ¹_{𝔽̄_p}`.
- The second treats the refuting `K`, with `b^* a^* Spa(K, O_K) = Spa(K, 𝔽_p + K°°)`.

The reviewer's text wrote the closed disc as `Spa(C⟨T⟩, O_C⟨T⟩)`. I wrote the perfectoid disc `Spa(C⟨T^{1/p^∞}⟩, …)`, because the test category consists of perfectoid pairs. As v-sheaves the two are the same, and DiamondEtaleCohomology §C4.5 uses the same choice.

## F03 (P2) — applied

Verified: Scholze lines 1203–1205 (p. 28) have the same three clauses in the same order as the old sentence of §1.8.

Change: "No étale site of a Banach ring is used: invariance under change of geometric Banach point is what singles out the étale sheaves among the finitary arc-sheaves" → "The condition compares values of `M` on pairs of geometric Banach points and is stated inside the arc-topos; this roadmap constructs no étale topology on Banach rings, and none is needed (the same condition is taken as the definition in Scholze, Remark 1.4, pp. 3–4, and in the paragraph before Proposition 5.9, p. 28)." The clauses are now in a different order, no run of three or more words is shared with Scholze lines 126–133 or 1203–1205, and both locators are kept. No other sentence of the README paraphrases this passage: I searched for "étale site" and "single out".

## F04 (P3) — applied

Verified on DiamondsAndVStacks at main: `### D0.22 Ordinary sheaves on profinite sets` (its line 1730, with the statement that stalk isomorphisms detect isomorphisms) and `### D1.4 Strictly totally disconnected perfectoid spaces` (its line 2449, with the description of connected components as `Spa(C, C⁺)`).

Changes:
- The contract gains §D0.22, and the §D1.4 entry now says what is assumed of it.
- The Scope line now reads "sheaves on profinite sets, strictly totally disconnected perfectoid spaces, …, Layers D0, D1, D2, D4 and D6".
- The *Needs* of §12.3 gains "DiamondsAndVStacks §D1.4 (connected components of strictly totally disconnected perfectoid spaces)", and the Layer 12 *Dependencies* gain D1.4.

After the edit, every D-section in a *Needs* line is in the contract, and conversely.

## F05 (P3) — applied

Verified: `5.5.3` appeared only in the References line of `CD` and in the manifest locator. CD lines 2472–2475 concern effective h-motives with coefficients of positive characteristic, which no target uses.

Change: "Theorem 5.5.3 (p. 54), " was deleted from the CD reference in the README, and "Theorem 5.5.3 (p. 54); " from the `locator` of the `CD` entry in `sources.toml`. The other CD locators are each cited in §§10.1–10.5 or in correction E6: Definition 2.2.2, Proposition 2.2.3, Theorem 4.5.2, Corollary 4.5.3, Theorem 5.2.2, Corollaries 5.5.5 and 5.5.7, and Remark 5.5.8.

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §12.1 definition and essential image | `X = ∅`; `X = N = b^* ∗`; `X = b^* Y` | `∅` and `N` have values independent of `R⁺`; `(b^* Y)(R, R⁺) = Y(R)`. If `X(R, R⁺) ≃ X(R, R°)`, the presheaf `(R, R⁺) ↦ X(R, R°)` is `X`, so `b^* a^* X = X` | Holds both ways. |
| §12.1 relation to §C4.5 | `X → N` separated; `X = b^* B(ℤ/2)` | Equalizer of two points agreeing on `Spa(R, R°)` is a closed subset containing every rank-one point, hence all of `Spa(R, R⁺)`: injectivity. `Aut` of the trivial torsor `= ℤ/2(Marc(R)) ∋ 1 ≠ 0` for `R ≠ 0` (`M(R) ≠ ∅`) | Equivalence on separated members; `B(ℤ/2)` separates the two notions (new Check). |
| §12.1 compactification | `X → N` separated | §C4.13 value `X(R, R°) ×_{N(R, R°)} N(R, R⁺) = X(R, R°)`, equal to the presheaf whose sheafification is `b^* a^* X` | Stated as "of `X → N`". |
| Check: `Spa(C, O_C)`, residue field `𝔽̄_p` | `a = ζ + m`, `ζ` a root of unity or `0`, `m ∈ C_{<1}` | `φ(ζ)` integral over `𝔽_p`, so in `R⁺`; `φ(m) ∈ R°° ⊂ R⁺` | Unchanged by `b^* a^*`. |
| Check: open disc over `C` | points `(φ, T)` | `T^n ∈ ϖR⁺` for large `n` iff `T ∈ R°°`, a condition independent of `R⁺` | Unchanged. |
| Check: closed perfectoid disc over `C` | Gauss point; type II at radius `r < 1`; classical, type III and type IV points | Images of the ring of integral elements in the residue field: Gauss point, `𝔽̄_p[T^{1/p^∞}]` becomes `𝔽̄_p`; radius `r < 1`, `|T^{1/p^n} − a^{1/p^n}| = r^{1/p^n} < 1` so the image is `𝔽̄_p` before and after; classical, type III and type IV points have residue field `𝔽̄_p` | Exactly one new point (`∞` of `ℙ¹_{𝔽̄_p}` over the Gauss point). |
| Check: `O_C + R°°` integrally closed | `f` integral over it | `f ∈ R° = O_C⟨T^{1/p^∞}⟩`; `f̄` is integral over `𝔽̄_p` inside `𝔽̄_p[T^{1/p^∞}]`, so `f̄ ∈ 𝔽̄_p` | `= R⁺_min`. |
| Check: `K` = completed perfection of `𝔽_p(x)((t))` | `id_K`; `(K, K⁺)` | `O_K ⊄ K⁺`, so no extension. `K⁺_min = 𝔽_p + K°°`: an element of `k` algebraic over `𝔽_p` has a `p^n`-th power in `𝔽_p(x)`, which lies in `𝔽_p` | Not independent of `R⁺`; open disc fails at `(id, T = 0)`. |
| Check: open disc over `Spa(K, O_K)`, relative | lifting square for the disc over `Spa(K, O_K)` | The square gives `φ` with `φ(O_K) ⊂ R⁺`; `T ∈ R°°` needs nothing more | Partially proper relative to the base, not absolutely. |
| §1.8 rewritten sentence | Scholze lines 126–133, 1203–1205 | Longest shared run: 2 words ("the condition"); clause order changed | Own wording. |
| F04 contract | `grep` of D-sections in *Needs* against the contract | D0.22, D0.23, D1.4, D2.7, D4.7, D4.9, D6.1, D6.3 on both sides | Agree. |
| F05 | `grep 5.5.3` | 0 hits after the edit | Agree. |

The Layer 12 Examples paragraph and the §12.3 and §12.4 Checks do not mention partial properness. I re-read them against the new definition and they are unchanged.

## Checks

- `lake env lean packages/MotivesAndAlgebraicCyclesPartII/Suggested.lean`, run from the content checkout: exit 0, no output. The file is unchanged: `import Mathlib`, the module docstring and an empty namespace.
- `#check @name` audit: there are zero declarations, so nothing was compared and nothing changed.
- Dependency check output:

```text
depcheck: 243 roadmaps, 2282 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. The lead `Perf.Spd` from the worker's list is DiamondsAndVStacks's planned name (its README line 260).
- Style searches (LaTeX delimiters, process vocabulary, machine paths) in the README: no hit.

## Gate failures

None were listed.

## Notes for the maintainer

- Ownership: the normed comparison `a^*`, `b^*` and the class of v-stacks over `N` independent of `R⁺` match nothing on main or at the open heads (`roadmaps grep` for `vStack/N` and the norm torsor). DiamondEtaleCohomology stays the owner of partial properness of maps (§C4.5) and of canonical compactification (§§C4.13–C4.14). DiamondsAndVStacks stays the owner of sheaves on profinite sets (§D0.22) and of strictly totally disconnected perfectoid spaces (§D1.4).
- No section, target or name of this roadmap was renamed or renumbered, so no other roadmap's citation changes.
- No new source was fetched and `needs-references.toml` was not written. The only manifest change is the shortened CD locator.

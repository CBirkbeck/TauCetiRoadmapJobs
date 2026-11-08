# FIX-PKG-FourierDeligneTransform~4

One review, one finding: REV-PKG-FourierDeligneTransform~3/F01 (P3). It is correct and applied. The pattern search turned up two more occurrences (§3.1, §4.2), which are repaired too. The adversarial pass on the new route text for §2.6 found a hypothesis missing from two statements (§2.4 `RΓ = 0` and §2.6 `j_! ≅ Rj_*`). Both now carry it, each with a negative-control Check. Only `packages/FourierDeligneTransform/README.md` changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## REV-PKG-FourierDeligneTransform~3/F01 (P3) — applied

**Verification.** Read at the text. LAU87 lines 310–339 give: the push-out along `χ^{−1}` as a lisse rank-one sheaf (310–312); the rigidification (1.1.3.1); the trivialization (1.1.3.2), compatible with the rigidification, and the dual (326); `χ ∘ N` (1.1.3.3, 328–329); and `ℒ_χ(f)` (1.1.3.6, 339). Lines 343–348 and 370–371 only name the Artin–Schreier and Kummer sheaves. KATZ01 lines 417–440 define `ℒ_ψ`, `ℒ_ψ(f)`, the trace and `ℒ_ψ(0)`. LAU87 lines 349–367 never mention tameness. So, as the review says, none of these passages states the tensor law, `[−1]^*`, `φ^*`, `F^*`, `ℒ_ψ(cf)`, `ℒ_ψ(f^p)`, `ℒ_ψ(f^p − f)`, the identification over `𝔽_q`, or tameness.

**Changes (old → new).**
- §2.2: one parenthetical covering everything → locators attached to what they state (LAU87 310–312, 313–339; KATZ01 for `ℒ_ψ`), plus a route for each other law. Tensor, `ℒ_1`, `φ^*`, `[−1]^*`, `F^*` (via `φ = F`, which is the identity on `A`) and `f + g`, as the review suggested. Also associativity and commutativity, which the review missed: on the connected `G³`/`G²`, two isomorphisms compatible with the rigidification differ by a constant unit equal to `1`.
- §2.5: same treatment. Additivity comes from §2.2. `[c]` uses the `φ^*` law. `f^p − f` uses the `φ^*` law for `φ = L`, which vanishes on `A`. `f^p` then follows by additivity. The identification over `𝔽_q` is LAU87 (1.1.3.3), lines 328–329, for `𝔾_a`. That source is more exact than the §2.1-only route the review suggested. Added §2.1 to Needs.
- §2.6: scoped the locators (LAU87 349–367; (1.4.3.1) and SGA45-ST for `ℚ̄_ℓ`). Added routes for the tensor law, for compatibility in `N` (`[N'] = [N] ∘ [N'/N]` plus the push-out law), and for tameness. The review's suggested tameness reason ("[N] finite étale … N prime to the characteristic") only shows the wild inertia acts trivially. It does not identify the tame action, so I wrote the route from the Kummer ratio instead: inertia acts through the tame character mod `N` at `0` and its inverse at `∞`. Also added routes for the finite-`Λ` forms (§2.4 route; stalk `RΓ(I_0/P_0, M)` as a two-term complex), with a proof that the unit condition does not depend on the choice of generator. "Tame character" in the statement is now "tame character modulo `N`". Needs gains EtaleCohomologyFoundations §§F.0.2, F.1, F.2.4, F.2.6–F.2.7, F.3.

## Pattern repair (same defect elsewhere)

- §3.1: "(LAU87 lines 372–377; KL85 lines 365–371.)" was attached to bilinearity, the transpose law, base change and nondegeneracy. Those passages only define the pairing (KL85 line 371: `Σ x_i x_i^∨`). Now the locator covers only the pairing, and each law is read off on points `(e, e') ↦ e'(e)`. The kernel form of bilinearity comes from §2.5 additivity.
- §4.2: LAU87 (1.3.2.3)–(1.3.2.4), lines 566–577, are stated for `ℚ̄_ℓ` only, and say nothing about `O_E` or duality. Added a route: the equivalence follows from §4.1 exactness and §3.4 inversion, as LAU87 line 570 derives it. Duality comes from §3.5, carried to other coefficients by §3.7. Simple objects go to simple objects under any equivalence. §§3.5 and 3.7 are added to Needs. This pass also showed that §3.5 only gives duality on `Dᵇ_ctf`. For a finite `Λ` that is not self-injective, such as `𝔽_7[x,y]/(x,y)²`, the perverse skyscraper `𝔽_7` at `0` is not of finite Tor amplitude, and `RHom_Λ(𝔽_7, Λ)` is unbounded. So "compatible with duality on hearts" → "compatible with the duality of §3.5 on perverse objects of finite Tor amplitude (all perverse objects for field, `E`, `ℚ̄_ℓ`, `O_E` coefficients)".
- Re-read for the same pattern, nothing to change: Layer 0 (§0.2 says its identities are "function forms", not that the source states them), Layer 1 (each locator is scoped and the general forms are declared this roadmap's own), §§2.1, 2.3, 2.7, 2.8 (routes given), §3.8 ((1.2.1.2) attached to the trace formula alone; the Frobenius exchange has its own route), §5.1 (locators attached claim by claim). The review had already re-read §§3.2–3.7 and 5.2–5.6.

## Hypotheses added by the adversarial pass (consequence of the new §2.6 route)

Writing out the §2.6 stalk computation showed it needs the coefficients to have order invertible in `k`. The wild inertia `P_0` has higher cohomology on `p`-torsion. The same goes for §2.4's `RΓ` route: ordinary Künneth rests on smooth base change. Layer 2 coefficients are only "a finite ring", so both statements were false as written.

- §2.4: "`RΓ_c = 0` and `RΓ = 0`" → "`RΓ_c = 0`, and `RΓ = 0` when the characteristic of `Λ` is prime to `p`". The orthogonality route through the trace formula is now limited to that case, plus a one-line algebraic proof for every finite `Λ`. New Check: `G = 𝔾_m/𝔽_4`, `Λ = 𝔽_4`, `χ = id`. Then `χ(ω) − 1 = ω²` is a unit and `RΓ_c = 0`, but `H¹` contains infinite-dimensional pieces of `(𝔽̄_2[t^{±1}]/℘) ⊗ 𝔽_4` from the classes `c t`.
- §2.6: `j_!ℒ_χ ≅ Rj_*ℒ_χ` now requires the characteristic of `Λ` to be invertible in `k`. New Check: `k = 𝔽̄_2`, `N = 3`, `Λ = 𝔽_4`. If `j_! ≅ Rj_*` held at `0` for both `χ` and `χ^{−1}`, inversion would give it at `∞`, forcing `RΓ = RΓ_c = 0`, which contradicts the §2.4 Check.

Every consumer inside the roadmap uses these statements with characteristic prime to `p`: §2.7 (`ℓ ≠ p`), §§2.8, 3.4 (nondegenerate `ψ`, so `p ∈ Λ^×`), and Layer 5 (field coefficients, `ℓ ≠ p`). No other roadmap cites §2.4 or §2.6 (`roadmaps grep FourierDeligneTransform`). No section, target or name moved.

## Adversarial pass on new and changed text

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §2.2 assoc./comm. by rigidity | `𝔾_a/𝔽_3`, `ℤ/7`; `G = 0`; constant `ℤ/2` | `Aut` of rank-one lisse on `𝔸³` is `Γ(𝔸³,(ℤ/7)^×) = (ℤ/7)^×`, ratio `1` at origin; point: trivial; `(ℤ/2)³` has 8 components, so a ratio can be non-constant (excluded by connectedness) | holds; connectedness used |
| §2.2 tensor, `ℒ_1` | `𝔾_a/𝔽_3`, `ψ(1) = 2` in `ℤ/7`, `x = 1` | `ψ(1)ψ(1) = 4 = ψ²(1)`; `ℒ_1` trace `1` | holds |
| §2.2 `φ^*`, `[−1]^*` | `φ = [−1]`, `x = 1` | `ψ(−1) = ψ(2) = 4 = 2^{−1} mod 7 = ψ^{−1}(1)` | holds |
| §2.2 `F^*` | `𝔾_m/𝔽_5`, `x ∈ 𝔽_25 ∖ 𝔽_5` | `N(x⁵) = x⁵·x²⁵ = x⁵·x = N(x)` | holds |
| §2.5 `ℒ_ψ(cf)` | `p = 3`, `c = 2`, `x = 1`; `c = 0` | `ψ(2)` both sides; `ℒ_ψ(0) = Λ = ℒ_1` | holds |
| §2.5 `f^p − f`, `f^p` | `L` on `A = 𝔽_3`; `𝔽_9`, `x = i`, `x = 1` | `a³ − a = 0`; `Tr(i³) = Tr(−i) = 0 = Tr(i)`, `Tr(1) = 2` both | holds |
| §2.5 `𝔽_q` via (1.1.3.3) | `q = 9` | `(t+t³)³ − (t+t³) = t⁹ − t`; kernel map `t ↦ t + t³ = Tr`; `N_{𝔾_a} = x + F(x) = Tr` | holds |
| §2.6 `N ∣ N'` | `k = 𝔽_5`, `N = 2`, `N' = 4` | `t ↦ t²` maps the order-4 cover to the order-2 one; `χ∘sq(2) = χ(4) = χ(−1) = −1`, the quadratic character (§2.2 Check) | holds |
| §2.6 tameness, sign at `∞` | `k = ℂ`, `N = 3` | at `0`: `y³ = x`, `σ(y)/y = ζ`; at `∞`, `u = 1/x`: `(1/y)³ = u`, ratio `ζ^{−1}` | holds; inverse at `∞` |
| §2.6 `j_! ≅ Rj_*` route | `𝔽̄_5`, `N = 4`, `ℤ/3`, quadratic; trivial `χ` | `χ(ζ) − 1 = −2 = 1`: complex `Λ →1 Λ` acyclic; `χ = 1`: `H⁰ = Λ`, `H¹ = Λ` (Check) | holds |
| §2.6 generator independence | `ℤ/7`, `N = 3`, `χ(ζ) = 2`; `ℤ/7×ℤ/7`, `(2,4)` and `(2,1)` | `2−1 = 1`, `4−1 = 3` units; `(1,3)`, `(3,1)` units; `(1,0)`, `(3,0)` both non-units | holds |
| §2.4 `RΓ`, char `p` | `𝔾_m/𝔽_4`, `𝔽_4`, `χ = id` | `ω − 1 = ω²`; `c t = g² − g` forces `b_{2^k} = b_1^{2^k}` for all `k`, so `c = 0`; `𝔽̄_2 t ⊗ 𝔽_4 ≅ 𝔽̄_2 ⊕ 𝔽̄_2`, eigenvalues `ζ`, `ζ²`; `H¹_c(𝔾_m,𝔽_2) = 𝔽_2` with trivial `μ_3` action, so `RΓ_c` has zero `χ`-part | `RΓ ≠ 0`; hypothesis added |
| §2.4 orthogonality, algebraic | `𝔾_m/𝔽_5`, quadratic; `𝔽_4^×`, `χ = id` | `1−1−1+1 = 0`; `1 + ω + ω² = 0` | holds |
| §2.6 `j_!`, char `p` | `𝔽̄_2`, `N = 3`, `𝔽_4` | at both `0`, `∞` would give `RΓ = RΓ_c = 0`, contradicting the infinite `H¹` above | fails without hypothesis; added |
| §3.1 laws on points | `r = 1`; `r = 0`; `f(e) = (e, 2e)` | `x x' = 0 ∀x'` ⟹ `x = 0`; zero spaces; `f^∨(a,b) = a + 2b`, `a e + 2 b e = (a+2b) e` | holds |
| §4.2 route | `ℤ_ℓ`, `(ℤ/ℓ)_0[−1]` | `FT` gives `(ℤ/ℓ)_{𝔸¹}` (`p⁺` heart); `[−1]^*FT^{V'}(−)(1)` returns `(ℤ/ℓ)_0(−1)[−1](1) = (ℤ/ℓ)_0[−1]` | holds |
| §4.2 duality scope | `𝔽_7[x,y]/(x,y)²`, `p = 3`, `ψ(1) = 2` | `ψ(1) − 1 = 1` unit; socle of dim 2, not Gorenstein, so `Ext^i(𝔽_7, Λ) ≠ 0` for infinitely many `i`; `D(𝔽_7 at 0) ∉ Dᵇ` | restricted to finite Tor amplitude |

## Checks

- Elaboration: `lake env lean packages/FourierDeligneTransform/Suggested.lean` from the content checkout: exit 0, no output, 19 s. No `TauCeti.*` import, so nothing to build. `Suggested.lean` declares nothing (one module docstring and an empty namespace), so there was nothing to `#check @name` in a scratch file and no signature to compare. I did not change the file: the README edits touch no headline the docstring names, and its statability claims stand.
- Direction check (`gate --depcheck … --movable`):

      depcheck: 235 roadmaps, 2412 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve packages/FourierDeligneTransform/README.md`: no cross-roadmap citation and no Lean name found nowhere. The only new suppliers cited are EtaleCohomologyFoundations §§F.0.2, F.1, F.2.4, F.2.6–F.2.7, F.3, F.3a, all already in the supplier contracts and the Layer 2 Dependencies. The routes use only the tensor, push-out and pullback laws already in gap:torsor-character-sheaf, so no new gap is needed and `design/plan.json` is unchanged.
- Greps on the README: no LaTeX delimiters, process words, local paths or pull-request numbers.

## Gate failures

None listed for this round.

## Notes for the maintainer

- Sources: no new source and no change to `sources.toml`. Every new locator points into a cached text (LAU87 lines 310–312, 328–329, 349–367, 570; KATZ01 lines 430–440; KL85 lines 365–371). LAU87 line 326 is badly garbled in the OCR. Following both reviews I read it as `ℒ_χ^∨ ≅ ℒ_{χ^{−1}}`, which also follows from the tensor law plus `ℒ_1 ≅ Λ`, so nothing depends on the reading. `needs-references.toml` is not needed.
- Ownership: nothing new is constructed, so ownership is unchanged. `scratch/overlaps.md` lists no open pull request that changes this roadmap and no dropped or revision-only id.
- No section, target or Lean name was renamed or renumbered. The statement changes are the added characteristic hypotheses (§2.4 `RΓ`, §2.6 `j_! ≅ Rj_*`) and the narrower duality clause in §4.2. No other roadmap cites any of them.
- No suspicious instructions appeared in the review text.

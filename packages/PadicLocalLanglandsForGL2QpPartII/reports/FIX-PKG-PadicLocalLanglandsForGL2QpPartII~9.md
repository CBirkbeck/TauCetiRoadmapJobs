# FIX-PKG-PadicLocalLanglandsForGL2QpPartII~9

I checked all six findings of REV-PKG-PadicLocalLanglandsForGL2QpPartII~8 against the cached sources, the README and the pinned toolchain. All six are correct.

- Changed: `packages/PadicLocalLanglandsForGL2QpPartII/README.md` and the module docstring of `packages/PadicLocalLanglandsForGL2QpPartII/Suggested.lean`.
- Unchanged: `sources.toml`, `metadata.toml` and the `gaps` list of `design/plan.json`. No new supplier gap was needed.
- I did not act on the review's "For the human reviewers" section (the scope question on gap:three-period-line-globalisation).

## F01 (P2) — applied

Galois-socle bullet: "for a supercuspidal type `M`" → "for a supercuspidal type `M` in `ΦNᵖ_n`", with `ΦNᵖ_n` spelled out. Steinberg branch: "`δ` of Steinberg type" → "`Sp ⊗ δ` in `ΦNᵖ_n`", with `δ∘det`. §6.6 bullet: "types `M`" → "types `M` in `ΦNᵖ_n`". README Summary line 5 now names `M ∈ ΦNᵖ_n` and `H¹_ét(M^p_(n,C), L(1))`.

## F02 (P2) — applied

§4.9 route: "the étale and pro-étale sequences share their first term, H⁰ being in both cases …" → H⁰ differs (∏_(π₀) L against L⊗∏_(π₀) O_L), but H¹(p^ℤ, H⁰) = 0 in both cases (free action on π₀, ultrametric bound). So H¹(M^p) = H¹(M)^(p^ℤ) for both cohomologies, and injectivity and the bounded-vector image descend. New §4.9 Check: the function p^(−|h|).

## F03 (P3) — applied

"The route follows Colmez: … (COLMEZ19POIDS lines 244–260)" → "The route (COLMEZ19POIDS lines 244–260): …". "The route for local analyticity follows DLB17 §3.3 (lines 665–749). M^p_n …" → "The route for local analyticity (DLB17 §3.3, lines 665–749): M^p_n …". "(a) follows DLB17 §5.3 (…)" → "(a) (DLB17 §5.3, …)". "(b) follows DLB17 §4.2 (…)" → "(b) (DLB17 §4.2, …)".

## F04 (P3) — applied

§6.4: "(CDN23, Théorème 5.24(i) and its proof, lines 2779–2836, printed pp. 72–74)" → "(CDN23, Théorème 5.24(i) and its proof, lines 2779–2836)". The manifest note "page numbers differ and are not cited" now holds.

## F05 (P3) — applied

§1.1: "(DLB17, Exemple 6.5 and Exemple 6.6 with Définition 6.7, lines 1335–1345)" → "(DLB17, Exemple 6.5, lines 1288–1299, and Exemple 6.6 with Définition 6.7, lines 1335–1345)". DLB17 line 1288 opens Exemple 6.5, line 1296 gives D⁺_dif,n = Fil⁰(L_n((t))⊗D_dR(V)) and line 1299 gives N⁺_dif,n = L_n[[t]]⊗D_dR(V). Line 1335 opens Exemple 6.6 and line 1338 Définition 6.7.

## F06 (P3) — applied

Layer 4 *Dependencies*: "ProetaleCohomologyOfPAdicCurvesAndTowers §§0.3, 0.4, 6.2, 6.5, 6.9 and 7.1–7.5" → "§§0.3, 0.4, 6.2, 6.5, 6.9, 7.1–7.3 and 7.5". No Layer 4 *Needs* line cites §7.4; it enters through §3.3 (Layer 3).

## Pattern repairs and other places

- **F01: the same omission in other docstring bullets.** Three more headlines of the docstring were stated without the level or sector condition that their README targets carry:
  - §3.3: "the strong dual of the `M`-multiplicity of the functions on `M^p_n` is `Π_{M,ℒ}^an / π`" holds only for supercuspidal `M ∈ ΦNᵖ_n`. For `M` of level above `n` the multiplicity is 0, while `Π^an/π ≠ 0`. The bullet now says "for a supercuspidal `M` in `ΦNᵖ_n` with `π = LL(M)`", as README §3.3 does.
  - §§7.2, 7.4 and 7.6: these used `Σ_r` and `ρ` without the standing hypothesis of Layer 7. That hypothesis is: `π` supercuspidal with trivial central character, `ρ = JL(π)` trivial on `1 + p^r O_D`, and `V` in the family of `π`. If `ρ` is not trivial on `1 + p^r O_D`, the `ρ`-parts are 0. Then the preimage of §7.2, the free rank-two module of §7.4 and the two-dimensional Hom of §7.6 all fail. The §7.2 bullet now states the hypothesis for all three bullets, and the §7.6 bullet keeps "for `r` large" from README §7.6.
  - I also added the boundary case to the §4.14 bullet: "`0` for `V ≅ V_{M,ℒ}` with `M` of level at most `n` and `p` acting nontrivially on `JL(M)`". This is README §4.14, Checks.
  - In the README, §§4.12–4.14, §4.14 Examples and §6.6 already carry `ΦNᵖ_n`.
- **F02: the same Hochschild–Serre term in §0.2.** The level-reading route said "its H¹(ℤ, H⁰) term being a space of locally constant functions". It now says "a quotient of a space of locally constant functions (in fact zero, Checks)". §0.2 covers only pro-étale H¹, so the étale/pro-étale H⁰ confusion does not occur there. §5.1 (line 874) speaks of H⁰ of the p-central quotient, which has finitely many components; it is correct and unchanged.
- **F03.** A search for "follows", "as in DLB17/CDN/Colmez", "à la" and "after" finds three hits, none presenting a route as a source's:
  - "as in DLB17 Proposition 3.1" (Scope): a citation of a fact.
  - "normalised à la Tate" (§0.4): the name of a normalisation.
  - "as in DLB17 Remarque 11.12" (E22): a citation of a fact.
- **F04.** No other page citation remains. A search for "p." or "pp." followed by a digit finds nothing.
- **F05.** I spot-checked other multi-item line ranges in the cached texts, and each line carries the item the README names:
  - DLB17 lines 1661, 1690, 1828, 1946, 1967, 1980, 2718, 2723, 2819 and 2823;
  - CDN20 lines 130, 859, 889, 913, 1090 and 1108.
- **F06.** I compared every layer's *Dependencies* with the union of its *Needs* lines, mechanically, roadmap by roadmap and section by section. After the fix no layer differs. The only differences the script reported were annotations, for example "§6.9 (Jacquet–Langlands)", and gaps listed with their supplier.

## Checks run

- `lake env lean packages/PadicLocalLanglandsForGL2QpPartII/Suggested.lean`, run from the content checkout after the last edit: exit 0, no output. The file still has the single `import Mathlib`, one module docstring and no declarations.
- `#check @name` comparison: with no declarations there was nothing to check, and no binder changed.
- Dependency check (`gate --depcheck … --movable`), full output: `depcheck: 239 roadmaps, 2267 edges, 0 problem(s)` (exit 0). There is no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name is found nowhere.
- No gate failures were listed for this round.
- No absolute path, `$`, `\(` or process wording was introduced.

## Sources

Nothing was fetched and the manifest is unchanged. I read the cached texts at these lines:

- DLB17 lines 1284–1300 and 1333–1346, plus the spot-checked lines above;
- CDN23 lines 2752–2756 and 2827–2831 (the running heads "72" and "74" of the HAL copy);
- COLMEZ19POIDS lines 244–260 (the twist by (a−cx)^k and the operator ∂ built from Dospinescu's formula);
- CDN20, the spot-checked lines above.

No text is missing, so no `needs-references.toml` was written.

## Adversarial pass (changed or added statements)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Docstring §4.14, supercuspidal branch | M with JL(M)(p) = 1 and of level ≤ n; twist χ(p) = 1+p; M of level m > n | Π(V)*⊗JL(M) ≠ 0; JL(M)(p) = χ(p²) = (1+p)² ≠ 1 gives 0; K_D(n) is normal in Ǧ and acts trivially on M^p_n, so Hom_Ǧ(JL(M), −) = 0 when JL(M) is nontrivial on K_D(n) | condition needed; repaired text gives 0 in both negative cases, as README §4.14 Checks |
| Docstring §4.14, Steinberg branch | n = 0; δ unramified with δ(p) = −1; δ with δ(p) = 1+p | Nrd(O_D^×) = ℤ_p^×, so δ∘Nrd trivial on K_D(0) iff δ unramified; Nrd(p) = p² gives δ(p)² = 1 for δ(p) = ±1, two characters; (1+p)² ≠ 1 excluded | holds; at n = 0 only these two contribute |
| Docstring §4.14 at n = 0, supercuspidal | JL(M) trivial on O_D^× and on p | factors through D^×/(p^ℤO_D^×) = ℤ/2, so dim JL(M) = 1: no supercuspidal of level 0 | consistent (vacuous branch) |
| Docstring §4.14, dim V = 3 | §4.13 answers | Galois constituents of dimensions 2, 1, 0 | 0 |
| Docstring §6.6 sum | README §6.6 display | ⊕ over M ∈ ΦNᵖ_n | agrees |
| Docstring §3.3 | M of level > n; twist χ(p) = 1+p | O(M^p_n)[M] = 0 while Π^an_(M,ℒ)/π ≠ 0 | condition needed; added |
| Docstring §§7.2, 7.4, 7.6 | ρ nontrivial on 1+p^rO_D | Ǧ acts on Σ_r through Ǧ/(p^ℤ(1+p^rO_D)), so the ρ-parts are 0: preimage 0 ≠ Π(Δ_(k+1,ℒ))′_b⊗det^k; 0 is not free of rank two; Hom = 0 against dim D_dR(V) = 2 | hypothesis needed; added |
| Summary line 5 | the same three instances as the first row | as in the first row | agrees with §4.14 |
| §4.9, freeness of p^ℤ on π₀(M_(n,C)) | level n | π₀ is a torsor under ℚ_p^×/Nrd(K_D(n)), with Nrd(K_D(n)) ⊂ ℤ_p^×; p acts by Nrd(p) = p², valuation +2, so p^m fixes a point only for m = 0 | free; height translated by 2 |
| §4.9, H¹(p^ℤ, H⁰) pro-étale | a ∈ ∏_h L with a_h = p^(−\|h\|) | f_(h+2) = f_h + a_h with f_0 = f_1 = 0 has a solution in ∏_h L | 0 |
| §4.9, H¹(p^ℤ, H⁰) étale at level k | ∏_(π₀) O_L/p^k | the same telescoping inside O_L/p^k | 0 at each k |
| §4.9, bounded case | a_h = 1 for all h | f_h ∈ ℤ, real growth h/2, but \|f_h\|_p ≤ 1 | bounded solution (ultrametric) |
| §4.9, rational étale step | lim_k and L⊗ | lim is a limit, so it commutes with invariants; L⊗_(O_L) is a filtered colimit, exact, so it commutes with ker(T−1) | H¹_ét(M^p) = H¹_ét(M)^(p^ℤ) |
| §4.9, injectivity and image | c ∈ H¹_proét(M^p)^b | restriction is G-equivariant and continuous, so it is G-bounded on M, hence étale on M (Proetale §7.3); invariant by injectivity and equivariance; lies in H¹_ét(M)^(p^ℤ) = H¹_ét(M^p); same image since H¹_proét(M^p) → H¹_proét(M) is injective | holds |
| §4.9 new Check | M_(0,C), f_h = p^(−\|h\|) | \|f_h\| = p^\|h\| → ∞; f ∈ ∏_h L, f ∉ L⊗∏_h O_L | H⁰ differ; first terms both 0 |
| §0.2 phrase | H¹(ℤ, ∏_h L) | coker(T−1) = 0 (§0.2 Check) | "quotient … (in fact zero)" correct |
| §1.1 locator | DLB17 1296, 1299; jumps −1, 0 | Fil⁰(L_n((t))⊗D_dR) = tL_n[[t]]⊗Fil⁻¹ + L_n[[t]]⊗Fil⁰ = tN⁺_dif,n + L_n[[t]]⊗ℒ | agrees with §1.1 |
| §2.4 locator | COLMEZ19POIDS 247–259 | twist by (a−cx)^k; ∂ as multiplication by x from the infinitesimal action and Dospinescu's formula | locator carries the route |
| Layer 4 *Dependencies* | union of *Needs* lines | Proetale §§0.3, 0.4, 6.2, 6.5, 6.9 (§4.2); 7.5 (§4.1); 7.1–7.3 (§4.9); no 7.4 | agrees |

## For the maintainer

- **No ids changed.** No section, layer, target, gap slug or Lean name changed, so no other roadmap's citation is affected.
- **Docstring only in `Suggested.lean`.** The docstring now carries the level and sector hypotheses of §§3.3, 4.14, 6.6, 7.2, 7.4 and 7.6. The file still declares nothing.
- **Ownership.** Nothing new is owned here, and no supplier changed.
- **No suspicious instructions** were found in any text read, the review included.

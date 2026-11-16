# FIX-RT-PELModuliPartII~2: repair of red-team round 2 (passes a and b)

Nine findings, all verified against the cached sources. Seven are applied as written or with a
correction; none is disputed; none is outside this package. Only `packages/PELModuliPartII/README.md`
and `packages/PELModuliPartII/sources.toml` changed. `Suggested.lean`, `metadata.toml` and the `gaps`
list of `design/plan.json` are unchanged: no new supplier gap is needed.

## RT-PELModuliPartII~2a/F01 (P2) — applied

RSZ21 lines 658–668 biject the pairs with the complex points of M₀^a. §6.6: "A given M₀^{a,ξ} may be empty"
→ every M₀^{a,ξ} is nonempty and surjects onto Spec O_{E_Φ}; only M₀^a can be empty. The new Check
computes that M₀^a is empty for ℚ(ζ₁₂)/ℚ(√3) (RSZ21 Remark 3.7(ii)). Conventions, §6.6 API, §6.7 and
§7.1 are repaired the same way.

## RT-PELModuliPartII~2a/F02 (P2) — applied differently

§0.1 adds the frame `A_{O′/O}(R)`, f-O-displays, γ, δ and Mih19 Proposition 13.2 (noetherian R; Mih19
lines 2180–2194), with Route, API bullet, hypothesis and Check (f=1, W(𝔽_{p²})). The difference from
the review: δ is base change along a strict frame morphism, so (11.2) needs no unit rescaling. The
pattern is repaired in §§0.4, 4.3 and 4.5.

## RT-PELModuliPartII~2a/F03 (P2) — applied differently

Requiring F⁺_v/ℚ_p unramified at every ramified v would narrow below the source: RSZ21 §5.2(1) and
Theorems 5.4(b), 5.7 need no such hypothesis at banal places (lines 1361–1364). §7.3 "∈Exo_Φ(n,0)" →
banal Eisenstein condition of §6.5 with π_v-modular kernel, which is LL22 Remark 2.67's Exo_Φ(n,0) when
F⁺_v/ℚ_p is unramified. Two computed Checks are added.

## RT-PELModuliPartII~2a/F04 (P3) — applied

§0.2 named functors defined in §§1.1–5.3, whose Needs list §0.2. "Consequently the functors N_n … are
represented" → a criterion for relative unitary framed functors, listing the kinds of condition. A
product sub-functor gives a closed formal subscheme (sharper than the review's "of this kind"). Ñ_n is
left to §2.4. Scope, intro, heading, Route and two Checks are aligned.

## RT-PELModuliPartII~2a/F05 (P3) — applied

Conventions: "the strict object then has dimension n" → dimension n is part of the definition (§§0.3,
3.1). The height does not force it: over 𝔽̄_q there is a strict formal O_K-module of relative height
2n and dimension 1. Conventions item 1 now says "a principal hermitian module of rank 3 (§0.3)".

## RT-PELModuliPartII~2a/F06 (P3) — applied differently

LL22 lines 439–441 cite RSZ17 Proposition 3.10, which I fetched together with PaRa09. RSZ21 Theorem 5.4(e)
needs F⁺_v/ℚ_p unramified (lines 1377–1378), so it cannot carry §3.4's arbitrary K. §3.4 now cites
RSZ17 Definition 3.9 and Proposition 3.10 (pp. 18–19, written for ℚ_p) and PaRa09 §5.c (pp. 38–39, any
base by §1.b.1). The RSZ21 locator goes to §7.7.

## RT-PELModuliPartII~2b/F01 (P3) — applied

Λ′_𝔭 almost self-dual gives Gram diag(1,p), so det V′ has odd valuation at the inert 𝔭, is not a
norm, and V′ is anisotropic. §8.4 Check: "isotropic exactly when −det V′ is a norm … not projective" →
for N=2 the model is projective for every F⁺; the first failure is N=3, F⁺=ℚ (Meyer, six variables).

## RT-PELModuliPartII~2b/F02 (P3) — applied

§9.5 Needs: "the completed integral models of Layers 7–8, using AdicSpacesPartIII Layer F0" → "§7.1;
§7.2; §7.3; §7.4; §8.6 (…); AdicSpacesPartIII Layer F0 (completion along the basic locus)". The
Layer 9 dependencies add §7.2. There is no cycle: no target of Layers 7–8 needs Layer 9.

## RT-PELModuliPartII~2b/F03 (P3) — applied

At its head, ShimuraCompactifications §7.5 has only `IntegralToroidalModel.proper`; §7.3 has
`openImmersion` and the stratification. The contract adds §7.3: with no nonzero cusp label the open
immersion is surjective, hence an isomorphism. "§7.5" → "§§7.3 and 7.5" in Scope, the §§7.7, 8.4, 8.7
routes and Needs, the Layer 7/8 supplier lists and the References notes.

## Checks

- **Elaboration.** `lake env lean packages/PELModuliPartII/Suggested.lean`, run from the content
  checkout: exit 0, no output. The file has no `TauCeti.*` import, so nothing needed building. It
  declares nothing and is unchanged, so the `#check @name` audit had nothing to elaborate and
  nothing changed.
- **Dependency check.** Output: `depcheck: 256 roadmaps, 2442 edges, 0 problem(s)`. There is no
  UPWARD, CYCLE or moved line. The one new supplier section cited, ShimuraCompactifications §7.3,
  belongs to a supplier that was already cited and comes earlier in the merge order.
- **Citations.** `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name is
  found nowhere.
- **Gate failures listed in the brief.** None in the first run. The worker's checks then reported two
  problems, repaired in place:
  - `tex=7`: seven TeX brace groups outside code spans. They are now in code spans, with the same
    mathematics: `W_O(R)→W_{O′}(R)` (§0.1 statement), `P_0⊕…⊕P_{f−1}` and `P_1,…,P_{f−1}` (§0.1
    route), `O′=W(𝔽_{p²})` (§0.1 Check), `⟨x,y⟩₀=Tr_{F/ℚ}(θxȳ)` (§6.6 Check) and `M₀=M₀^{O_{F⁺}}`
    (§7.1 statement). The gate's `scan_tex_residue` on the README now returns 0.
  - `prnum=6`: the new manifest key for Pappas–Rapoport's paper looked like a pull-request number. It
    is renamed `PaRa09` in the README (the §3.4 statement and route, the §7.7 route and References),
    in `sources.toml` and in this report. The key was added in this round, so no settled key changes.
    `scan_pr_numbers` now returns 0. The name is shorter than eight letters, so `roadmaps resolve`
    treats it as a source key, not as a roadmap.
  - After these repairs: elaboration exit 0, dependency check
    `depcheck: 256 roadmaps, 2442 edges, 0 problem(s)`, and `roadmaps resolve` finds nothing. Neither
    repair changes a statement.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §6.6 components nonempty | F imaginary quadratic; ℚ(ζ₁₂)/ℚ(√3), Φ with i↦i at both | one class (RSZ21 3.7(iv)), nonempty; θ=±iη/(2√3), Im φ₁(θ)=±η₁/(2√3), Im φ₂(θ)=∓η₂/(2√3), η₁η₂=1 ⇒ opposite signs ⇒ M₀^a=∅ | pass | Check added |
| §6.6 ℚ(ζ₁₂) data | discriminants; units with ε̄=−ε | d=12, 144=12², relative norm 1 ⇒ unramified; units ζ^k η(1−ζ)^j, ε/ε̄=ζ^{2k}(−ζ)^j=−1 forces j=0, ζ^k=±i | pass | none |
| §6.6 surjectivity | finite étale over connected Spec O_{E_Φ} | image open (flat, finite presentation) and closed (finite) ⇒ all | pass | none |
| §0.1 γ, δ | f=1; O=ℤ_p, O′=W(𝔽_{p²}), height 2 | identity frame; rank P=4, P₀,P₁ rank 2, Q⊇P₁, (P₀,Q₀) rank 2, P₀/Q₀ rank d | pass | Check added |
| §0.1 duality of δ | u=1 in Mih19 Lemma 11.2 | ε=1, (11.2) applies; a unit rescaling arises only for u≠1 (Lubin–Tate case) | review's clause unnecessary | applied differently |
| §0.2 criterion | no conditions; spin; Krämer framing up to O_K^× | the EL functor itself (RZ96 3.25); open; the lift is principal, so it is a kernel condition | pass | none |
| §0.2 product clause | Ñ_n⊂N¹_n×N_{n+1} | lift of fixed framing isogeny unique; isogeny and ker⊂[ϖ] closed (RZ96 2.9) | pass | none |
| Conventions height | strict O_K-module of height 2n, n=2 | dimension 1≠2 possible | overclaim removed | applied |
| §7.3 condition at v≠u | n=2, F⁺_v=ℚ_p, char p, N=(0 1;0 0) | N²=0=π_v², char T²=(T−φ(π_v))² mod 𝔪, N≠0 ⇒ Kottwitz holds, Eisenstein fails | pass | Check added |
| §7.3 f=1 case | F⁺_v=ℚ_p | Q(T)=T−φ(π_v) ⇒ O_F acts by φ; height 2n, dim n, ker A[i(π_v)] = §3.1 Exo(n,0) | pass | Check added |
| §7.3 ramified F⁺_v | F⁺_v=ℚ_p(√p) | RSZ21 case (1) line 1363: no ramification assumption; type (b) factor trivial (line 1433) | pass | hypothesis not added |
| §8.4 N=2 | Λ′_𝔭=diag(1,p) | val det=1, odd ⇒ −det not a norm ⇒ anisotropic ⇒ projective | old Check refuted | replaced |
| §8.4 N=3, F⁺=ℚ | signature (2,1) | trace form signature (4,2), 6≥5 variables ⇒ isotropic; dim 3 local space isotropic | pass | Check added |
| §8.7 N=2 (unchanged) | hyperbolic plane, det −1 | −det=1 a norm ⇒ isotropic, self-dual at p | consistent with new §8.4 Check | none |
| §3.4 local model | n=2; n≥4 even, K arbitrary | chart A¹; chart U^∧_{n−2,0}×A^{n−1}, U^∧_{n−2,0} a point (∧¹(Y+√π₀)=0) | pass | locator |
| SC §§7.3+7.5 | §8.7 N=1 | V rank one anisotropic, no cusp label ⇒ open immersion surjective ⇒ iso ⇒ proper | pass | citation |
| §9.5 Needs | Layers 7–8 Needs lines | none lists a Layer 9 target | no cycle | applied |

## Sources

- Added to `sources.toml` through the sources service: **RSZ17** (Rapoport–Smithling–Zhang, *On the
  arithmetic transfer conjecture for exotic smooth formal moduli spaces*, arXiv:1503.06520v3, certified;
  Definition 3.9, Proposition 3.10, pp. 18–19) and **PaRa09** (Pappas–Rapoport, *Local models in the ramified
  case. III*, arXiv:math/0702286v1, certified; §1.b.1, p. 10, §5.c, pp. 38–39). Neither work had a key
  before. PaRa09 is cited by its arXiv lettered numbering; RSZ17 cites the same content as §5.3 of the
  published version. Both have References entries.
- Locators extended for existing keys: LL22 (Remark 2.67), Mih19 ((11.2), §13, Definition 13.1,
  Proposition 13.2), RSZ21 (the complex-points bijection of §3.4, Theorem 5.4(b)).
- No text was missing; `needs-references.toml` was not written.

## Ownership

`roadmaps grep` for f-O-displays, O-displays, windows and Ahsendorf finds no other owner of the
unramified frame comparison. PELModuli §M2.15, at its open head, defines Zink displays with an O-module
structure, not displays over the Witt O-vectors. So §0.1 stays the owner, as it already is for the
Witt O-frame. The §0.2 criterion and the §7.3 condition are statements about this roadmap's own
objects. Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show`
at the indexed heads.

## For the maintainer

- The heading of §0.2 is now "Representability of framed functors". Its id is unchanged, and no
  roadmap cites this roadmap.
- §7.3 no longer requires F⁺_v/ℚ_p unramified at the non-distinguished ramified places, and never
  did. The condition there is the banal Eisenstein condition of §6.5, which is LL22's Exo_Φ(n,0) in the
  unramified case.
- ShimuraCompactifications is consumed at §7.3 in addition to §§7.5 and 7.18. Its §7.3 already states
  what is used, so it needs no change.

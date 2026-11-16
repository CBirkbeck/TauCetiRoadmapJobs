# FIX-RT-PELModuliPartII~1: repair of red-team round 1 (passes a and b)

Files changed: `packages/PELModuliPartII/README.md` and `packages/PELModuliPartII/design/plan.json` (the
`needs` and `detail` of the `zink-display-equivalence` gap). `Suggested.lean`, `metadata.toml` and
`sources.toml` are unchanged.

## RT-PELModuliPartII~1a/F01, RT-PELModuliPartII~1b/F01 (P2) — applied

§3.7 now defines the trace dual `Λ^∨={x : Tr_{L/K}h(x,Λ)⊆O_K}=u⁻¹Λ^♯`, vertex lattices (Λ^♯⊆Λ⊆u⁻¹Λ^♯), the type t(Λ)=dim_k Λ^∨/Λ (even, 2≤t≤n), and how this differs from the type of GeometryOfNumbersAndQuadraticArithmetic §2.7 (LL22 Def. 2.10, Rem. 2.13, Def. 2.27(1)). The n=2 Check now proves directly that Λ₀ is the unique vertex lattice.

Evidence: LL22 lines 518–524 (L^∨ defined by u⁻¹O_E), line 1106 ("even positive" dimension). GeometryOfNumbersAndQuadraticArithmetic §2.7 (2.7.2–2.7.3) uses H(x,L)⊆R, the hermitian dual. Recomputed at n=2 with V^exo=⟨1⟩⊥⟨−ε⟩, ε a nonsquare unit: Λ₀^♯=Λ₀, Λ₀^∨=u⁻¹Λ₀, so the type is 2 and dim V_Λ₀^ε=0. Uniqueness: type 2 forces Λ=Λ^♯ ⊆ {h(x,x)∈O_K}=Λ₀, so Λ=Λ₀. With the dual Λ^♯ alone the type would be 0. I also made the Route's "strata indexed dually" precise: Wu16's stratum of Λ is `V_{uΛ^∨}` (LL22 line 1126).

## RT-PELModuliPartII~1a/F02, RT-PELModuliPartII~1b/F02 (P2) — applied

Old: the contract asked PELModuli only for the equivalence BT over p-nilpotent rings. New: it asks for displays over every ring in which p is nilpotent, with their base change and duals, the functor BT there, and the equivalence. Changed in the README's gap line, in the Scope bullet, and in the `needs` and `detail` of the `plan.json` gap. Evidence: PELModuli §M2.15 at its open head defines `Display` "over a ring `R` of characteristic `p`". No roadmap on main or open owns displays over p-nilpotent rings (searched `roadmaps grep` for Zink/Lau/nilpotent displays). FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §0.13 covers complete local noetherian rings only. So PELModuli §M2.15 stays the supplier.

## RT-PELModuliPartII~1a/F03 (P2) — applied

Old: this roadmap owned strict O-modules and their height. New: the strict O_K-action, the relative height and the formula height_p=[K:ℚ_p]h are cited from HilbertModularVarietiesAndShimuraCurves §R18.5.4 in the Scope, the Conventions, a new supplier subsection, §0.1 (definition; API bullet 3, where "[O:ℤ_p]" also becomes "[K:ℚ_p]") and §0.3. *Needs:* lines of §§0.1, 0.3, 3.7 and the supplier lists of Layers 0 and 3 updated.

Evidence: §R18.5.4 says "Construct here the strict `O_K`-action … the `O_K`-relative group height h … Prove `height_p(X)=[K:ℚ_p]h`". It is at merge position 162, before this roadmap's 188.

## RT-PELModuliPartII~1a/F04 (P2) — applied

Old (§8.1): "p is odd, inert and unramified in F, and F⁺_𝔭=ℚ_p". New: "𝔭 is a prime of F⁺ that is inert in F, the rational prime p below it is odd and unramified in F, and F⁺_𝔭=ℚ_p", with τ∞ inducing 𝔭. Same pattern: lattices are self-dual at every 𝔮|p≠𝔭 (§§8.1–8.3), and §8.2's kernel lies in A[𝔭]. New Check: F⁺=ℚ(√2), F=F⁺(i), p=7.

Evidence: LTXZZ22 lines 1293–1296 (Definition 3.3.4), line 1669 (ι_p∘τ∞ induces 𝔭), line 1679 (self-dual Λ_𝔮 for every 𝔮|p).

## RT-PELModuliPartII~1a/F05 (P3) — applied

Deleted the References sentence claiming LTXZZ22 §5.2 states V° in rank N>1. Evidence: the cached LTXZZ22 text has 0 occurrences of "⩾" and 0 of "≥", against 91 of "⩽". Proposition 3.2.11 (line 1273: "holds for N⩽3, and for N>3 if F⁺≠ℚ") confirms that the source's "N> 1" (lines 124, 803, 1678, 2608) is a lost "⩾". §8.2's N≥1 is the source's own range.

## RT-PELModuliPartII~1a/F06 (P3) — applied differently

I added the §0.7 and §3.2 Checks as proposed, after verifying them: (T−ā)(T−a)² for i′=i∘conj; λ^∨=i(u)^∨σ=σi(ū)=−λ. The proposed §5.9 Check (n=1, 𝕏=Y) is outside Layer 5's hypotheses: it needs n≥2, and the source has signature (0,1) while the framing has (1,n−1). I added a Check within those hypotheses instead. Rescaling λ_Y by c∈O_K^× multiplies h by c⁻¹ and (e,e)_Y by c, so h·(e,e)_Y is invariant, whereas h·(e,e)_Y⁻¹ changes by c⁻²≠1 at c=2.

## RT-PELModuliPartII~1a/F07 (P3) — applied

Changes:
- §6.7: "RSZ21, §§3.4, 4.1, pp. 14–19" → "§3.4, Definition 3.9 and Remarks 3.11–3.12, pp. 13–14; §4.1, pp. 17–19". This is sharper than the reviewer's "pp. 11–15". RSZ21 lines 766, 804–820, 940, 1084.
- §0.4: Mih19 "pp. 11–18" → "pp. 12–18" (Prop. 3.4 at line 539, p. 12). I kept p. 11 as a separate locator for the opening of §3 (lines 500–509, the inverse-different lift that §0.4 uses).
- §9.4: RSZ20 Appendix B "pp. 59–60" → "pp. 58–60" (line 3179).

## RT-PELModuliPartII~1b/F03 (P3) — applied

§3.7 now defines the minimal cover (X̃,ρ₁,ρ₂) at geometric points: the terminal triple of isogenies with ρ∘ρ₁=ρ₂, whose Dieudonné module is the intersection (Wu16 lines 627–647, (3.18)–(3.20)). It also notes ht(ρ₁)=ht(ρ₂) because ρ has height zero. One addition beyond the review: κ₂ is now explicitly the parity of the **O_K-relative** height (§R18.5.4). For K/ℚ_p unramified of degree 2, absolute isogeny heights are twice relative ones, hence always even, so the absolute parity would not separate the components. This is added as a Check, together with "ρ an isomorphism ⇒ κ₂=0".

## RT-PELModuliPartII~1b/F04 (P3) — applied

Old (Downstream consumers): "…which that roadmap requests in its supplier contracts as native Shimura models, are §§8.1–8.4 and 8.7 here". New: the models are §§8.1–8.4 and 8.7 here (construction, local equations, strict semistability, generic-fibre comparison). SelmerIwasawaCohomologyPartII requests them from ShimuraVarieties in its contract native-shimura, ShimuraVarieties does not state them, and this roadmap owns them. Repointing that contract is a change in SelmerIwasawaCohomologyPartII (merge position 387) and is not made here.

## Checks run

- **Elaboration:** `lake env lean packages/PELModuliPartII/Suggested.lean`, run from the content checkout, exited 0 with no messages. The file is unchanged and declares nothing, so the `#check @name` audit had nothing to elaborate. No binder changed.
- **Dependency check:**

      depcheck: 251 roadmaps, 2392 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line. The new supplier HilbertModularVarietiesAndShimuraCurves is earlier in the merge order (162 against 188).
- **`roadmaps resolve`:** no cross-roadmap citation or Lean name found nowhere.
- **Gate failure tex=3:** three `_{…}` subscripts stood outside code spans in the README, two in the §3.7 lattice paragraph (the trace dual and the form `u²·Tr_{L/K}h` on Λ^∨/Λ) and one in the §3.7 route (Wu16's stratum `V_{uΛ^∨}`). Each formula is now a code span; the text is otherwise unchanged. A rescan of the README and this report finds no `_{`, `^{`, backslash command or dollar sign outside code spans. After the repair the dependency check printed the same line as above and `lake env lean` on Suggested.lean exited 0.

## Adversarial pass on new or changed statements

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §3.7 Λ^∨=u⁻¹Λ^♯ | L=K(u), u²=ϖ·unit, p odd | different (2u)=(u); h(ux,y)=u·h(x,y) | holds | added |
| §3.7 vertex lattice types at n=2 | V=⟨1⟩⊥⟨−ε⟩ | Λ₀: hermitian-dual type 0, trace-dual type 2, dim 0; uΛ₀: u⁻¹(uΛ₀)^♯=u⁻²Λ₀, length 4, not killed by u | unique vertex lattice Λ₀ | Check rewritten |
| §3.7 t(Λ)≤n | n=2, 4 | dim Λ^∨/uΛ^∨=n; t∈{2}, {2,4} | holds | added |
| §3.7 minimal cover | ρ iso; generic ρ | (X,id,ρ), κ₂=0; ht(ρ₂)−ht(ρ₁)=ht(ρ)=0 | holds | added |
| §3.7 κ₂ relative vs absolute | `K=ℚ_{p²}` (f=2); K=ℚ_p(√p) (f=1) | absolute = 2·relative, always even; absolute = relative | relative needed | clause and Check added |
| §8.1 special inert | F⁺=ℚ(√2), F=ℚ(ζ₈), p=7; p inert in F | 3²≡2, −1 not a square mod 7: 𝔭 special inert, 7 split in F⁺; p inert ⇒ [F⁺:ℚ]=1 | repaired clause admits the first and excludes nothing valid | Check added |
| §8.2 kernel at 𝔭 | F⁺_𝔭=ℚ_p, 𝔭 inert | `O_F/𝔭O_F=𝔽_{p²}`, rank p² = one `𝔽_{p²}`-line; 𝔭O_F conjugation-stable | consistent with §8.4 (order p²) | edited |
| §0.7 Check | n=3, (1,2) | (T−a)(T−ā)² → (T−ā)(T−a)²; λi′(a)=i′(ā)^∨λ | holds | added |
| §3.2 Check | ū=−u | λ^∨=i(u)^∨σ=σi(ū)=−λ; σ^∨=−σ gives +λ | holds | added |
| §5.9 Check | c=2 | h·(e,e)_Y unchanged; h·(e,e)_Y⁻¹ scaled by 1/4 | holds | added |
| §0.1 API rank P | K=ℚ_p(√p), relative height 1 | rank X[π]=p, p-height 2=[K:ℚ_p]·1 | holds; "[O:ℤ_p]" → "[K:ℚ_p]" | edited |
| gap needs | R=O_L̆/(p²) | not of characteristic p; displays and BT now in the contract | holds | edited |

The other Checks on the changed objects were recomputed and still hold: §3.7 Check 3 and Examples (n=4: t=4 gives ℙ¹, t=2 gives a point) and §8.4 (Λ′^♯/Λ′ of order p² at 𝔭).

## Ownership

The strict O_K-action and relative height now come from HilbertModularVarietiesAndShimuraCurves §R18.5.4. EndoscopicTransferAndUnitaryTraceComparison §10.2 uses strictness as a hypothesis only. This roadmap keeps the Witt O-frame over arbitrary O-algebras, O-displays, the relative isocrystal and relative duality: VectorBundlesAndIsocrystals Layer 0 states F and V on perfect algebras only, as the README records. It also owns the LTXZZ22 §§4.2/5.2 models, which ShimuraVarieties does not plan. Ownership against the open pull requests was checked with `roadmaps grep`/`roadmaps show` at the indexed heads. HilbertModularVarietiesAndShimuraCurves, PELModuli and GeometryOfNumbersAndQuadraticArithmetic were read through `roadmaps show`; SelmerIwasawaCohomologyPartII from its checkout.

## For the maintainer

- New supplier edge: PELModuliPartII → HilbertModularVarietiesAndShimuraCurves §R18.5.4. The supplier is earlier in the merge order, so no move is needed.
- The `zink-display-equivalence` contract to PELModuli is wider: it now covers the definition of displays over p-nilpotent rings as well as the equivalence.
- SelmerIwasawaCohomologyPartII's contract native-shimura names ShimuraVarieties for models that this roadmap owns (§§8.1–8.4, 8.7). Repointing it there is that roadmap's change.
- No name of this roadmap that other roadmaps cite changed: no roadmap cites PELModuliPartII.
- The LTXZZ22 extraction cannot distinguish fraktur 𝔭 from p. §8.2's "A[𝔭]" follows from the mathematics: the lattices are self-dual at every 𝔮|p, and Definition 5.2.6 changes the invariants only at ∞ and 𝔭.
- No suspicious instructions were found in the reviews or the fetched texts.

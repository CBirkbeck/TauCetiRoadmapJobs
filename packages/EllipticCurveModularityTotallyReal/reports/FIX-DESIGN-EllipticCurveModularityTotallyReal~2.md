# FIX-DESIGN-EllipticCurveModularityTotallyReal~2

The review has eleven findings. I checked each against the cached sources, the supplier roadmaps (at main or at their open heads, through `roadmaps show`) and the pinned libraries, and all eleven are correct. Ten are applied as asked. One (F05) is applied differently: the missing fact is stated and proved in this roadmap instead of being declared as a supplier gap.

Files edited: `packages/EllipticCurveModularityTotallyReal/design/README.md`, `packages/EllipticCurveModularityTotallyReal/design/plan.json` and `packages/EllipticCurveModularityTotallyReal/sources.toml`. This is the design stage, so there is no `Suggested.lean`: nothing was elaborated and no `#check` pass applies. The library declarations newly cited were read in the source files at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`).

## F01 (P1) — applied

Verified. `1/ℓ ∈ M₀` has valuation −1, so no ring of integers contains `j_ℓ(M₀)`. OpenAI26 line 547 puts `j_ℓ(M)` inside the finite extension L/ℚ_ℓ, not inside its integers.

Change in §1.5. Old: "a finite extension whose integers O contain `j_ℓ(M₀)`". New: "a finite extension `E_λ ⊇ j_ℓ(M₀)` with integers O; the values `j_ℓ(θ(ζ))` are units of O". Further changes:
- The lattice is now `⊗_{ℤ_ℓ[U′], j_ℓ∘θ} O`, with `T ⊗_O ℚ̄_ℓ ≅ W_{θ,ℓ}`: rationalize to `E_λ`, then extend to `ℚ̄_ℓ`.
- The congruence hypothesis is now that `j_ℓ∘θ` and `j_ℓ∘θ′` have equal reductions.
- New Check at ℓ = 3: `E_λ = ℚ₃(μ_n)`.
- The plan.json hypotheses of 1.5 are updated to match.

## F02 (P2) — applied

Verified. BD14 lines 2144–2146 assume that the image of `ρ̄(G_{F(ζ₅)})` in PGL₂ is not isomorphic to PSL₂(𝔽₅). FLHS15 lines 259–265 remove this hypothesis using `ρ̄(G_K) ⊆ GL₂(𝔽₅)` and the map `PGL₂(𝔽₅) → 𝔽₅^×/(𝔽₅^×)²`, so the argument needs an 𝔽₅-model. LeHung26 line 231 excludes ℓ = 5 altogether. I recomputed the witness C: `C² = I`, `det C = 4` (a square), `det B = 3` (a nonsquare).

Change: "or `det r̄ = ε̄₅⁻¹`" is replaced by two alternatives:
- (a) BD14's projective-image hypothesis;
- (b) `r̄ = r̄₀ ⊗ 𝔽̄₅` with `r̄₀ : G_F → GL₂(𝔽₅)` and `det r̄₀ = ε̄₅⁻¹`, attributed to FLHS15 §2.

This is applied in the gap contract, §2.2 (statement and Checks), the gap's detail and needs, and the plan tests of 2.2 and 2.5. Witness C is a new negative Check. Elsewhere, §2.5's proof and Check, the Layer 3 example and a worked example now cite alternative (b) for the dual of `E[5]` or `A_t[5]`. A new Check shows that a generic E fails (a).

## F03 (P2) — applied

Verified. EllipticCurveModularityImaginaryQuadratic §1.3 builds `cyclicCover m` only for m dividing n. f has divisor `(S) − (−S) − n(R) + n(−R)`. For n = 5 the valuations 1, −1, −5, 5 give four branch points and genus 5; for n = 15 they give two branch points and genus 3.

Change:
- §1.2(4) now reads "If `3 | n` … `C^δ_3/⟨w′⟩ ≅ D_t ⊗_k L`".
- §1.6 now reads "if `3 | n` … `W_η ≅ H¹(A_t)|G_L`; for every odd n ≥ 3, `W_1 ≅ H¹(B_t)|G_L ⊗ δ`".
- n = 5 and n = 15 are a new Check of §1.2.
- The plan's 1.2 statement and hypotheses and its 1.6 statement and hypotheses are updated.

## F04 (P2) — applied

Verified. SmallRamificationAndAbelianVarietyBaseCases §5.0d (at its open head) requires polynomials, semisimple members, Hodge multisets and local realization fields, all of which are first proved in §1.4.

Change:
- §1.3 now builds only the eigenspaces, their Galois actions and the idempotents. Its *Needs:* line drops §5.0d.
- §1.4 first defines S and proves the properties, including monic degree-two `P_{θ,v}` with constant term `q_v`. It then assembles the carrier and proves the AG2.P weak predicate.
- The supplier contract and the plan's 1.3 and 1.4 statements and prerequisites are updated to match.

## F05 (P1) — applied differently

Verified. ShimuraVarieties §5.3 (at its open head) defines CM actions over ℂ and contains no descent to KT.

I found no earlier owner:
- EllipticCurveModularityImaginaryQuadratic §8.6 asserts the fact without a supplier.
- AbelianSchemesAndArithmeticModuli A6.20 gives only the n-torsion field.
- AdelicImagesAndModularCurves §3.4 states it, but that roadmap comes later in the merge order (line 357).

Rather than a gap at a complex-analytic section, the fact, which is already part of §4.3's conclusion, is proved there, so the notion moves down from AdelicImagesAndModularCurves. The new text states, for any number field K: `[·]` is injective, `[ᵍα] = g([α])`, and the kernel of the Galois action is `G_{KT}`. The locator is OpenAI26 §9.4, line 1200. Its inputs are EllipticCurves Layers 0.5 and 1. Three Checks are added: the `[i]` witness, `T ⊆ K′`, and Frobenius in characteristic p. The ShimuraVarieties contract no longer claims the fact.

## F06 (P2) — applied

Verified at the pins:
- `WeierstrassCurve.torsionGaloisAction`, at `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:77`.
- `TauCeti.Isogeny.weilPairing`, at `.../Isogeny/MulByInt/WeilPairing/Basic.lean:225`.
- `WeierstrassCurve.weilPairing_torsionGaloisAction`, at `.../WeilPairing/Galois.lean:104`.
- `WeierstrassCurve.nonempty_basis_torsionBy`, at `.../Torsion/Structure.lean:149`.
- Mathlib `WeierstrassCurve.IsElliptic` and `WeierstrassCurve.j`, at `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:366` and `:388`.

Change. Old: "§1.1 is the one result the pins express". New: §§1.1 and 2.3 are statable at the pins. The carriers of §2.3 are named, and the paragraph says which carriers the other statements lack. These declarations are added to the Mathlib and Tau Ceti contracts, to §2.3's *Needs:* line and to the plan's 2.3 prerequisites.

## F07 (P2) — applied

Verified. BLGG13II lines 129–133 choose L/F so that `ρ̄|G_{L_w}` is unramified at w|l, and the extension itself may ramify. An unramified extension leaves inertia unchanged, so `diag(−1,1)` survives it.

Change. Old: "soluble totally real base change unramified above p". New:
- The extension is soluble, totally real, linearly disjoint from the field of `r̄`, and makes `r̄` unramified at every place above p; it is in general ramified there. The `diag(−1,1)` example is included.
- BLGG13II Theorem 3.1.1 is restricted to p = 3 under its own hypotheses.
- The arbitrary-p case and the return from F′ to F are named as the supplier's obligation.

The gap detail in plan.json changes with it.

## F08 (P3) — applied

The README now carries one line per gap:
- "What GL2ModularityLifting must provide (gap:totally-real-weight-two-lifting): …"
- "What GL2AutomorphicRepresentationsAndTransfer must provide (gap:totally-real-solvable-residual-cohomological-weight): …"

The slugs also appear in the *Needs:* lines of §2.2 and §2.4 and in the Layer 2 Dependencies. They match the plan's `gaps` slugs and its `gap:` prerequisites exactly.

## F09 (P3) — applied

Verified: BLGG12 line 2192 is the marker for p.45, and Theorem 6.1.8 begins at line 2198. Old: "Theorem 6.1.8, p.44". New: "p.45", in the README References and in the existing BLGG12 entry of `sources.toml`. No new key was added.

## F10 (P3) — applied

Verified for all three Checks:
- θ = 1 gives `(u_ζ−1) ↦ (u_{ζ⁻¹}−1)`, which has the same kernel.
- `G_{L(ζ₅)} ⊆ G_{K(ζ₅)}`, so the residual condition also holds over K.
- For d = 1 the trivial character is 1 at complex conjugation, while δ is −1 there.

Changes:
- The §1.5 negative Check is restricted to δ nontrivial and θ ≠ 1, with θ = 1 and δ trivial as positive controls.
- The §3.2 Check now says the seed is applied directly over L, avoiding base change, and that the condition also holds over K.
- The §1.1 divisor API is restricted to d ≥ 3, with a d = 1 Check.
- The plan tests are updated to match.

## F11 (P3) — applied

§1.5 now has an **API.** list in prose, with no Lean declarations:
- evaluation quotient;
- O-rank two for every ℓ;
- continuous O-linear `G_L`-action;
- rationalization to `E_λ` and then `ℚ̄_ℓ`;
- coefficient extension;
- restriction to `G_M`, which gives `characterLattice θ`;
- reduction depending only on `θ̄`.

plan.json 1.5 has the same seven `api` entries. The ℓ = 3 Check keeps rank two and `η̄ = 1` without putting `1/3` in O.

## Checks run

Dependency check, exact output:

```text
candidate: EllipticCurveModularityTotallyReal is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2150 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. The README names no supplier roadmap it did not name before (I compared the roadmap names in the old and new README). The new citations are EllipticCurves Layers 0.5 and 1 (on main) and further sections of suppliers already cited.

`roadmaps resolve` on the edited README found no cross-roadmap citation and no Lean name unresolved. The tool did not check names outside TauCetiRoadmap, so I checked the Mathlib and Tau Ceti names myself in the pinned sources (F06). plan.json parses, and `sources.toml` parses with nine entries.

No gate failures were listed for this round.

## Adversarial pass (changed and added statements)

| Statement | Instances tried | Computed values | Result / change |
|---|---|---|---|
| §1.5 coefficient ring | ℓ=3, n=15; ℓ=5, n=15 | `v₃(1/3)=−1`, so `1/3∉O`; η-values in μ₃ have valuation 0; `ℤ₃[μ₁₅]²⊗_η O = O²`, rank 2; η mod 3 is 1 | `E_λ ⊇ j_ℓ(M₀)`; holds |
| §1.5 reduction API | η vs 1 at ℓ=3; χ vs ψ at 3; ψ vs 1 at p | the residual labels `(η̄,1̄)=(1,1)`, `(χ̄,ψ̄)=(ψ̄,ψ̄)`, `(ψ̄,1̄)=(1,1)` mod p | the same three congruences as before |
| §1.5 untwisted non-example | k=ℚ, n=3, g=c, θ=η; θ=1; δ trivial (k=ℚ(√−3)) | c maps `(u_ζ−ω)` to `(u_{ζ⁻¹}−ω)=(u_{ζ′}−ω²)`, with `ω≠ω²`; θ=1 gives the same kernel | negative only for δ≠1, θ≠1 |
| §1.1 divisor API | k=ℚ: n=9, d=3; n=3, d=1 | `L₃=ℚ⊆L₉`; `g(ζ₃)=ζ₃^{δ(g)}`; `δ₁(c)=1≠−1=δ(c)` | restricted to d≥3 |
| §1.2(4) cubic clause | n=5, 15, 3 | valuations at ±S, ±R: (1,−1,−5,5): 4 branch points, `2g−2=8`, g=5; (1,−1,−15,15): `2g−2=4`, g=3; n=3: g=3 | `3∣n` added |
| §1.6 split hypotheses | n=5; n=3 | n=5: no order-3 characters of μ₅, so the first clause is vacuous; `W₁` holds for every odd n | clauses separated |
| §1.4 assembly | n=3, `W₁` | `P=X²−δ(F_v)a_v(B_t)X+q_v`; constant term `q_v≠0`; Hodge {0,1}; det `ε⁻¹δ²=ε⁻¹`; c ↦ −1 | assembly after the properties |
| §2.2 / gap at ℓ=5 | generic E/ℚ (image GL₂(𝔽₅)); F=ℚ(√5); C in 𝔽₂₅ | `G_{ℚ(ζ₅)}` has image SL₂(𝔽₅), order 120, projective image of order 60, so (a) fails and (b) holds; over ℚ(√5), `ε̄(G_F)={±1}`, which are squares, so the projective image lies in PSL₂ and `Gal(F(ζ₅)/F)` (order 2) would be a quotient of A₅, which is impossible; `C²=I`, `det C=4`, `det B=3` | (b) needs an 𝔽₅-model |
| §2.3 statability | K=ℚ(√−3) | `det ρ̄_{E′,3}` is trivial, so the image is ⊆ SL₂(𝔽₃), order 24 versus 48 | carriers present at the pins |
| §2.5 generic Check | image GL₂(𝔽₅) | `GL₂∩SL₂=SL₂(𝔽₅)`; `|PSL₂(𝔽₅)|=60` | (a) fails, (b) applies |
| §3.2 Check | K⊆L | `K(ζ₅)⊆L(ζ₅)`, so `G_{L(ζ₅)}⊆G_{K(ζ₅)}`; an invariant line for the larger group is invariant for the smaller | holds over K as well |
| §4.3 field of definition | y²=x³−x over ℚ and ℚ(√2); y²=x³+1; 𝔽_p | `[i]^*(dx/2y)=−dx/(2iy)=i·dx/2y`; `c[i]=(−x,−iy)=[i]³=[−i]`; KT=ℚ(ζ₈); `[ζ₃]^*ω=ζ₃ω`; `d(x^p)=0` | kernel `G_{KT}`; char 0 is needed |
| Gap 2 route | `diag(−1,1)` at an odd v∣p | `I_w=I_v` for unramified w, so the image is unchanged; for tame e=2 the tame quotient has index 2, so the order-2 image dies | text corrected |
| BLGG12 locator | lines 2144, 2192, 2198 | p.44 marker at line 2144; p.45 marker at line 2192; Theorem 6.1.8 at line 2198 | p.45 |

## Ownership, sources and notes for the maintainer

- **Ownership search for F05.** I searched by object (Galois action on geometric endomorphisms of CM elliptic curves, invariant-differential embedding) with `roadmaps grep` over main and all 438 open heads. Results:
  - AdelicImagesAndModularCurves §3.4 states the fact, but comes later in the merge order.
  - EllipticCurveModularityImaginaryQuadratic §8.6 asserts it without a supplier.
  - AbelianSchemesAndArithmeticModuli A6.20 proves only the n-torsion field.
  - ComplexMultiplicationAndExplicitReciprocity always assumes the endomorphisms are defined.
  - CMRankZeroConverse declares a narrower gap (`gap:cube-sum-full-cm`, j = 0 over fields containing ζ₃) at ComplexMultiplicationAndExplicitReciprocity.

  This roadmap now owns the general number-field lemma (§4.3). AdelicImagesAndModularCurves §3.4 and EllipticCurveModularityImaginaryQuadratic §8.6 could cite it. If ComplexMultiplicationAndExplicitReciprocity takes on CMRankZeroConverse's gap in general form, ownership should move there and §4.3 should cite it.
- **Supplier gaps.** The statement of the GL2ModularityLifting gap changed: the five-adic determinant alternative now needs an 𝔽₅-model. The route described for the GL2AutomorphicRepresentationsAndTransfer gap changed; its statement did not. Both slugs are unchanged.
- **Names.** No name that another roadmap cites was changed or deleted. The §1.5 lattice now has the prose name "descended character lattice". Section numbering is unchanged, and the overlap report lists no dropped ids.
- **Sources.** No new fetch was needed and `needs-references.toml` was not created. Manifest edits:
  - BLGG12 locator: p.44 → p.45.
  - OpenAI26: added "Section 9.4 p.27" and `cited_for` "4.3" (OpenAI26 line 1200).
- **Untrusted text.** The review and the fetched roadmaps contained no instruction to run commands or change the workflow.
- **Ownership against open pull requests** was checked with the `roadmaps` tools (index of 2026-11-10). The board package LawrenceVenkateshMethod, which the review could not read, was not consulted again; its objects are unrelated.

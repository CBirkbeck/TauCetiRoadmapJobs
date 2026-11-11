# Design report: DESIGN-EllipticCurveModularityTotallyReal

Deliverables: `packages/EllipticCurveModularityTotallyReal/design/README.md`,
`packages/EllipticCurveModularityTotallyReal/design/plan.json` (18 targets in 4 layers, 2 recorded
supplier gaps), and `packages/EllipticCurveModularityTotallyReal/sources.toml`, in which only the
`locator` and `cited_for` fields changed. The brief does not list `Suggested.lean` as a
deliverable, and the triaged target leaves it to a later job, so none was written. The README
therefore backticks no Lean name of this roadmap's own; plan.json carries proposed names.

## What the design covers

All three final targets of `packages/EllipticCurveModularityTotallyReal/target.md` are planned:

| Final target | Where |
|---|---|
| 1. Totally real elliptic modularity, all ℓ, all finite places with monodromy, `v|ℓ` by the potentially semistable comparison, Euler factors, exact level, rational eigenvalues, CM curves by cuspidal induction | §§4.1–4.4 |
| 2. Reflection descent with integral congruences for the whole family, `W_η ≡_p W_χ ≡_3 W_ψ ≡_p W_1`, endpoints `W_η ≅ H¹(A_t)|G_L`, `W_1 ≅ H¹(B_t)|G_L ⊗ δ`, total oddness, ℓ dividing n included | §§1.1–1.6 |
| 3. Totally real specialization and switch: p > 100 and t with all residual conditions over L, the seed at five, and automorphy of all four systems | §§3.1–3.3, with the seed in §§2.3–2.5 and lifting in §2.2 |

Layer 1 is stated over an arbitrary number field k; only total oddness needs k totally real.
LeHung26's Theorem 1.1 assumes its geometric Inputs 2.1–2.2 (LeHung26 line 86 and line 368). Here
they are the imported, proved layers of EllipticCurveModularityImaginaryQuadratic (Layers 1–4,
§§7.1 and 7.4), not hypotheses.

## Ownership and duplication searches

Searches used `roadmaps grep` over main and every open head (437 pull requests), `roadmaps show`
on each supplier at its head, and the board's package folders. The board package index lists three
packages under review (AnalyticNumberTheory, LawrenceVenkateshMethod,
LogicAndDefinabilityInNumberTheory); none touches these objects. Searches by object:

- Reflection twist, `C^δ`, real cyclotomic subfield over a base: no match on main or at any open
  head. Owned here (§§1.1–1.6).
- Breuil–Diamond Théorème 3.2.2, Barnet-Lamb–Gee–Geraghty ordinary lifts, the totally real
  weight-two lifting theorem without local matching: no roadmap owns it. GL2ModularityLifting
  (#1071 head) has only Kisin's §5.7, which needs strong residual modularity and residue field
  `𝔽_p`, and §5.10, which needs every place above p nonordinary; both need potentially
  Barsotti–Tate representations. OrdinaryAutomorphicFormsAndModularityLifting §5.8 is conditional
  on `CMComponentSupport`, and Skinner–Wiles Theorem B on Hypothesis H. PotentialAutomorphyInfrastructure
  is CM-field patching. Recorded as a required section of GL2ModularityLifting (gap
  `totally-real-weight-two-lifting`).
- Weight-one to cohomological weight for solvable residual representations over totally real
  fields: GL2AutomorphicRepresentationsAndTransfer R17.5.14 stops at parallel weight one and says
  weight-two lifts are separate inputs; R17.6.14 does the analogue only in characteristic two over
  ℚ. Recorded as a required section of that roadmap (gap
  `totally-real-solvable-residual-cohomological-weight`).
- FLHS Lemma 6.1 (3–5 switch over a number field) and Theorem 3 (seeds over totally real fields):
  no owner. EllipticCurveModularityImaginaryQuadratic §0.3 `switch_five` and `switch_three` are CM-field
  constructions with prescribed local types and decomposed genericity, and
  EllipticCurveModularityWild3Adic works over ℚ. The target brief assigns the seed assembly here, so
  §§2.3–2.5 are owned here.
- Soluble descent over totally real fields (LeHung26 Lemma 5.1): owned by
  PotentialAutomorphyInfrastructure §2.3 `soluble_base_change_and_descent`, part (2), which allows
  totally real fields. It is cited, not restated. GL2AutomorphicRepresentationsAndTransfer
  R17.6.18–R17.6.19 is the alternative interface.
- Modularity predicate: AutomorphicGaloisRepresentationsPartII AG2.0 `IsAttached` with the AG2.P
  Hilbert-member identification already owns it. The README uses it as a convention and defines
  no new predicate.
- Change of coefficient prime (§2.1) and the CM branch (§4.3) are kept variants of
  EllipticCurveModularityImaginaryQuadratic §8.1 and §8.6. They differ in field (totally real),
  carrier (Hilbert attachment, `W_θ` over L) and branch (induction only). The README's Scope says
  so in one clause each.
- The sibling design `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md`
  excludes totally real fields (its "Outside this roadmap") and names this roadmap as its
  companion. There is no shared object.
- GlobalGaloisDeformationsPartII §8.7 mentions an imported totally real modularity theorem in a
  residually reducible Skinner–Wiles context. It is unrelated and is not a consumer edge.

Ownership against open pull requests was checked with these tools at the heads; `roadmaps resolve`
finds no cited section or Lean name missing.

## Overlap with open pull requests

`roadmaps overlaps EllipticCurveModularityTotallyReal` reports no roadmap of this name yet.
`roadmaps overlaps EllipticCurveModularityImaginaryQuadratic`, for the main supplier, reports no
other pull request changing it, no dropped id it cites and no id defined only by a revision. All
suppliers that are open pull requests add new roadmap folders and appear earlier in the merge
order; they are cited at their heads by name and section. No citation depends on an open revision.

## Adversarial mathematics pass

Values marked "computed" were evaluated by a scratch script (point counts over finite fields,
matrix products, group orders in `GL₂(𝔽₃)`, totients, a numerical Satake comparison).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 L independent of ζ, `[M:L] ≤ 2` | k=ℚ, n=3, 9, 15, 303 | `ζ₃+ζ₃⁻¹=−1` ⇒ L=ℚ; `x³−3x+1` at `2cos(2π/9)` = 0 (computed); `φ(15)/2=4`, `φ(303)/2=100` (computed) | holds | none |
| §1.1 totally real clause, `L=M⁺` | k=ℚ(√−3), n=3; k=ℚ(i), n=3 | `M=L=k`, δ trivial; `L=ℚ(i)` but `M⁺=ℚ(√3)` (since `ζ₁₂+ζ₁₂⁻¹=√3`) | false without total reality | clause restricted to totally real k; ℚ(i) added as non-example Check |
| §1.1 `n ≥ 3` | n=1, 2 | `ζ+ζ⁻¹=±2`, `L=M=k` | `[M:L]=2` fails | hypothesis kept, Check added |
| §1.1 `L(μ_ℓ)=M` | k=ℚ, n=303, ℓ=3, 101 | `ζ_ℓ ∉ L` (L real), `[M:L]=2` | holds for odd ℓ | stated for odd primes ℓ dividing n |
| §1.2 cocycle and descent identity | δ trivial and nontrivial; matrices `R=[[0,−1],[1,−1]]`, `W=[[0,1],[1,0]]` | `R²=[[−1,1],[−1,0]]=WRW`, `R³=I`, `WR⁻¹W=R` (computed); cocycle needs `w²=1` | holds | none |
| §1.2 effectivity of descent | m=1 versus `m≥3` odd | genus m ≥ 3 ⇒ canonical bundle ample; genus 1 has trivial canonical bundle | curve-descent route fails at m=1 | m=1 defined as the quadratic twist `B^δ_t` |
| §1.2(4) quadratic twist sign | `y²=x³−x+1` over `𝔽₅`, twist by 2 | 8 and 4 points (computed): `a₅=−2`, `2`; `(2/5)=−1` | holds | convention witness added |
| §1.3 ranks | n=3, θ=1 | `dim H¹(C₃)=6=2+2+2`; `W_1` rank 2 | holds | none |
| §1.4 determinant pairing | θ of order 3, θ=1 | cup product on `W_θ×W_θ` zero when `θ²≠1`; `[,]_θ` alternating via `w′²=1`; `det W_1=ε⁻¹δ²=ε⁻¹` | holds | none |
| §1.4 oddness generality | k=ℚ(√−3) | no real places | vacuous | asserted only for totally real k |
| §1.4 weak predicate | good `v|ℓ` | crystallinity at good places needed by the predicate | missing clause | added "crystalline at `v|ℓ` outside S" and NeronModels §5.3 |
| §1.5 congruences | ℓ=p, ℓ=3, n=3p | mod p `ψ̄=1` ⇒ `χ̄=η̄`; mod 3 `η̄=1` ⇒ `χ̄=ψ̄`, and `W_η ≡_3 W_1` | holds; reversal `W_χ ≡_3 W_η` false | extra congruence `W_η≡_3W_1` recorded, matching LeHung26 lines 136–138 |
| §1.5 ℓ dividing n | ℓ=3, n=303 | `ℤ₃[μ₃₀₃]` not semisimple mod 3 | freeness still from regular module | Check added |
| §1.6 endpoints | n=3 | `dim H¹(C₃)^w = 0+2 = 2` ⇒ genus 1; `det(W_1⊗δ⊗χ_{h(t)}) = ε⁻¹` | holds | none |
| Conventions, normalization | 11a1 at 3 | `a₃=−1` (computed), `X²+X+3`; Satake at s=1.3: difference `1.1·10⁻¹⁶` (computed); reversed shift gives `(1+3^{−s−1}+3^{−2s−1})⁻¹` | holds | witness added |
| Conventions, δ | k=ℚ, n=3 | `δ(Frob₇)=1`, `δ(Frob₂)=−1` | holds | witness added |
| Conventions, conductor | additive places | "exact level = conductor" needs a definition | undefined term | `𝔫_E` defined by Artin conductors |
| §2.1 change of prime | nonsplit extension of `ε⁻¹` by 1; ψ versus ψ², ψ⁻¹ | equal polynomials, not isomorphic; ψ² Galois conjugate; `W_ψ≅W_{ψ⁻¹}` via `w′` | semisimplicity needed | hypothesis kept; label Check added |
| §2.2 summand lifting | ℓ=2, ℓ=5, ℓ=3 | residual det at c is 1 for ℓ=2; `|A₅|=60`, simple; `ε̄⁻¹ ≡ ε̄` mod squares | ℓ=2 excluded; ℓ=5 allowed only through cyclotomic determinant | ℓ=5 clause placed in the supplier's required statement (FLHS15 §2) |
| §2.2 generality | LeHung26 det `ε⁻¹`, ℓ≠2,5; FLHS elliptic, ℓ≠2 | — | README matches LeHung26 for det and extends to ℓ=5 by FLHS15 §2 | recorded in Checks |
| §2.3 switch curve | K=ℚ(√−3); all-frames cover | `|SL₂(𝔽₃)|=24`, `|GL₂(𝔽₃)|=48`, Borel 12 (computed), Cartan normalizers 8, 16; `φ(3)=2` components | "= GL₂(𝔽₃)" false over K∋ζ₃ | stated as "contains SL₂(𝔽₃)"; component of the frame cover used |
| §2.4 mod-3 seed | det at c; solvability | `−1≠1` in 𝔽₃; orders 48, 24, 8, 2, 1 | holds | none |
| §2.5 mod-5 seed | line stabilizers in `SL₂(𝔽₃)`; 11a1 | `|SL₂(𝔽₃)∩B|=6` (computed); nonsplit torus ∩ SL₂ order 4; 11a1 has 5-torsion | holds; 11a1 is a negative control | wording changed from a Borel-only count to the stabilizer argument |
| §3.1 parameter | pairs (3,5), (p,3) | `c(λ)=3` at a primitive cube root (computed), nonzero mod 5; `3⁴−1=80` (computed) < p | holds | none |
| §3.1 local opens | `Ω_v=U(K_v)` | U nonempty Zariski open, `K_v` infinite | nonempty | none |
| §3.3 lifts | rows p, 3, p | residual isomorphisms from §1.5, irreducibility from §3.1(1)–(3); prime 5 absent | holds | none |
| §4.1 descent | `L/K` abelian; h(t) square | soluble Galois, totally real; χ trivial | holds | none |
| §4.2 local factors | 11a1 at 11; `y²=x³−x+1` at 23; `y²=x³−x` at 2 | `#Ẽ(𝔽₁₁)=11` ⇒ `a₁₁=1` split (computed); `Δ=−368`, `c₄=48`, `j=−6912/23` (computed); 5 not a square mod 23 (computed); conductor 32, j=1728 | holds | added the additive potentially multiplicative case and factor 1 at every additive place |
| §4.2 archimedean | `D_{2,0}` | `Γ_ℂ(s+1/2)` shifted to `Γ_ℂ(s)` | holds | none |
| §4.3 CM | `y²=x³−x`, `y²=x³+1` | 4 points over 𝔽₃, 8 over 𝔽₅ (computed): `a₃=0`, `a₅=−2=ψ+ψ̄`, `ψ=−1±2i`, `|ψ|²=5`; 6 points over 𝔽₅ (computed), `a₅=0` | holds; isobaric sum impossible over totally real K | none |
| §4.4 endpoint | K=ℚ; `ℚ(ζ₁₅)⁺` | degree 4 (computed), contains √5 | no √5 exclusion arises | none |

Vacuity: every statement ties its data to the construction. §2.2 quantifies over abelian varieties
and idempotents, with the dimension, determinant and Hodge hypotheses on the actual summand. §2.1
assumes an actual realization at one prime. No hypothesis contains its conclusion. No unused
hypotheses were found.

## Notions moved down from later roadmaps

None. Every supplier precedes this roadmap in the merge order or is on main.

## Proposed extensions of earlier owners

These are repairs of earlier owners in their own directions, not plans in this roadmap:

1. **GL2ModularityLifting, Layer 5, a section after §5.10**: the Breuil–Diamond weight-two lifting
   theorem with the FLHS15 §2 cyclotomic-determinant clause at five (gap
   `totally-real-weight-two-lifting`; README "Required of GL2ModularityLifting"). GL2ModularityLifting
   is an open pull request; revising it keeps this roadmap right after
   EllipticCurveModularityImaginaryQuadratic. Putting the theorem in a new Part instead would move
   this roadmap after that Part. The name GL2ModularityLiftingPartII is already used for a
   different package.
2. **GL2AutomorphicRepresentationsAndTransfer, R17.5, a section after R17.5.14**: residual
   modularity in cohomological weight for totally odd, absolutely irreducible, solvable mod-p
   representations of totally real fields, p odd (gap
   `totally-real-solvable-residual-cohomological-weight`).

## Gaps

| Slug | Needed by | Supplier and section | Needs |
|---|---|---|---|
| `totally-real-weight-two-lifting` | §2.2, hence §§2.4, 2.5, 3.2, 3.3, 4.1, 4.4 | GL2ModularityLifting, Layer 5 after §5.10 | BD14 Théorème 3.2.2 universal modularity of weight-two potentially semistable lifts, without local matching or residue-field restriction, with the five-adic cyclotomic-determinant clause |
| `totally-real-solvable-residual-cohomological-weight` | §2.4, hence §2.5 and the seed | GL2AutomorphicRepresentationsAndTransfer, R17.5 after R17.5.14 | cohomological-weight residual modularity for solvable totally odd mod-p representations of totally real fields |

The non-CM endpoint depends on both gaps through the seed and the lifts. The CM branch (§4.3) and
the all-place comparison given a realization (§4.2) do not.

## Sources

All nine works in the manifest are certified and were read from the cached extractions:
LeHung26, OpenAI26, FLHS15, BD14, SW99, Kisin09, BLGG12, BLGG13II, BCDT01. Locators were checked
against the line-numbered texts: BD14 line 2144 and line 2171, FLHS15 lines 116, 127, 221–265, 343,
355, 404, 411, 421, 426–452, BLGG12 lines 2024 and 2198, BLGG13II lines 82, 122–159, Kisin09 lines
3976 and 4068, BCDT01 line 15, OpenAI26 lines 480, 521, 547, 571 and 990, and the LeHung26 lines
cited in the README. No new work was needed and no text was unreadable, so no
`needs-references.toml` was written. Version notes in the manifest are unchanged.

## Dependency check

```text
candidate: EllipticCurveModularityTotallyReal is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2149 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The last supplier is EllipticCurveModularityImaginaryQuadratic, so the
intended position is right after it and before ModularityAndLanglandsExtensions, as the target
brief proposes. Citation check (`roadmaps resolve`): no cross-roadmap citation or Lean name found
nowhere. Mathlib and Tau Ceti names were checked by hand at the pins, because the resolver reports
no pinned Lake packages on this host:

- `NumberField.IsTotallyReal`, `NumberField.maximalRealSubfield`,
  `NumberField.isTotallyReal_maximalRealSubfield` and
  `NumberField.IsTotallyReal.le_maximalRealSubfield`, all in `InfinitePlace/TotallyRealComplex.lean`;
- `NumberField.IsCMField`, `NumberField.IsCMField.ofCMExtension`,
  `NumberField.CMExtension.eq_maximalRealSubfield` and `IsCyclotomicExtension.Rat.isCMField`, in
  `CMField.lean`;
- `IsCyclotomicExtension`, in `Cyclotomic/Basic.lean`;
- the Tau Ceti Tate-module and quadratic-twist declarations, in `EllipticCurve/TateModule/*` and
  `QuadraticTwist/Basic.lean`.

## Untrusted text

Supplier READMEs, the target brief and the sources were treated as data. LeHung26 contains an AI
disclosure paragraph (LeHung26 line 147); it is a statement of provenance, not an instruction. No
passage asked for commands, credentials or changes of procedure.

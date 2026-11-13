# FIX-RT-AmenableTracesOnCStarAlgebras~2

Six findings from two red-team passes (2a: F01–F04; 2b: F01–F02). None overlap. All six were
verified against the sources and the sibling roadmaps on main. Five were applied and one was
applied differently.

## RT-AmenableTracesOnCStarAlgebras~2a/F01 (P3) — applied

V13b (VonNeumannAlgebras on main) states Powers–Størmer only for a finite `(M, τ)`. Contract:
"trace-class `h, k`" → "`L¹` of `(M, τ)`, applied in `(B(E), tr_E)`, `E ⊇ ran h + ran k`". Matching
clauses went into the scope bullet and §2.4. The §2.4 rank-one Check now computes
`2(1−c²) ≤ 2(1−c²)^{1/2}` in `B(span{v, uv})`.

## RT-AmenableTracesOnCStarAlgebras~2a/F02 (P3) — applied differently

The gap is real. The proposed `‖a‖η_b` term is unneeded: Kadison–Schwarz gives
`‖(1−Q)φ(b)‖ ≤ (2δ)^{1/2}‖b‖`, so the cross term is at most `2δ‖a‖‖b‖`. §2.1 now states
`‖ψ(ab)−ψ(a)ψ(b)‖ ≤ ‖φ(ab)−φ(a)φ(b)‖ + 17δ‖a‖‖b‖`. Also updated: the API bullet, the
`diag(1, 1/10)` Check (`1 ≤ 1.158`), §3.2 and §8.1.

## RT-AmenableTracesOnCStarAlgebras~2a/F03 (P3) — applied

brown2006 lines 340–341 say only that `C*_r(F₂)` is not quasidiagonal. The §8.4 Check now cites
those lines for that alone, and proves stable finiteness itself:
`(τ_{F₂}⊗tr_n)(1 − vv*) = 0` forces `vv* = 1`. "Quasidiagonal ⇒ stably finite" now cites
CStarAlgebras C8.3, which was added to the C8 supplier contract.

## RT-AmenableTracesOnCStarAlgebras~2a/F04 (P3) — applied

TemperleyLieb has neither AF algebras nor tracial states; TemperleyLiebOperatorAlgebras §2.2 has
the AF algebras `B_δ` of the Jones tower. Downstream consumer: "TemperleyLieb, Part II … AF
C*-towers" → "TemperleyLiebOperatorAlgebras, Part II … the AF algebras `B_δ` of the Jones tower (its
§2.2)". The other consumers named all exist on main.

## RT-AmenableTracesOnCStarAlgebras~2b/F01 (P2) — applied differently

Added `isAmenableTrace_of_comp_surjective` without the proposed `hγ` and `hf`:

- `hγ` follows from `TauCeti.CStarAction.isKMSState_comp_iff_of_surjective`.
- Both proofs need only `ker q ⊆ N_τ`.

README §6.4 now states the general form (faithful `γ` is the GNS image), with a route that needs no
unit. Two Checks were added (surjectivity needed; a non-faithful `γ`), and the module docstring was
updated.

## RT-AmenableTracesOnCStarAlgebras~2b/F02 (P3) — applied

V8.RegularL2 on main defines `C*_r(G)`, and V8 defines `L(Γ)` with its trace. Changes:

- Scope: OperatorAlgebraDynamics "reduced group C*-algebras" → "`ℂ ⋊_r Γ`".
- V8 and V8.RegularL2 were added to the VonNeumannAlgebras bullet, the supplier contracts, §7.3
  (comparison, *Needs:*, API) and the Layer 7 dependencies.
- Two Checks were added: `ℤ/2` circulants, and `‖λ(f)‖ = √5 < 3`.

## Evidence notes

- **2a/F02.** Constants for the new estimate: the eigenvalues of `φ(1)` satisfy `t(1−t) ≤ δ`, so
  `‖φ(1) − Q‖ ≤ 2δ`; `‖D − Q‖ ≤ (1−2δ)^{-1/2} − 1 ≤ 1.24δ` and `‖D‖ ≤ 2/√3`, so
  `‖ψ − QφQ‖ ≤ 5δ`; the total constant is `5 + 2 + 5 + 5 = 17`. The proposed `η_b` repair is true
  but weaker, since `η_b ≤ δ^{1/2}‖b‖` by Kadison–Schwarz.
- **2b/F01.** Without `hf` the uniform part holds because `â ↦ (q a)^` is a unitary
  `L²(A,τ) → L²(B,γ)` carrying `M_τ` onto `M_γ`. The amenable part holds because
  `x = σ(bb′) − σ(b)σ(b′) ∈ ker q`, so `τ(x*x) = 0` and `‖φ(x)‖₂² ≤ tr φ(x*x) < ε`. `hq` is needed:
  the unital map `ℂ → C*_r(F₂)` with `γ = τ_{F₂}` breaks the uniform part.
- **2b/F02.** The `ℓ¹` closure equals the closure of the span of the `u_g`, because
  `‖Σ f(g)u_g‖ ≤ ‖f‖₁` and finitely supported `f` are dense in `ℓ¹`.

## Checks run

- **Elaboration.** `lake env lean packages/AmenableTracesOnCStarAlgebras/Suggested.lean` (run from
  the content checkout): exit 0, 23 `declaration uses 'sorry'` warnings (22 before plus the new
  theorem), no errors, no other messages. No `TauCeti.*` build was needed: the three imported
  modules' object files exist.
- **Binder check.** All 46 declarations were checked together: a scratch copy of the file with
  `#check @TauCetiRoadmap.AmenableTracesOnCStarAlgebras.<name>` for each one, elaborated once
  (exit 0).
  - The new theorem's elaborated type has exactly the README hypotheses: `A`, `B` with their order
    instances, `q`, `hq`, `τ`, `hτ`, `γ`, `hτγ`, and the two-part conclusion with the c.p.c.
    splitting.
  - No other declaration changed. The four signatures flagged in the signature table are the same
    as before and have no hypotheses missing: `IsFaithfulTrace`, `IsHypertrace` and `IsFoelnerTrace`
    lose `[StarOrderedRing A]`, and `IsAF` loses both order instances, but none of these bodies uses
    them, and every theorem carries its own.
- **Dependency check.** Output: `depcheck: 208 roadmaps, 1900 edges, 0 problem(s)`. No UPWARD,
  CYCLE or `moved:` line. Every new citation is on main: VonNeumannAlgebras V8 and V8.RegularL2,
  CStarAlgebras C8.3, TemperleyLiebOperatorAlgebras.
- **Citation resolver.** `roadmaps resolve` on the README found no unresolved cross-roadmap
  citations and no unresolved Lean names.
- **Ownership.** `roadmaps grep -i 'amenable trace'` finds no other owner, on main or in any open
  pull request. The new theorem's fully qualified name is unique to this roadmap's namespace.
- **Policy scan.** The added text has no process words or machine paths. No line I added is longer
  than 100 characters; the 8 longer lines that remain were there before.

## Adversarial pass

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §2.1 norm product estimate | `V = diag(1, 1/10)`, `(e₁₂, e₂₁)`; `δ = 0`, `φ(a) = diag(a, 0)` | ψ defect `1`, φ defect `0.99`, cross term `0.01 ≤ 2δ = 0.0198`, bound `1.158`; `ψ = id`, both defects `0` | holds |
| §2.1 constants | `δ ≤ 1/8` | `‖φ(1) − Q‖ ≤ 2δ`; `‖D − Q‖ ≤ (1−2δ)^{-1/2} − 1 ≤ 1.24δ`; `‖D‖ ≤ 1.155`; `‖ψ − QφQ‖ ≤ 2.67δ ≤ 5δ`; total `5 + 2 + 5 + 5 = 17` | holds |
| §2.4 Powers–Størmer in `B(E)` | rank-one `h`, `c < 1` and `c = 1`; `h = diag(1/3, 2/3)`, `u` the flip | `2(1−c²) ≤ 2(1−c²)^{1/2}`; `0 ≤ 0`; HS² `0.114 ≤ 0.667` (`d = 2`: `0.057 ≤ 0.333`) | holds; `d ≥ 1` because `Tr h = 1` |
| `isAmenableTrace_of_comp_surjective`, UAT part | `ℂ → C*_r(F₂)`, `λ ↦ λ1` | `τ = id` is UAT; `γ = τ_{F₂}` is not AT | `hq` is needed |
| same, AT part | `C*(F₂) → C*_r(F₂)` | `τ ∈ AT`, `γ ∉ AT`; `τ ∉ UAT` | the splitting is needed, and none exists |
| same, positive cases | `pr₁ : ℂ² → ℂ`, `σ(λ) = (λ, 0)`; `c₀ → ℂ`, `x ↦ x_1`, `σ(λ) = λe_1` | `γ = id`, AT and UAT on both sides | holds |
| same, faithfulness | `ℂ³ → ℂ²`, `τ = (1, 0, 0)` | `ker q = 0⊕0⊕ℂ ⊊ N_τ = 0⊕ℂ⊕ℂ`; `γ = (1, 0)` is AT | `hf` not needed |
| same, degenerate | `A = 0`; `B = 0` with `A ≠ 0` | no state; `γ = 0` forces `τ = 0`, contradicting `hτ` | vacuous |
| AT descent route | `x = σ(bb′) − σ(b)σ(b′)` | `q(x) = 0`; `τ(x*x) = γ(q(x)*q(x)) = 0`; `‖φ(x)‖₂² ≤ tr φ(x*x) < ε` | holds |
| UAT descent route | the map `â ↦ (q a)^` | `⟪(qa)^, (qa′)^⟫ = τ(a*a′)`; dense range; intertwines `π_τ(a)` with `π_γ(q(a))` | holds |
| §7.3 comparison with V8.RegularL2 | trivial group; `ℤ/2`; `ℤ` with `f = δ_{−1} + iδ_0 + δ_1` | `ℂ`; circulants `[[a,b],[b,a]]`; `‖λ(f)‖ = √5 < 3 = ‖f‖₁` | the closures agree in operator norm |
| §8.4 stable finiteness | an isometry `v ∈ M_n(C*_r(F₂))`; the shift on `ℓ²` | `(τ⊗tr_n)(1 − vv*) = 0`; the shift has no faithful trace | holds |

## Notes for the maintainer

- No name that other roadmaps cite was renamed or removed. The only new name is
  `isAmenableTrace_of_comp_surjective`.
- No supplier gap was declared (`design/plan.json` is unchanged), and no notion moved down from a
  later roadmap.
- `sources.toml` and `metadata.toml` are unchanged; no new source was cited.
- Ownership was checked against the open pull requests through the `roadmaps` tools; no other owner
  was found.
- No suspicious instructions were found in the reviews.

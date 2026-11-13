# FIX-RT-LevelOneAutomorphicFormsForClassicalGroups~1

Repair of red-team round 1 (passes a and b) on `packages/LevelOneAutomorphicFormsForClassicalGroups`.
Edited: `README.md` and `sources.toml` (the CL14 locator). `Suggested.lean`, `metadata.toml` and
`design/plan.json` are unchanged: no finding touches a Lean declaration, and no new supplier gap is needed.
No two findings overlap, so each is settled in its own section.

## RT-LevelOneAutomorphicFormsForClassicalGroups~1a/F01 (P3) — applied

The witness holds: a codeword sign change scales each monomial `β_T` by `(−1)^{|S∩T|}`, not each orbit sum; for `T={p}`, `σ_T=Σe_i` goes to 8 negative and 16 positive coefficients. §8.4's second Check is rewritten on monomials (codeword, singleton, `C+{p}`). The third now says a non-orientable `T` has no coset orbit sum, and invariants vanish on `β_T`.

## RT-LevelOneAutomorphicFormsForClassicalGroups~1a/F02 (P2) — applied

The witness holds: `SO₁` is trivial, `m_G=0`, `EP=1`, and no rank-zero class defines `κ`. Conventions and §1.3 make "permitted" mean `n ≥ 1`. §§4.3 and 4.11 keep the trivial group only as a Levi factor, with `T_ell=EP=1`. §3.16 gains the `SO₁` negative-control Check. §4.7 and the Lean file keep arbitrary rank.

## RT-LevelOneAutomorphicFormsForClassicalGroups~1a/F03 (P2) — applied

CL14 line 12315 (IX Prop. 3.38, p. 322) covers every self-dual class of weight ≤ 22. §6.11 now states that the central order is `(1−ε(π))/2`, with `ε=−1` exactly for `Δ₁₇`, `Δ₂₁`. Route: parity, then `r≥2` refuted by §§2.6, 2.12 at `F_ℓ` near `log 4` and §2.16. The two needed instances stay as a Check; heading renamed.

## RT-LevelOneAutomorphicFormsForClassicalGroups~1a/F04 (P3) — applied

The witness holds: a 4×3 matrix has rank at most 3, so the old Check tested nothing. §4.11's Check now reads: `[[1,0,0],[0,1,0]]` has full row rank `2`, yet `Am=0` has the solutions `(0,0,0)` and `(0,0,1)`. Full column rank is the condition, and a tall matrix never has full row rank.

## RT-LevelOneAutomorphicFormsForClassicalGroups~1a/F05 (P2) — applied differently

§4.9 no longer reproduces the table rows. It proves `P(SO_{2n})=P(Sp_{2n})`, the bijection `P↦Φ₁P` onto `P(SO_{2n+1})`, and the orbit count `(|P|+|P^−|)/2`, and lists only the six counts used later. Checks at degrees 2, 4, 14 give `3`, `12`, `1158`. §8.7 replaces the order tuples with closed rules per factor, recomputed in its Checks.

## RT-LevelOneAutomorphicFormsForClassicalGroups~1a/F06 (P2) — applied

The witness holds: `k=(−1)` is dominant, but `t↦t⁻¹` is not a polynomial representation. Conventions now use the irreducible algebraic representation: `det^{k_g}` times the polynomial representation of highest weight `(k₁−k_g,…,0)`, polynomial exactly when `k_g≥0`. This is AutomorphicBundles §11.16's `S_a(ω)⊗det(ω)^{λ_g}`, whose own Check uses `λ=(−1,…,−1)`. The examples `det⁻¹` (`g=1`) and `det⁻¹⊗Sym²` for `(1,−1)` are recorded.

## RT-LevelOneAutomorphicFormsForClassicalGroups~1a/F07 (P3) — applied differently

Freitag's spanning theorem moved from §6.2 to the end of §6.4, after the theta map, with its own Checks (`M₄(Γ₉)=ℂθ₉[E₈]`; `M₂(Γ₅)=0`). §6.2 keeps the vanishing statements and a timeless pointer; the reviewer's "formerly" sentence is process narrative. §6.2's `θ₉` Check now uses `ker Φ₉=S₄(Γ₉)=0`. §8.14 cites §6.4; heading and scope paragraph updated.

## RT-LevelOneAutomorphicFormsForClassicalGroups~1a/F08 (P2) — applied

The supplier's AL.3.6.1 puts the poles at `iσ, 1+iσ` with `π^∨≅π′⊗|det|^{iσ}`, and its Check `(1,|·|^{2i})` has poles `−2i, 1−2i`. The contract now states this exactly. For `Π_alg`, trivial central characters against `|·|^{inσ}` force `σ=0`. §2.6 gives this reason for the pole term and adds the supplier pair as a negative-control Check. The explicit formula is unchanged.

## RT-LevelOneAutomorphicFormsForClassicalGroups~1a/F09 (P2) — applied

ModularityAndLanglandsExtensions §3.21 (at its head) states CT20 (5.2.1): `ρ_k`, `k_g>g`, is in the packet iff `d_{i₀}=1`, with CT's character. §3.5 now imports this. It proves only the level-one shape: distinct weights, regular `π_i`, singleton `I_odd`, `4 | n_id_i`, integral exponents. Contract and scope name the import; new Checks `Δ₁₁[2]⊕[3]` and three odd blocks.

## RT-LevelOneAutomorphicFormsForClassicalGroups~1a/F10 (P3) — applied

The grouping Check only restated the definition. §4.1 now has two computed Checks in its place. Grouping: involutions of `SO₃` (form `x₁x₃+x₂²`) form one geometric class but infinitely many rational classes, one per square class, all sharing the mass `1/4`. Finite order: `u=[[1,1],[0,1]]` has charpoly `(X−1)²` but `u^r=[[1,r],[0,1]]≠1`, so its class is not in `C(G)`.

## RT-LevelOneAutomorphicFormsForClassicalGroups~1a/F11 (P1) — applied

The witness holds: `2(X−1)²` has `e=(1,2,1)` but signed coefficients `(2,4,2)`. §4.10 now takes `P ∈ ℤ[X]` monic of degree `d_G`, which every element of `P(G)` is, and roots counted with multiplicity. The coefficient identity is stated for monic `P` and `0≤j≤d_G`. Added a negative-control Check: `2(X−1)²` against `(X−1)²`. No other statement in the roadmap uses a nonmonic polynomial.

## RT-LevelOneAutomorphicFormsForClassicalGroups~1b/F01 (P3) — applied

CT20 lines 515–516, 525 and 2450: Theorems 6–7 point to an online dataset and print no values. §4.18's first sentence now says the masses are the unique solutions of §4.11's systems as instantiated in §§4.12, 4.13, 4.15, 4.17. No table is taken over; only the `SO₃` values appear. The `SO₃` Check no longer mentions "tables".

## RT-LevelOneAutomorphicFormsForClassicalGroups~1b/F02 (P3) — applied

Confirmed against CL14: 18225 at line 2402 (§3.1, p. 63), 12870 at line 2449 (§3.1, p. 64), 405/286 at lines 2469–2470 (§3.2, p. 64). In §6.3's Check, "III §2, p. 63" becomes "III §3.1, pp. 63–64" and "III §2, p. 64" becomes "III §3.2, p. 64". The CL14 locator in `sources.toml` is updated to match.

## RT-LevelOneAutomorphicFormsForClassicalGroups~1b/F03 (P3) — applied

Mechanical comparison of all 110 *Needs:* lines against the contracts confirms the gaps. Added AutomorphicBundles §12.13 (non-neat level) to §6.1. Added ComputationalNumberTheory §§4.1–4.7, 4.18 to §2.16. Added AutomorphicFormsOnReductiveGroups §§3.2, 3.4 to §1.1 and §2.4 to §3.4. Added MetaplecticAutomorphicForms §§0.15, 2.4c to §6.4 and §§3.4, 3.5, 3.7, 5.6 to §6.10. Pattern repair: OrthogonalSpinGroups Layer 1 added to §4.6. Layer Dependencies updated.

## RT-LevelOneAutomorphicFormsForClassicalGroups~1b/F04 (P3) — applied

AnalyticNumberTheoryPartI §1.8 (iv), on main, requires `A^s∏Γ(a_is+b_i)` with no constant factor. `Γ(s,I_w)` carries `2(2π)^{−w/2}` and `Γ(s,e)` carries `π^{−1/2}`. §2.6 now applies §1.8 to `κ⁻¹Λ₁` and `κ⁻¹Λ₂`: same `w`, zeros, poles and formula, with `A=B=π^{−a/2}(2π)^{−b}`. Added a Check: `κ(1,Δ₁₁)=2(2π)^{−11/2}≈8.148·10⁻⁵` and `κ(1,1)=1`.

## Checks run

- **Lean elaboration** (`lake env lean` on `Suggested.lean`, from the content checkout): no errors; four `declaration uses 'sorry'` warnings (lines 85, 129, 142, 154), one per theorem. No `TauCeti.*` build was needed.
- **Signature check**: I put `#check @name` for all eight declarations into one scratch copy and elaborated it. Every elaborated type matches its README statement and the worker's signature record: no binder lost, no change.
- **Dependency check** (command of the brief), exact output:

      depcheck: 239 roadmaps, 2175 edges, 0 problem(s)

  No UPWARD, CYCLE or moved line.
- **Citation resolver** (`roadmaps resolve` on the edited README): no cross-roadmap citation and no Lean name found nowhere.
- **Wording scan**: no LaTeX delimiters, no process words in new text, no code span split across lines.
- **Gate failures**: none were listed for this round.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| Coefficient representation (Conventions) | `g=1, k=−1`; `g=2, k=(1,−1)`; `k=(1,0)`; `k=(−1,−1)` | `det⁻¹`; `det⁻¹⊗Sym²`, weights `(1,−1),(0,0),(−1,1)`, highest `(1,−1)`; polynomial standard rep; `det⁻¹` (AutomorphicBundles §11.16 Check) | holds |
| Permitted groups `n≥1`; §3.16 at the boundary | `SO₁`, `Sp₀`, `SO₃ k=0,5` | `SO₁`: `m_G=0`, `EP=1`, `N⊥(∅)=0`, no `κ`. `Sp₀`: `m_G=1`. `SO₃`: `EP(0)=−1·0+1=1`, `EP(5)=−1·1+0=−1=−dim S₁₂` | rank 0 excluded; `SO₃` unchanged |
| §4.3 Levi base value | `SO₃` (Levi `GL₁×SO₁`) | `T_ell(SO₁)=1`; Levi term `+1/2`, independent of `λ` | consistent with the §4.3 Check |
| AL.3.6.1 contract and §2.6 poles | `(1,|·|^{2i})`; `(1,1)`; rank-2 `π`, `π′=π⊗|det|^{iσ}` | `σ=−2`, poles `−2i, 1−2i`; `σ=0`, poles `0,1`; central character `|·|^{2iσ}≠1` unless `σ=0` | `σ=0` forced on `Π_alg` |
| §2.6 constant `κ` | `(1,Δ₁₁)`; `(1,1)`; `(1,Sym²Δ₁₁)` | `κ=8.1478·10⁻⁵`, `A=(2π)⁻¹`; `κ=1`, `A=π^{−1/2}`; `κ=2(2π)^{−11}π^{−1/2}≈1.873·10⁻⁹`, `A=π^{−1/2}(2π)^{−1}` | dividing by `κ` keeps (i)–(iii) with the same `w` |
| §3.5 level-one shape | `Δ_w[2]⊕[1]` (`g=2`); `Δ₁₁[2]⊕[3]` (`k=(7,7,4)`); `Sym²Δ₁₁[1]⊕[3]⊕[1]`; `Δ₁₉,₇[2]⊕[1]` (`k=(11,11,7,7)`) | `χ(s₁)=−1`; weights `±6,±5,±1,0` and `d_{i₀}=3`, so excluded; weight `0` three times; `nd=8`, `χ=(−1)^2=1` | holds; the criterion is imported |
| §4.1 grouping and finite-order Checks | `SO₃` involutions; `u=[[1,1],[0,1]]` | rational classes biject with `ℚ^×/ℚ^{×2}` (infinite), mass `1/4`; `u^r` upper-right entries `1,2,3` against `0` | discriminating |
| §4.9 counts | degrees 2–16 (enumeration script) | `(|P|,|P^−|)`: `(5,1)→3`, `(19,5)→12`, `(59,5)→32`, `(165,19)→92`, `(419,19)→219`, `(1001,59)→530`, `(2257,59)→1158`, `(4877,165)→2521`; `|P₁|`: `SO₃ 3`, `SO₁₅ 1339`, `SO₁₇ 2948`, `SO₁₆ (1885+99)/2=992` | all agree; `1157` misprint confirmed |
| §4.10 monicity | `2(X−1)²`; `(X−1)²`; `Φ₃` | `(1,2,1)` against `(2,4,2)`; `(1,2,1)=(1,2,1)`; `e₁=−1`, `e₂=1` | monic hypothesis needed |
| §4.11 rank Check | `[[1,0,0],[0,1,0]]`; a 4×3 matrix | rank 2, nullity 1; rank ≤ 3 < 4 | new negative control is valid |
| §4.18 | `SO₃` | `(−1/12, 1/4, 1/3)` on `P₁(SO₃)` nonzero; zero masses only at `Φ₁Φ₄`, `Φ₁Φ₆`, which are outside `P₁` | holds |
| Spanning theorem (§6.4) | `k=4,g=9`; `k=2,g=5`; `k=0`; `k=8,g=17` | `M₄(Γ₉)=ℂθ₉[E₈]`; `X₄=∅`, so `0`; constants; `dim=|X₁₆|=2` (§8.12) | holds |
| §6.11 central orders | the eleven classes of §5.3 | `ε`: `1` for `1, Δ₁₁, Δ₁₅, Δ₁₉`, `Δ₁₉,₇` (`i²⁰i⁸`), `Δ₂₁,₅` (`i²²i⁶`), `Δ₂₁,₉` (`i²²i¹⁰`), `Δ₂₁,₁₃` (`i²²i¹⁴`), `Sym²Δ₁₁` (`i²³i`); `−1` for `Δ₁₇`, `Δ₂₁`. `Λ(1/2,1)=2.7233·(−1.4604)≠0` | exactly two signs `−1`; `r≥2` gives the CL14 inequality (3.6) via §2.12 |
| §8.4 sign-change Checks | `T={p}`; `T=C+{p}`; codeword `T`; non-orientable `T` | 8 negative / 16 positive coefficients; `|(Ω∖C)∩T|=1`; doubly even code, so even intersections; odd stabilizer element gives coefficient `=−`coefficient, hence `0` | holds |
| §8.7 order rules | the five cases | `(C, 1/ω, γ, Λ_A, 1/Γ_A)` recomputed from the rules: `(8,16,5)`: `0,0,0,−1,1`; `(8,24,1)`: all `0`; `(12,24,1)`: `0,0,0,−1,1`; `(16,24,1)`: `0,−4,−4,−1,9`; `(24,24,1)`: `0,−12,−12,−1,25` | every sum is `0`; the rules reproduce the source's orders without copying them |

## For the maintainer

- **SiegelModularForms**, an open roadmap that consumes this one, cites "§§6.1–6.2 … the singular-range vanishing and spanning theorems". The spanning theorem is now at the end of §6.4, and §6.2 carries a pointer to it, so the citation can still be followed. That roadmap could cite §6.4 for spanning. Its other citations of §6.2 (odd-weight, negative-weight and Resnikoff–Freitag vanishing) are unaffected.
- **Renamed headings** (numbers unchanged): §6.2 is now "Boundary and vanishing theorems at level one", and §6.11 is "Central orders of the self-dual classes of motivic weight at most 22". No roadmap cites either heading's anchor.
- **Ownership**: the general central-order statement of §6.11 has no other owner. I searched every roadmap on main, the open roadmap pull requests and the board packages. §3.5 now imports the regular criterion from ModularityAndLanglandsExtensions §3.21 instead of planning it twice.
- **Overlaps**: the only other open pull request changing this roadmap is #2285, its own submission to the content repository. It carries an older README and needs the repaired package text before it merges. No cited id is dropped by an open pull request, and none is defined only by an open revision.
- **Sources**: no new source was needed and no `needs-references.toml` was written. The untrusted texts read (reviews, supplier READMEs, sources) contained no instructions addressed to the worker.

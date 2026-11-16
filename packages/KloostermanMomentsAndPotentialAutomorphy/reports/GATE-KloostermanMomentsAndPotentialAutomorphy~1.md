# GATE-KloostermanMomentsAndPotentialAutomorphy~1: answers to human review

One review comment, one point.

## H01 (mycaule) — answered

LeanPool's `KloostermanWeil` at `f8b9b72` proves `‖S(a, b; p)‖ ≤ 2√p` over the prime fields `ZMod p` by
the Stepanov–Carlitz method (`prime_bound` and `weil1948_bound` in `Weil/PrimeKloosterman.lean`,
`kloostermanSumPrime_le_two_sqrt_of_not_both_zero` in `Weil/ChineseRemainderAndCompletion.lean`, with
squarefree moduli by the Chinese remainder theorem). That is the case `q = p`, `χ = 1` of Weil's bound
`norm_kloostermanSum_le`, which CharacterSumsOverFiniteFields §5.5 owns and proves by the same method,
and the rank-two case of CongruenceSpectralGap §4.2b's `hyperKloosterman_bound`. This roadmap states no
bound on a single Kloosterman sum, so the citation of the prior formalization belongs in
CharacterSumsOverFiniteFields §5.5, and `README.md` and `Suggested.lean` are unchanged. The
prime-field result also could not supply any input here. The moments `m₂ᵏ(p^m)` of §0.2 sum over
`𝔽_{p^m}ˣ` for every `m`, and §§1.2 and 1.4 use the purity of `Kl₂` at every closed point
(CongruenceSpectralGap §4.2b). For example, at `a = ω ∈ 𝔽₄ ∖ 𝔽₂` the needed fact `|Kl₂(ω; 𝔽₄)| = 1 ≤ 4`
is a bound over `𝔽₄`, which no `ZMod N` contains.

## Evidence

- LeanPool, read at commit `f8b9b721d616a2cc0b22fc226e4a9e3dd6cea2d0`: `KloostermanWeil/Weil.lean` re-exports
  `Weil.PrimeKloosterman` and `Weil.ChineseRemainderAndCompletion`. Everything is stated over `ZMod N`.
  There are no extension fields, no multiplicative twist and no sheaves. Its docstring says the
  code is adapted from an Apache-2.0 toolkit.
- CharacterSumsOverFiniteFields, at the head of its open pull request: §5.5 states, for
  `a, b ∈ Fˣ` and every `χ` over every finite field `F`, `|ω₁| = |ω₂| = √q` and
  `|K(χ; a, b)| ≤ 2√q` (`norm_kloostermanSum_le`, declared in its `Suggested.lean`). The route is
  Stepanov's bound of §4.3 (ii), and §5.5 notes that at `χ = 1` this is CongruenceSpectralGap's
  `hyperKloosterman_bound` at `k = 2`.
- CongruenceSpectralGap, at the head of its open pull request: §4.2b deduces `hyperKloosterman_bound`
  for every finite field, nontrivial `ψ`, `k ≥ 1` and `r ∈ Fˣ`. Its Downstream consumers paragraph
  records this roadmap as consuming the raw sum and the all-rank sheaf realization.
- This roadmap: no bound on individual sums occurs in `README.md` or `Suggested.lean`. The Deligne
  bound is listed as imported (Summary, line 21; Scope and ownership, line 91), and §1.2 derives
  `|ι(α_a)| = q^{1/2}` from the imported purity.

## Adversarial pass

No statement was added or changed, so the rows record the claims the answer relies on.

| Statement | Instance | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| A real rank-two sum with `K² ≤ 4q` forces `\|α\| = \|β\| = √q` at that point | `𝔽₂`, `a = 1`, `ψ(1) = −1` | `K = ψ(0) = 1`; `1 + T + 2T²` has discriminant `1 − 8 = −7 < 0`, so the roots are complex conjugates with `\|α\|² = αβ = 2` | holds | none |
| The prime-field bound does not reach closed points of degree two | `𝔽₄ = 𝔽₂(ω)`, `a = ω` | `x = 1`: `ψ(1 + ω) = −1`; `x = ω`: `ψ(ω + 1) = −1`; `x = ω²`: `ψ(ω² + ω²) = ψ(0) = 1`; `Kl₂(ω) = −1`, `1 − T + 4T²`, `\|α\|² = 4` | needs the bound over `𝔽₄`, not over `𝔽₂` | none |
| The moment over `𝔽₄` is not a `ZMod 4` sum | `a = 1` | `𝔽₄`: `x + 1/x ∈ {0, 1, 1}`, all of trace `0`, so `Kl₂(1; 𝔽₄) = 3`. Lifting from `𝔽₂` agrees: `−((α + β)² − 2αβ) = −(1 − 4) = 3`. The classical sum over `(ℤ/4)ˣ` is `e(2/4) + e(6/4) = −2` | the two sums differ | none |

## Suppliers, ownership and sources

- No construction was added, so there was no new ownership question. The comment contains no
  instruction-like text.
- No source was fetched through the sources service, and no manifest entry changed. The LeanPool
  files were read on the public GitHub repository at the commit the comment names.
- `Suggested.lean` is unchanged, so its 22 elaborated signatures are as recorded in
  `signatures.md`: 0 lost section binders. No `#check` re-run was needed.

## Build and gate

- `lake build TauCetiRoadmap.KloostermanMomentsAndPotentialAutomorphy.Suggested`:
  `Build completed successfully (18239 jobs).` The only warnings are `declaration uses 'sorry'` at
  `Suggested.lean` lines 107, 127, 212, 222 and 237.
- Gate summary line: `gate KloostermanMomentsAndPotentialAutomorphy: set_option=0 blob=0 latex=0 tex=0
  prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0
  no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0
  empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0
  stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency direction: `depcheck: 250 roadmaps, 2381 edges, 0 problem(s)`. There is no UPWARD and
  no CYCLE line.
- No commit: nothing changed, and the branch stays at `954c294`.

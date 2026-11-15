# Repair of EllipticCurveModularityImaginaryQuadraticPartII (design, round 7)

Review settled: `REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~6` (two P2 findings, R01 and
R02). Both verified and applied. Files changed: `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md`,
`packages/EllipticCurveModularityImaginaryQuadraticPartII/design/plan.json`. `sources.toml` unchanged.

## R01 (P2) — applied

Scope and ownership, *Status of the sources*: "Layers 3–7 follow CaptainSude26 …; Layer 2 follows
LeHung26 …; the parent follows OpenAI26" → CaptainSude26 "is cited for" the protected condition,
exceptional-class detection, protected patching and the degeneration; LeHung26 "is cited for" modularity
before base change; "the parent cites OpenAI26". Source-status disclosures kept.

Pattern search: `follow` occurs elsewhere only as ordinary mathematics (README §Conventions "Relative dual
Selmer groups follow GlobalGaloisDeformations §3.6", a supplier convention; "followed by base change";
"the following are equivalent"; "follow by the arguments of the parent's §8.5"). None says a layer follows a
source. `plan.json` has no occurrence; its `summary` describes layers by their mathematics only.

## R02 (P2) — applied

Verified. §4.2 gives `Q_N` outside `S ∪ B` for an arbitrary finite `B`; GlobalGaloisDeformations §5.1 (at its
open head) requires only `Q` disjoint from `S`; §5.1 here has `P^c ∩ S = ∅`. So with `B = ∅` a place
`w = v^c`, `v ∈ P`, can lie in `Q`, and then "the complex conjugate places `P^c` are hyperspecial" (old §5.3)
is false. CaptainSude26 lines 301–302 choose Taylor–Wiles primes outside `S ∪ S^c`.

What changed: §5.2 and §5.3 take `Q` from §4.2 with `Q ∩ (S ∪ S^c) = ∅` (`B ⊇ S^c`); §5.3's bare
"`P^c` hyperspecial" becomes an argument (CaptainSude26 lines 299–314); §5.4 selects with `B = S^c`; new
§5.3 negative Check (indices 12, 60; `diag(1+ε, 1−ε)`); plan 5.2/5.3 hypotheses and test
`hecke_Q_meets_Pc`. §4.2 unchanged.

Note for the record: ACC Theorem 3.1.1's own hypothesis (ACC23 lines 2337–2339: `K_v` hyperspecial on
`R^c − R`) is not violated by `w ∈ Q ∩ P^c`, since `w` then lies in the Iwahori-type set `R ∪ P ∪ Q`; what
fails without the exclusion is the roadmap's claim of hyperspecial level and unramifiedness on all of `P^c`.
The repair makes that claim true and matches the source; `gap:acc-torsion-inertial-comparison` is unchanged
(its contract already carries the `R^c ∖ R` hyperspecial condition, now satisfied at `P^c`, `R^c ∖ S` and
`Q^c`).

Pattern search: the only hyperspecial or unramified-at-conjugate claim depending on `Q` was §5.3. §4.3
(presentation for any `Q_N` of §4.2) makes no level claim and holds for every `B`; §§6.1–6.2 and Layer 7
constrain `v^c` by hypotheses on `ρ`, `π` and the preparation, not through `Q`.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result, change |
|---|---|---|---|
| §5.3 new Check: `w = v^c ∈ Q` is a valid Taylor–Wiles place | `q_w = 11`, `ρ̄(Frob_w) = diag(2,3)` over `𝔽₅` | `11 mod 5 = 1`; `det = 6 ≡ 1`; eigenvalues `2 ≠ 3` | Valid TW place, so the exclusion is not automatic. |
| §5.3 new Check: level at `w` | `PGL₂(O_{F_w})`, `q = 11`, `p = 5` | `#ℙ¹(𝔽₁₁) = 12` (by enumeration, `#GL₂(𝔽₁₁) / #B(𝔽₁₁) = 12`); 5-part of `𝔽₁₁^×` has order 5; diamond-kernel index `12·5 = 60` | Not hyperspecial (index ≠ 1). |
| §5.3 new Check: ramified tangent lift | `𝔽₅[ε]/(ε²)`, `τ = diag(1+ε, 1−ε)`, `φ = diag(2,3)` | `τ¹¹ = diag(1+11ε, 1−11ε) = τ`; `det τ = 1 − ε² = 1`; `τ⁵ = 1`; `φτφ⁻¹ = τ`; `tr τ = 2` | Valid fixed-determinant lift ramified at `w ∈ P^c`; excluded by `Q ∩ S^c = ∅`. |
| §5.3 "no place of `P^c` lies in `S ∪ Q`" | `v ∈ P`, `v^c ∈ S`?; `v^c ∈ Q`? | `P^c ∩ S = ∅` (§5.1); `v^c ∈ Q ⇒ v ∈ Q^c ∩ S`, contradicting `Q ∩ S^c = ∅` | True under the new hypothesis; false for `B = ∅` (witness above). |
| §5.3 "every conjugate of a place of `R ∪ P ∪ Q` not in `R ∪ P ∪ Q` lies outside `S ∪ Q`" | `u ∈ R` with `u^c ∈ P`; `u^c ∈ S₅`; `w ∈ Q` with `w^c ∈ S` | `u^c ∈ P ⇒ u ∈ P^c ∩ S`, excluded; `S₅` is conjugation-stable and `R` prime to 5; `w^c ∈ S ⇔ w ∈ S^c`, excluded | True; level `K^P(Q)` is hyperspecial off `R ∪ P ∪ S₅^st ∪ Q`, so ACC's `R^c ∖ R` condition holds. |
| §5.3 unramified set | `S_aux = (S∪Q) ∪ (S∪Q)^c`, `R_aux = R ∪ P ∪ Q` | `S_aux ∖ (R_aux^c ∖ R_aux) = S ∪ Q` (5-adic places stay; `R^c, P^c, Q^c` outside `S ∪ Q` are removed) | Matches CaptainSude26 lines 306–311. |
| §5.2 degenerate `Q = ∅` | `Q = ∅` | `∅ ∩ (S ∪ S^c) = ∅`; `Δ_∅ = 1` | Existing Checks of §§5.2–5.3 unchanged. |
| §5.4 selection with `B = S^c` | §4.2 with finite `B` | `S` finite ⇒ `S^c` finite; §4.2 allows any finite `B` | Valid instance of §4.2; §4.3 presentation and the deficit Check (`dim R_∞ = 111`, `dim S_∞ = 151`, deficit 40) unchanged, since `g = r − 3d − 1 + t` does not depend on `B`. |

Calculations: `scratch/calc/r02.py` in the job's scratch directory (dual-number powers, Borel index by
enumeration).

## Checks run

Dependency check:

```text
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2245 edges, 0 problem(s)
```

No UPWARD or CYCLE line. No supplier added; no citation added beyond CaptainSude26 lines 299–314 (already
in the manifest, Lemma 4.1 p.6). `plan.json` re-parses as JSON.

Lean: this design has no `Suggested.lean` (all three headlines are unstatable at the pins, as the README's
*Lean* paragraph says); no declaration changed, so there was nothing to `#check` or elaborate.

## For the maintainer

- No name other roadmaps cite changed. §§5.2–5.3 now quantify over Taylor–Wiles data disjoint from
  `S ∪ S^c`; §4.2 is unchanged and still general.
- The citation resolver's four leads are source keys (`LeHung26`, `OpenAI26`, `CaptainSude26`) read as
  roadmap names, and `ResidualImage.adZeroRep`, a declaration of the ArithmeticGaloisRepresentations
  roadmap's `Suggested.lean`: none is a defect, as the round-6 review also found.
- Ownership: the repair adds no construction, so no new ownership question arises.

# FIX-PKG-PELModuliPartII~7

Repair of the findings of `REV-PKG-PELModuliPartII~6` (two P3 findings). Both are right and both
are applied. The review's "For the human reviewers" section (the RZ96 licence question and the
untested published pagination of Zhang21 and LTXZZ22) lists no finding, so nothing was changed
because of it.

## F01 (P3) — applied

RSZ21 locator. README §6.6: "RSZ21, §3.3, (3.15)–(3.16) and Remark 3.7, pp. 11–12" → "RSZ21, §3.4, …".
README §6.7: "RSZ21, §§3.3, 4.1, pp. 14–19" → "RSZ21, §§3.4, 4.1, pp. 14–19". In `sources.toml`,
entry RSZ21, `locator`: leading "§3.3" → "§3.4". Page numbers unchanged.

Evidence. In RSZ21, §3.3 begins at line 524 (p. 9) and §3.4 at line 621 (p. 11). Definition 3.6
(the CM moduli F₀ with the Kottwitz condition (3.14)) is at line 627 and the a-variant at lines
652–656 (both p. 11). (3.15), (3.16) and Remark 3.7 are at lines 680, 687 and 688 (p. 12). §3.5
starts at line 848 (p. 15) and §4.1 at line 940 (p. 17). So §3.4 covers pp. 11–15 and contains
everything both citations use. Pages 14–19 are §3.4 (the lattice-level variant, (3.21)–(3.23)),
§3.5 and §4.1 with Definition 4.1 (line 1011, p. 18).

Pattern. I searched the README and the manifest for every other RSZ21 section number. §4.1 (4.2)
is at line 968 (p. 17), §5.1 at line 1199 with (5.5)–(5.7) at lines 1261–1302 (pp. 23–24), §5.2 at
line 1334, Theorem 5.4 at line 1402 (p. 26), Theorem 5.7 at line 1484 (p. 27), Theorem 6.2 at line
1598 (p. 30) and Remark 6.5 at line 1620 (pp. 30–31). All agree, so no other occurrence needed a
change. The References entry for RSZ21 gives no section numbers.

## F02 (P3) — applied

Code spans. §6.6: "char(ι₀(a)|Lie `` `A₀)=∏_{φ∈Φ}(T−φ(a)` ``)" → "`` `char(ι₀(a)|Lie A₀)=∏_{φ∈Φ}(T−φ(a))` ``".
§6.8 and the Layer 6 example: "`` `Σ_{φ∈Φ_v}(n` `` r₀,φ−r_φ)" → "`` `Σ_{φ∈Φ_v}(n·r₀,φ−r_φ)` ``".
Pattern repair, same line of §6.6: "For a=`` `O_{F⁺}` ``" → "For `` `a=O_{F⁺}` ``". Here too the formula was split half in prose and half in code.

Evidence that n·r₀,φ is a product: RSZ20 line 3115 gives the jump of the determinant filtration as
`n − r_φ + n(r₀,φ − 1) = n·r₀,φ − r_φ`, and line 3119 gives `µ_φ = n·r₀,φ − r_φ`. A reader who
takes the broken span as the sum `n + r₀,φ − r_φ` gets 3+1−2=2 (even) for the example, against
the correct 3·1−2=1 (odd). The parity conclusion of the example depends on the product.

Pattern scan, mechanical, over all 218 code spans of the README:
- unbalanced brackets: three before the edit (lines 1265, 1313, 1336), none after;
- an odd number of backticks on a line: none;
- a span directly next to an operator or relation symbol in prose: this found the `a=O_{F⁺}` split
  above and nothing else. The other glued spans are hyphenated adjectives (`` `O_{E_Φ}`-scheme ``,
  `` `O_{F⁺}^×`-similitudes ``), and these are not cut formulas.

## Adversarial pass on the changed text

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §6.6 Kottwitz condition, rendered as one span | F=ℚ(√−p), Φ={φ}, a=√−p; F of degree 2g | degree of `∏_{φ∈Φ}(T−φ(a))` is 1 = dim A₀ for F=ℚ(√−p), and g = dim A₀ in degree 2g. A product over all embeddings would have degree 2g ≠ g. The conjugate action gives T+√−p ≠ T−√−p | pass, matches RSZ21 (3.14) at line 642 | span only |
| §6.6 "`a=O_{F⁺}` means λ₀ principal" | F⁺=ℚ, a=ℤ; a=2ℤ, dim A₀=1 | ker λ₀=A₀[ℤ]=0, so principal. A₀[2] has order 2^{2·1}=4, so not principal | pass | span only |
| §6.6 locator | RSZ21 lines 621, 627, 652–656, 680, 687, 688 | §3.4 starts p. 11 (line 609 is the p. 11 marker); (3.15) and Remark 3.7 are on p. 12 (marker at line 672) | pass after repair | §3.3 → §3.4 |
| §6.7 locator | RSZ21 lines 784–1093 (pp. 14–19) | §3.4 to line 847, §3.5 from 848, §4.1 from 940, Definition 4.1 at 1011 | pass after repair | §§3.3 → §§3.4 |
| §6.8 parity exponent `Σ_{φ∈Φ_v}(n·r₀,φ−r_φ)` | n=3, r_φ=2; n=2, r_φ=1; n=4, r_φ=3 | n=3: r₀=1 gives 1, r₀=0 gives −2. n=2: 1 and −1, same parity since n·1 is even. n=4: 1 and −3, same parity. Positive convention: n−r_φ = r_φ̄ (3−2=1=r_φ̄, 4−3=1=r_φ̄). The sum misreading gives 2, 0, 2 instead of 1, 1, 1 | pass; parity differs between the conventions exactly when n is odd and r₀,φ changes | span only |
| Layer 6 example (parity) | n=3, one φ, r_φ=2 | 3·1−2=1 (odd) and 3·0−2=−2 (even), as the example states | pass | span only |
| `sources.toml` RSZ21 `locator` | same lines as §6.6 | §3.4 | pass after repair | §3.3 → §3.4 |

No statement, hypothesis, Check or `*Needs:*` line changed in substance. The edits are a locator
and the rendering of three formulas, so no other Check or worked example uses a changed object.

## Checks

- **Elaboration.** `lake env lean packages/PELModuliPartII/Suggested.lean`, run from the content
  checkout: exit 0, no output. `Suggested.lean` is unchanged. It has no declaration, so the
  `#check @name` audit covers 0 of 0 declarations and nothing changed. No `TauCeti.*` import, so
  nothing had to be built.
- **Dependency direction**, exact output:

  ```text
  depcheck: 245 roadmaps, 2242 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve packages/PELModuliPartII/README.md`: "Lean names found nowhere:
  None." (Lean names outside TauCetiRoadmap could not be checked by that tool on this host.)
- **Gate failures.** The brief lists none.
- **`design/plan.json`.** Unchanged: no new supplier gap is needed.

## For the maintainer

- No name, section, layer or target id changed, so no other roadmap's citation is affected.
- Ownership and duplication are unchanged: the edits add no object.
- No source was fetched and nothing was added to `needs-references.toml`. RSZ21 and RSZ20 were
  read from the worker's cache.
- No suspicious instruction was found in the review text.

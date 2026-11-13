# Review of GaloisActionOnEtaleCohomology (pull request #2271 at 1947660)

**Verdict:** accepted

No findings. This is an incremental re-review of the 20 lines changed since `14c3a34`, all in `TauCetiRoadmap/GaloisActionOnEtaleCohomology/README.md`.

## Previous findings

- R01 — repaired: README line 536, “`X = Y^an` for a proper `K`-scheme `Y`, with any prime `ℓ` and `j = 0` when `ℓ = char K`”; lines 541–542 carry the `ℓ ≠ char K` qualifier and the characteristic-two Check.
- R02 — repaired: README line 513, “on a variety `X` over a separably closed field `k`, assuming `X` is complete or `ℓ ≠ char k`”.

The R01 repair takes a different route from the one suggested (Artin–Schreier instead of §F.3). That is the right choice: EtaleCohomologyFoundations §F.3 on main (README lines 692–698) requires the torsion order invertible on the base, so it does not cover `ℓ = char K`.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §4.4 (c), linear-algebra step: `F − 1` surjective, `dim_{𝔽_p} ker ≤ dim_k V` | `V = k`, `F = Frob`; `F = 0`; `V = 0`; `k = 𝔽_p` not closed, `F = id` | kernel `𝔽_p` (1 ≤ 1), surjective; kernel 0, `F − 1 = −1` bijective; trivial; `F − 1 = 0`, not surjective | holds; closedness needed and stated | none |
| §4.4 (c), `H^q(Y_{K̄}, 𝔽_p) = ker(F − 1)` on `H^q(Y_{K̄}, 𝒪)` | long exact sequence at degree `q`; `Y = ∅`; `q = 0` | cokernel of `F − 1` on `H^{q−1}(𝒪)` is 0, so `H^q(𝔽_p)` injects with image the kernel; all groups 0; `H^{−1} = 0` | holds; agrees with stacks03N1 line 4569 | none |
| §4.4 (c), route for `ℓ = char K` | suppliers at their heads | SchemeAndStackFoundations §2.6 finite modules over a Noetherian base; §2.10 Zariski = étale for quasi-coherent; §2.11 exact sequence in characteristic `p`; §8.4 bound for every `ℤ/n` | every input owned | none |
| §4.4 Check, `K = 𝔽_2((t))`, `Y = ℙ¹`, `ℓ = 2` | `H⁰(𝒪) = K̄`, `H¹(𝒪) = 0` | `ker(x² − x) = 𝔽_2`, `H^{q>0} = 0`; dévissage: `ℤ/2^n`, 0; limits `ℤ_2`, `ℚ_2`; prime-to-`p` formula gives `H² ≠ 0` | discriminates | none |
| §4.4 Check, `ℙ^d`, `ℓ ≠ char K` | `d = 0, 1`; `ℓ = char K` | `H⁰ = ℤ_ℓ` only; `H² = ℤ_ℓ(−1)`; for `ℓ = char K` no twist exists and `H² = 0`, so the qualifier is needed | holds | none |
| §4.2 Check, `ℙ¹`, `ℤ/n`, `n` invertible in `K` | `n = p`, `char K = 0`; `n = p = char K` | `H² = ℤ/p(−1)`, included; excluded, where `H² = 0` | holds | none |
| §4.3 citation of milneLEC Theorem 19.2 | `X = ℙ¹`, `𝔸¹` with `ℓ = char k` | source line 4861 puts completeness on `X`: `ℙ¹` qualifies, `𝔸¹` does not | matches | none |
| §4.4 against the rest of the README | lines 55, 416, 507, 544, 551 | `j = 0` convention; disc `H¹` infinite (not proper); nonproper invariance fails; `ℓ = char K` is the residue characteristic; elliptic example has `char K = 0` | consistent | none |

Rows for untouched statements stand as in the previous review, of `14c3a34`.

- Source locators checked against the text: 5 (stacks03N1 lines 4455 and 4569, §63 at line 4437; milneLEC lines 4133, 4783, 4860). Seeded targets falling in the change: §§4.2, 4.3, 4.4.
- Cross-roadmap citations resolved: 5 (SchemeAndStackFoundations §2.6, §2.10 `quasiCoherent_topology_comparison`, §2.11 `artinSchreier_sequence` on main, README lines 4357, 4650, 4721; EtaleCohomologyFoundations §F.3 on main; ClassicalAdicEtaleCohomology §8.4 at its open head).
- Library declarations: no Lean statement changed; the pinned Mathlib and Tau Ceti were searched for the Frobenius-semilinear lemma and do not state it.
- Gate: every check passes at `1947660`, including the targeted build. `lake env lean` on `Suggested.lean`: one `sorry` warning at line 120, nothing else. The 3 elaborated signatures are unchanged.
- Dependency check: `depcheck: 222 roadmaps, 1973 edges, 0 problem(s)`; no UPWARD or CYCLE line. Files changed outside the folder: 0.
- Pull request text: the description states the characteristic-p extension, its Artin–Schreier route and the retained invertibility hypotheses; title, summary block and dependency paragraph agree with this head.
- Declared gap `gap:proper-rigid-finiteness`: untouched by the change.

Overlap check: read ClassicalAdicEtaleCohomology, EtaleCohomologyFoundations, SchemeAndStackFoundations; nothing shared. No roadmap on main or at an open head states the characteristic-p proper finiteness or its semilinear lemma (searched for Tags 0A3L, 0A3P and the statement), so this roadmap owns that step.

Source independence: changed passages only; 3 passages compared with 2 sources (stacks03N1, milneLEC), none shared beyond a forced list of hypotheses; largest share stacks03N1, as in the previous review; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- huber1996, huber1994, sga4half, serreGC1997: settled as uncertified, no readable text; no changed passage adds a locator into them.

## Source issues

- none

## For the human reviewers

- none

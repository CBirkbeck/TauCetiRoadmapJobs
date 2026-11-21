# Review of ComplexCurveModuli (pull request #2548 at 7797601)

**Verdict:** accepted

**Summary.** Accepted: the six passages changed since the previous review (§§1.2, 2.0, 3.5, 4.3, 6.1, 6.2) were recomputed and each is correct; in particular the cutoff `2 arsinh(1)` of §6.2 must indeed be strict, as the square once-punctured torus shows, and the Check of §4.3 now agrees with Tau Ceti's Hardy graph theorem as it is stated at the pin. There is no finding. There are two small corrections, both to the pull request's description, which still describes §6.2 and §3.5 as they were, and one carried format note; none blocks. Nothing is left for the human reviewers to decide.

## C01 — The description still says the disjointness of §6.2 is stated "with lengths at most `2 arsinh(1)`, equality allowed"

The head states the opposite, so a reader of the description expects a statement that the README now shows to be false. In the body of §6.2 (README line 1334) the geodesics have "length less than `2 arsinh(1)`", and the Check (lines 1363–1367) gives the once-punctured torus with traces `(2√2, 2√2, 4)`, where two simple geodesics of length exactly `2 arsinh(1)` cross (recomputed: `8 + 8 + 16 = 32 = 2√2·2√2·4`, `sinh(arcosh √2) = 1`).

The bullet would be right as: "The disjointness of short geodesics in §6.2, which the old text asked to state 'with the strict/equality convention', is stated for lengths less than `2 arsinh(1)`; equality fails on a once-punctured torus, and the Check gives the example."

## C02 — The description's list of statements whose content changed omits the bootstrap of §3.5, and closes with "No other hypothesis or conclusion changed"

The README on main asks to "bootstrap any C¹ intertwining diffeomorphism to smoothness". The head (README lines 900–902) asks for class `W^(k+1,p)` when the two structures are of class `W^(k,p)`, and for smoothness only when both structures are smooth; the new Check (lines 918–922) shows that the old conclusion fails. This is a changed conclusion, so the closing sentence of that list is no longer true.

One more bullet would repair it, for example: "§3.5: the old text bootstrapped any C¹ intertwining diffeomorphism to smoothness; between structures of class `W^(k,p)` the conclusion is class `W^(k+1,p)`, and smoothness needs both structures smooth." The hypothesis of §6.1, "uniform branch radii" made precise as radii in a fixed interval `[c, C]` with `0 < c`, could be named in the same place.

## N01 — The description says the node-chart prototype "is kept unchanged", and its docstrings were reworded

Carried from the previous review; the sentence is unchanged. The declarations and statements of the prototype are the same as on main, but eight docstrings were rewritten. The sentence would be exact as "…is kept, with its statements unchanged and its docstrings reworded".

## Questions for the author

- The References cite Wendl's notes as "version 3.3", and §3.5 cites its §§4.2–4.3. The copy that can be read openly is arXiv:1011.1690v2, which is version 3.2. Does version 3.3 keep this numbering? Version 3.3 could not be read; citing version 3.2 would make the locator verifiable. (Carried; the citation is unchanged.)

## Previous findings

- The previous review raised no finding and no small correction. Its format note N01 is not repaired: the description still reads "The proved topological prototype of the node chart and its base change is kept unchanged" (written again above as N01).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.2 Check: automorphisms of the irreducible genus-one nodal curve, with and without the mark | Möbius maps preserving `{0, ∞}`; those also fixing 1 | preserving `{0, ∞}`: `λz`, `λ/z`; `(1/z)∘(λz)∘(1/z) = λ⁻¹z`; fixing 1: `z`, `1/z` | `ℂˣ ⋊ ℤ/2` unmarked, ℤ/2 marked; `n_v` = 2 and 3 | none |
| §2.0 Check: no ℂ-algebra map of `ℂ{z}` sends z to 1 + z | φ(z) = 1 + z; φ(z) = g with g(0) = c ≠ 0 | φ(1 − z) = −z, a non-unit image of a unit; φ(z − c) = g − c vanishes at 0 | every such map is local; consistent with the body's "local ℂ-ringed morphisms" | none |
| §3.5 bootstrap, and its new Check | flat torus, `φ(x, y) = (x + εh(x), y)`, `a = 1 + εh′` | `dφ⁻¹ j₀ dφ` = rows `(0, −1/a)`, `(a, 0)`; h in `C^(k+1)` gives entries in `C^k ⊂ W^(k,p)`, φ in `W^(k+1,p)`, not smooth | conclusion `W^(k+1,p)` right; "smooth" needs both structures smooth; the sentence on main was false | C02 (description) |
| §4.3 body and Check against `TauCeti.CircleSobolev.neckGraph` and `exists_analyticAt_hardyGraph` | Fourier modes of `F(x) + G(a/x)`; a = 0 | coefficient of `xⁿ`: `Fₙ + a⁻ⁿG₋ₙ = 0`; of `x⁻ⁿ`: `F₋ₙ + aⁿGₙ = 0`; `ξ η = a e^(F₀+G₀)`; a = 0: F, G have no negative modes, ξ starts at mode 1 | equals the definition at the pin (Neck.lean 367–369) and the theorem's data `(a, p, q)` (HardyGraph.lean 190–197) | none |
| §6.1 neck modulus with radii in `[c, C]` | fixed r; `r = |a|^(1/4)` | annulus `|a|/r < |x| < r`: `log(1/ρ_a) = −log|a| + 2 log r`; `r = |a|^(1/4)`: `|a| < |a|^(1/2)` holds, error `(1/2) log|a| → −∞` | `O(1)` needs r bounded above and away from 0 | none |
| §6.2 disjointness of simple closed geodesics shorter than `2 arsinh(1)` | once-punctured torus, traces `(2√2, 2√2, 4)`; two lengths below the cutoff | `x² + y² + z² = 32 = xyz`, so `tr[A, B] = −2`; `ℓ = 2 arcosh √2 = 1.76275 = 2 arsinh 1`; `sinh(ℓ/2) = 1`, product 1; below the cutoff product < 1 | collar bound is `≥ 1` with equality attained; strict cutoff required | C01 (description) |

The rows for the untouched statements stand as in the previous review, of `a105758`.

- Changed passages: six, all in the README (62 lines); `Suggested.lean` is unchanged, so no Lean statement, signature or padding probe changed. No layer, section, id or *Needs:* line was added, removed or renumbered.
- Seeded sample within the changed passages: §§1.2, 2.0, 3.5 and 6.2 fall in them; the diff adds or changes no source locator there. Source text opened: RobbinSalamon2006 lines 3347–3374 (Theorem 17.5 and its proof, printed page 79), Wendl lines 2214–2216 and 2395 (interior regularity `W^(k,p) → W^(k+1,p)`).
- Library declarations opened at the Tau Ceti pin: `TauCeti.CircleSobolev.neckGraph` (Analysis/Sobolev/Circle/Neck.lean:367), `TauCeti.CircleSobolev.exists_analyticAt_hardyGraph` (Analysis/Sobolev/Circle/HardyGraph.lean:190) with its module docstring (lines 13–45).
- Other text depending on the changes: no other line of the README or of `Suggested.lean` states the cutoff `2 arsinh(1)`, the neck radii or the bootstrap; no other roadmap, on main or open, cites the cutoff of §6.2.
- Description against the head: two sentences out of date (C01, C02) and one carried (N01); the rest stands as in the previous review, the folder's other text being unchanged.
- Dependency check output: `depcheck: 171 roadmaps, 1993 edges, 0 problem(s)`. No UPWARD or CYCLE line. The pull request changes nothing outside `TauCetiRoadmap/ComplexCurveModuli/`.
- Elaboration of `TauCetiRoadmap/ComplexCurveModuli/Suggested.lean`: seven `sorry` warnings (lines 70, 81, 100, 118, 152, 166, 186) and nothing else.
- Automatic checks: all passed; none set aside.

Overlap check: read AnalyticStableMaps, GromovWittenTheory and HeegaardFloer (main and open heads) and TeichmullerGeometry (main), as in the previous review; nothing shared, and the change touches no owned object. No open pull request changes this roadmap, no cited id is dropped and no id is dropped here that others cite.

Source independence: changed passages only; 6 passages compared with 2 sources (RobbinSalamon2006, Wendl), none shared beyond the formula `2 arsinh(1)`; largest share RobbinSalamon2006, 21 of 24 body locators, unchanged; no layer was added, removed or reordered, so the comparison of contents stands as in the previous review: independent. The corrigendum was not read.

Research link: Layers 3–6 are the analytic construction of the Deligne–Mumford orbifold of Robbin and Salamon (2006, corrigendum 2007), extended in §4.5 to all restricted families; AnalyticStableMaps and GromovWittenTheory build stable-map moduli and Gromov–Witten operations on it. Rests on the README's Downstream consumers and References and on RobbinSalamon2006 §§5–6, 17.

## Not verifiable

- Robbin–Salamon corrigendum (J. Eur. Math. Soc. 9 (2007), 901–905): behind a subscription, recorded as uncertified; not read, so whether it corrects the cutoff in the proof of Theorem 17.5 is not known.
- Wendl, version 3.3: not read; version 3.2 (arXiv v2) was read (see the question above).
- That the geodesics of the generators A and B of a once-punctured torus group are simple and cross once is the standard fact; it was not recomputed from matrices, only the trace identity and the lengths were.

## Source issues

- **Error** in RobbinSalamon2006 at the proof of Theorem 17.5, printed page 79 of the arXiv version: the source says geodesics of length at most 2 arsinh(1) are pairwise disjoint; it should be length less than 2 arsinh(1), since on the square once-punctured torus two simple geodesics of exactly that length cross; affects the proof.

## For the human reviewers

- none

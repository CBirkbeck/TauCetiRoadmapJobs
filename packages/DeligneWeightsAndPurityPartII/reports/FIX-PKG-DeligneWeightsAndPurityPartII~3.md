# FIX-PKG-DeligneWeightsAndPurityPartII~3

## F01 (P1) — applied

The finding is correct. The uniform annular route (ITO20 Theorem 1.4 via Theorem 6.10, ITO20 line 1586) relies on the following inputs:

- Corollary 3.17 / Theorem 2.7 (ITO20 lines 803, 359): one alteration works for all n, with unipotence.
- Huber's compact-support stalk comparison, Theorem 5.3 (line 1198).
- Overconvergence, Proposition 5.5 (line 1299).
- Propositions 6.6–6.7 (lines 1481, 1502).
- The annular Theorems 6.2–6.3 (lines 1427, 1439).
- Huber's Lemma 2.7.11 (line 1662).

The cited suppliers did not provide these. ClassicalAdicEtaleCohomology does supply the following: the general-base nearby-cycle topos with its stalk formula; `PlurinodalAlteration.exists` (= ITO20 Theorem 3.3); the per-sheaf Orgogozo modification (§5.4); overconvergence (§3.2); Huber's smooth constructibility (§10.5); and tame Galois covers of annuli with `annulusKummer` (§10.3). It does not supply the n-uniform unipotent alteration, Proposition 3.1 (Orgogozo nodal propagation), the wild/any-characteristic annular decomposition or Huber 5.7.8. I searched main, the open heads and the board packages for "sliced nearby", "locally unipotent", "Orgogozo", "Riemann existence", "punctured disc", "tame at every" and "Theorem 5.7.8". There is no other owner.

What changed (§3.4) is four new targets placed before the uniform annular target, each with prose, Checks, locators and *Needs*:

- **Sliced nearby cycles, base-change compatibility, unipotence.** Notation for the §5.4 shred, with a four-fact API.
- **Coefficient-uniform alteration.** Corollary 3.17, with Proposition 3.1 owned.
- **Adapted constant coefficients.** Definition 6.5 and Propositions 6.6, 6.7, 5.5.
- **Annular covers and tame trivialization.** Theorems 6.2–6.3 and Lemma 2.7.11.

Huber 5.7.8 is declared as gap:huber-compact-support-nearby-cycles, supplied by ClassicalAdicEtaleCohomology §§4.5, 5.2, 8.3–8.4. It appears both in README "Exact supplier contracts" and in the plan.json `gaps` list.

The uniform annular *Needs* now lists the new targets, the gap and CAEC §§3.2, 10.5. It also has an explicit route sentence. The finding's repair tests are now Checks:

- the identity family;
- the quantifier swap, where per-n alterations of unbounded degree do not give a uniform one;
- the characteristic-2 cover u²−u=T⁻¹. Under w=1/u this is T=w²/(1−w), so its preimage of B(a,b) is the single annulus B(a^½,b^½), which is not a Kummer covering. For odd m, g²−g=S^(−m) forces g_(−2^j m)=1 for all j, so g diverges and the pulled-back cover never splits. This shows the tameness hypothesis is necessary.

**Pattern.** I updated every other place that described the uniform route: Scope and ownership, the CAEC and EtaleCohomologyFoundations (§G.2) contracts, How to read the build, the Layer 3 Dependencies, the Suggested.lean docstring (one phrase), and the ITO20/HUB96 locators in sources.toml.

## F02 (P3) — applied

The finding is correct. SchemeAndStackFoundations §4.16 (main, line 6038) is the alteration calculus; the existence theorem is §4.19 `alteration_theorem` (line 6372). Changes:

- Uniform reduction: added "the alteration is §4.19, applied over K (char 0) or over the perfect field K(T^(1/p^∞)), where a regular output is smooth. It is descended to K(T^(1/p^N)) by §0.9 and extended by a proper model; the extension and the model are retained" (ITO20 line 1950).
- *Needs*: added §4.19.
- Layer 3 Dependencies: added §4.19, with §4.16 kept for the calculus.
- Layer 4 already cited §4.19.

## Adversarial pass (new and changed statements)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Sliced RΨ, f=id | any n | stalk RΓ(U(η̄),ℤ/n)=ℤ/n, trivial action, base change = id | both properties hold | Check |
| Unipotence, t²=π, p≠2 | n odd >1; n=2^k | (σ−1)^k=(−2)^(k−1)(σ−1)≠0 mod odd n; =0 for 2-power n eventually | n-dependent before alteration | Check |
| Base-change stability | S′=V[π^½] | branches t=±ϖ; #geometric points over η̄ = 2 iff ϖ(η)≠0, preserved by local q | holds for all n | API bullet + Check |
| Uniform alteration | t²=π; X=∅; n=1 | one degree-2 alteration for every n prime to p; zero complexes | passes | Checks |
| Locally unipotent | pushforward along V[π^½]→V | swap on (ℤ/n)² over Spec K | holds iff n is a 2-power | Check |
| Adapted, f=id | Y=Spec O[T] | R⁰=ℤ/n constant | tame, overconvergent | Check |
| Adapted, T=S³, n=2, residue char ∉{2,3} | π=id vs π=f | 3-cycle on F₂³ not unipotent; X×_YZ = 3 branches, trivial action; rank 3 off 0, rank 1 at 0 | π=id fails, π=f adapted | Check (corrected "constant" to "on the punctured disc") |
| Adapted, AS model | O[u] vs O[w,(1−w)⁻¹] | |u|≤1 forces |T|=1; w-model: both roots of w²+Tw−T have |w|=|T|^½, |1−w|=1 | w-model needed | Check |
| Theorem 6.2 | id; T↦Tᵐ; AS char 2 | 1 component; B(a^(1/m),b^(1/m)); |T|=|w|², dT/dw=w²/(1−w)²≠0, degree 2 | decomposition holds, Kummer refinement fails in char 2 | Checks |
| Theorem 6.3 | AS, odd m; Kummer direct image | g_(−2^j m)=1 for all j, divergent; μ_m inertia of invertible order | tameness necessary | Check |
| Unipotent ⇒ tame | finite unipotent image on finite ℤ/n-module | order a product of primes dividing n, all invertible in O | consistent with ITO20 line 1542 | prose |
| §3.4 char-2 parameter (F02) | f=T², ε=|t|² | T(V(T),|t|²)={|T|≤|t|²}=T(V(T²),|t|⁴) | unchanged | none |

## Checks run

- `lake env lean packages/DeligneWeightsAndPurityPartII/Suggested.lean`: exit 0, only `declaration uses 'sorry'` at line 52:8.
- `#check @TauCetiRoadmap.DeligneWeightsAndPurityPartII.duality_splitting` in a scratch copy: the elaborated type keeps all four `FiniteDimensional` instances, both `IsPerfPair`, `c ≠ 0`, the pairing identity, the four representations, both intertwinings and the χ law. It matches README §4.4. Nothing changed in the Lean statement; only the docstring changed.
- depcheck output: `depcheck: 56 roadmaps, 644 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve`: no cross-roadmap citations or Lean names found nowhere.
- sources.toml and plan.json parse.

## Gate failures repaired

- tex=3: three TeX-style subscripts `_{…}` stood outside code spans in README §3.3. In the sliced-nearby-cycles definition, `j : X_{U(etabar)} → X_U` and `i : X_u → X_U` are now code spans. In the base-change stability bullet and in the coefficient-uniform alteration statement, `f_{S′}` is now a code span. The mathematics is unchanged. A scan of the README for `_{`, `^{` or a backslash command outside code spans now finds nothing.

## Notes for the maintainer

- New supplier gap for ClassicalAdicEtaleCohomology: huber-compact-support-nearby-cycles (§§4.5, 5.2, 8.3–8.4).
- Ownership: the coefficient-uniform alteration, Orgogozo's nodal propagation, adapted coefficients and the any-characteristic annular theorems are owned here, because no roadmap on main, at the indexed open heads or in the board packages states them. The fifteen board-package heads that the previous review could not read (HTTP 404) were not checked again.
- Ramero's discriminant function, Lütkebohmert and Huber's Lemma 2.7.11 / Theorem 5.7.8 are cited through ITO20's recollections. HUB96 remains uncertified, now with Lemma 2.7.11 and Theorem 5.7.8 added to its locator.
- No Lean names changed. No new sources were fetched.

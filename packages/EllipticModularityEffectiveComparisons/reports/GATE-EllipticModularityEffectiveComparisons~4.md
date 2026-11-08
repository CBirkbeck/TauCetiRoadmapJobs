# GATE-EllipticModularityEffectiveComparisons~4: answers to the human review of `951c22c`

The review (CBirkbeck, 2026-11-07T17:01:22Z) makes three distinct points:
- F01, the duplication of EllipticCurveModularityPartII (H01);
- F02, the contract's credit of pointed-pair functoriality as functoriality for all maps of pairs (H02);
- the "Source issues" note on bilu-parent-rebolledo line 768, together with its claim that the README already repairs it (H03).

Its "Previous findings" list restates F01 (as R01) and F02 (as the new R02), so it adds no further point. The review contains no instruction addressed to the worker beyond its findings.

One commit: `3e1809c` "EllipticModularityEffectiveComparisons: review repairs (generalized Jacobian contract: pointed-pair functoriality, Abel map; w_p action via divisors)". It touches `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md` only, with 5 insertions and 4 deletions. `Suggested.lean` is byte-identical to `951c22c`.

## H01 (CBirkbeck) — answered

The duplication holds at the current heads and cannot be repaired inside this folder.
- EllipticCurveModularityPartII (head `51b297d`) README line 7 reads "this Part II owns the six comparison layers below".
- The merge order lists EllipticCurveModularityPartII at line 194, ErdosProgressionPowers at 195 and this folder at 278.
- ErdosProgressionPowers (head `8916ae8`) README line 76 reads "owned by EllipticCurveModularityPartII Layers 1–6; the contract EC.0–EC.5".

Re-checked at those heads:
- **Same headlines.** The sibling's `Suggested.lean` states the same headline set under other names:
  - `dimension_comparison`/`martin_bound` for `martin_dimension_formula`/`martin_sharp_bound`;
  - `prime_isogeny_degrees`/`cyclic_isogeny_degrees` for `prime_cyclic_isogeny_degrees`/`rational_cyclic_isogeny_degrees`;
  - `full_two_irreducible`/`rational_two_irreducible` for the two `…_uniform_irreducibility` theorems;
  - `lemos_surjectivity` for `lemos_uniform_surjectivity`.
- **Consumers.** Four open roadmaps cite the sibling as supplier:
  - ErdosProgressionPowers, lines 76, 623, 973 and 1142–1389;
  - AdelicImagesAndModularCurves, line 343;
  - EllipticCurvePeriodsAndModularParametrizations, lines 92, 299, 1838, 1888 and 1892;
  - FaltingsFinitenessAndIsogenyTheoremsPartII, lines 13, 132 and 364.
- **No roadmap cites this folder as supplier.** A search over main and the 467 open heads finds this folder's name only in prose lists: ModularSymbolsPadicLFunctions line 2695, FaltingsFinitenessAndIsogenyTheorems line 2928 and EllipticCurveModularityPartII line 1058.

The only in-folder repair the planning rules allow is to import Layers 0–5 by section. That would leave this folder with no target, so the choice remains the review's: close this roadmap, or close the sibling and re-point its four consumers.

`README.md` line 1696 (Downstream consumers) is unchanged. It is accurate while both pull requests are open, and it is rewritten together with the consumers if this folder is kept.

## H02 (CBirkbeck) — applied

The supplier states only pointed-pair functoriality: AnabelianGeometryAndNonabelianChabauty (head `227f000`) README line 4006 reads "functoriality for maps of pointed pairs and extension of the ground field". The contract and §5.4a now match it.

`README.md` line 86 (supplier contract):
- Old: "functoriality for maps of pairs and extension of the ground field … The Hecke correspondences are not maps of pairs, so their action is a target of §5.4a."
- New: "functoriality for maps of pointed pairs, extension of the ground field, and, for a specified point b of C−D over k, the pointed Abel map `a_b:C−D→J_D` …". It also says that §5.4a uses the Abel map over K with b=x₁. It adds that T_n are not maps of curves and that w_p is not a map of pointed pairs over ℚ in general. The actions of T_n and w_p are therefore targets proved from the divisor description.

`README.md` line 1298 (§5.4a):
- Old: "w_p exchanges the two cusps, so it is an automorphism of the pair (X₀(p),D) and acts on J₀(p)♯".
- New: "w_p exchanges the two cusps; prove that, as for T_n, it carries divisors prime to D to divisors prime to D and functions equal to 1 along D to such functions, so that it acts on J₀(p)♯ compatibly with its action on J₀(p)".

The review's p=17 witness does not separate the two readings. w₁₇ exchanges the two noncuspidal rational points of X₀(17), so it is a map of pointed pairs (X₀(17),D,b)→(X₀(17),D,w₁₇b) between two different pointed pairs. The decisive instance is p=23:
- X₀(23)(ℚ) consists of the two cusps, because §4.7 (Mazur) excludes a rational cyclic 23-isogeny;
- so no pointed pair (X₀(23),D,b) exists over ℚ.

This instance is now the negative-control Check at `README.md` line 1313.

Searching for the same pattern:
- `grep` for "maps of pairs", "of the pair", "functorial" and "automorphism of the" finds nothing else in the README.
- §5.4a's φ_P (line 1304, Q↦[(Q)−(x₁)]) needs the pointed Abel map. The old contract did not name it, so it is now named in the contract (line 86), in Scope and ownership (line 9: "its base change and its pointed Abel map") and in the §5.4a *Needs:* line (line 1322).
- The Abel map's hypothesis b∈(C−D)(K) holds: x₁=π_p(w_(p²)x) with x∈Y₀(p²)(K), and both maps preserve the noncuspidal locus.

## H03 (CBirkbeck) — answered

No edit is needed: `README.md` §5.4a already avoids the source's O_K-level finiteness claim (bilu-parent-rebolledo line 768).
- **Descent to ℚ.** Line 1304 descends z to J♯_e(ℚ) and proves finiteness of G⁰(ℤ), an extension of a subgroup of (J₀(p)/I♯_e J₀(p))(ℚ) by 𝔾_m(ℤ)={±1}. It then states: "The group of sections of the identity component over O_K itself is infinite when K is real quadratic, since the toric part contributes O_K^×; the descent to ℚ replaces that general assertion."
- **Check.** Line 1320 pins this: the argument uses only z̄=−w_p z and 𝔾_m(ℤ)={±1}, whatever the signature of K.
- **Instance.** p=17, K=ℚ(√2): (2/17)=1 since 17≡1 mod 8, so 17 splits in K. Here 1+√2∈O_K^× has infinite order, while 𝔾_m(ℤ) has 2 elements.

## Build, gate and dependency check

- `lake build TauCetiRoadmap.EllipticModularityEffectiveComparisons.Suggested`: "Build completed successfully (9205 jobs)". The only warnings are the 14 "declaration uses `sorry`", at lines 79, 84, 93, 104, 118, 135, 182, 188, 194, 201, 238, 246, 256 and 265.
- Gate at `3e1809c` (exit 0): `gate EllipticModularityEffectiveComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- `--depcheck --movable` (exit 0): `depcheck: 239 roadmaps, 2427 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. No supplier edge was added: the AnabelianGeometryAndNonabelianChabauty edge (line 278 → 172) already existed.
- `roadmaps resolve` on `README.md`: no cross-roadmap citation and no Lean name found nowhere.

## Lean signatures

`Suggested.lean` is unchanged (`git diff 951c22c HEAD` on it is empty). The worker's elaborated `signatures.md` lists 24 declarations, 0 with a dropped section binder. The file has no `variable`, `include` or `set_option` line, so no section binder can be dropped. No `#check @name` scratch file was elaborated, because no Lean statement changed.

## Ownership, citations and sources

- No construction was added; the change narrows an import to what the supplier states. The supplier text was read at its open head (AnabelianGeometryAndNonabelianChabauty, `227f000`, merge order 172):
  - "Generalized Jacobian of a reduced boundary", README line 4004, with functoriality and the pointed Abel map at line 4006;
  - its Check "(ℙ¹,{0,∞}) ↦ 𝔾_m, Abel map with b=1 is z↦z".
- No notion moved down, and no later roadmap is cited.
- No source was added and `needs-references.toml` was not written. The source passage of H03 was re-read at bilu-parent-rebolledo lines 757–771.

## Adversarial pass

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Contract line 86: supplier functoriality is for maps of pointed pairs | p=23; p=17 | p=23: §4.7's prime list {2,3,5,7,11,13,17,19,37,43,67,163} omits 23, so Y₀(23)(ℚ)=∅ and no pointed pair (X₀(23),D,b) exists over ℚ. p=17: X₀(17)(ℚ) has 4 points, 2 cusps and 2 noncuspidal points that w₁₇ exchanges, so w₁₇:(X₀(17),D,b)→(X₀(17),D,w₁₇b) is pointed | old wording false at p=23 | contract repaired |
| §5.4a: w_p acts on J₀(p)♯ through divisors | f with f(0)=2, f(∞)=1; f≡1 on D; a divisor prime to D | (f∘w_p)(0)=f(∞)=1 and (f∘w_p)(∞)=f(0)=2, so the coordinate 2 goes to 1/2 (inversion). For f≡1 on D, (f∘w_p)(0)=(f∘w_p)(∞)=1. w_p({0,∞})={∞,0}, so the support stays off D | holds without a base point | sentence repaired |
| w_p=−T_p on the torus (unchanged claim, rechecked after the edit) | p=23 | T₂₃(0)=(0)+22(∞), T₂₃(∞)=23(∞): exponent 1−0=1. w₂₃: exponent −1=−(1) | holds | none |
| New Check line 1313: genus and dimension at p=23 | ν₂, ν₃, cusps | 23≡3 mod 4 gives ν₂=1+(−1/23)=0. 23≡2 mod 3 gives ν₃=1+(−3/23)=0. g=1+24/12−0−0−2/2=2, and dim J₀(23)♯=g+deg D−1=2+2−1=3 | holds | Check added |
| Contract and *Needs:*: pointed Abel map over K with b=x₁ | x∈Y₀(p²)(K), [K:ℚ]=2; K=ℚ | x₁=π_p(w_(p²)x)∈Y₀(p)(K), since both maps preserve the noncuspidal locus, so b∈(C−D)(K) as the supplier requires. a_(x₁)(Q)=[(Q)−(x₁)] is φ_P before the winding quotient. K=ℚ would make x rational, which §4.17 excludes for p²>27 | hypothesis met | Abel map named |
| "Hecke correspondences are not maps of curves" | T₂ at p=23 | T₂ sends a point to 3 points: it is a correspondence of degree 3, not a morphism | holds | wording |
| Line 1304 (H03): O_K-sections of G⁰ are not all torsion | p=17, K=ℚ(√2) | 17≡1 mod 8 gives (2/17)=1, so 17 splits in K. 1+√2∈O_K^× has infinite order, against 𝔾_m(ℤ)={±1} of order 2 | README already descends to ℚ | none |
| Line 1696 (H01) | merge order 194/195/278; ErdosProgressionPowers line 76; sibling line 7 | all name EllipticCurveModularityPartII as owner | accurate while both pull requests are open | none |

No passage in the review or in the files read was suspicious.

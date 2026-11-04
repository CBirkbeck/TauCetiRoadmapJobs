# ArithmeticKTheory human-review response

## H01 (CBirkbeck) — applied

“One finite place above ℓ” is replaced by singleton **total inverted support**, T_ℓ=S∪{v:v|ℓ}, with the full odd-primary Brauer kernel and Kummer exact sequence at `TauCetiRoadmap/ArithmeticKTheory/README.md:92` and `TauCetiRoadmap/ArithmeticKTheory/README.md:329` (kbook line 31287; ArithmeticGaloisDuality R02.3/R02.4.4). The Checks compute H²_et(ℤ[1/3],μ₃)=0, H²_et(ℤ[1/6],μ₃)=ℤ/3 and Br(ℤ[1/6])[9]=ℤ/9, reject the difference-map convention, and retain the real dyadic counterexample at `TauCetiRoadmap/ArithmeticKTheory/README.md:345`; the later cyclotomic specializations already invert exactly the primes above ℓ.

## H02 (CBirkbeck) — applied

Unsigned localization–Bockstein commutation is replaced by B_(n−1)δ_(U,n)=−δ_(Z,n−1)B_(m,n), with explicit degrees, the mixed-product sign, commuting reduction/naturality squares, and the adapter ∂_n=(−1)^(n−1)B_n and its signed right-module law at `TauCetiRoadmap/ArithmeticKTheory/README.md:652`. The new Check at `TauCetiRoadmap/ArithmeticKTheory/README.md:686` computes δB₅x=3 and Bδx=4=3⁻¹ in 𝔽₁₁×, while ∂₂δx=δ∂₃x=3; this agrees with GeneralAlgebraicKTheory §8.13 and KTheoryFiniteLocalFields §2.2 without requiring a product of two coefficient classes.

## H03 (CBirkbeck) — applied differently

The inherited AlgebraicKTheory A2/A4/A5 prerequisite is explicit at `TauCetiRoadmap/ArithmeticKTheory/README.md:398`; the existing HomotopySpheres Stage 9, item 2 contract correctly supplies π₄^S=0. For the worker’s dependency declaration, select HomotopySpheres #1287 at 0b90c9b as the canonical supplier, recognize #284 at fb7c47e as an overlapping predecessor with the same cited target, and include AlgebraicKTheory #1142 at e5df75b before KTheoryFiniteLocalFields #1281 and both required suppliers before ArithmeticKTheory; the PR description itself is outside the authorized edits.

## H04 (CBirkbeck) — applied

The two §6.11 references are replaced by GeometryOfNumbersAndQuadraticArithmetic §6.4.2 (`ExactW0`) for the metabolic quotient and §6.10a for integral signature normalization at `TauCetiRoadmap/ArithmeticKTheory/README.md:373` and `TauCetiRoadmap/ArithmeticKTheory/README.md:1294`. The general number-ring real-signature map and finite-kernel/full-rank theorem remain targets of this roadmap’s §3.5; no second Witt carrier or supplier-owned signature theorem is introduced.

## H05 (CBirkbeck) — applied

The order-three differential now explicitly uses the independent Lee–Szczarba input H₃(K(ℤ);ℤ)≃ℤ/2, in ordinary **spectrum** homology, before determining the differential at `TauCetiRoadmap/ArithmeticKTheory/README.md:3688` (published rognes-k4 line 339, immediately after (8.4), p. 280). The Check computes its localization to zero and the contradictory degree-three cokernel ℤ/3 for a zero differential, the dependency lines retain that input, and `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean:17` identifies the missing K-spectrum carrier rather than introducing a stand-in.

## Evidence, ownership and dependency declaration

H01–H04 are the four numbered findings; H05 is the additional Lee–Szczarba observation. The remaining “checked and found sound” remarks contain no requested correction or unanswered question.

Main was checked at eafdde47e47e067afa9c64faddc70703a69c7c56. The indexed open-head and board-package object searches, including the supplied sibling checkouts, locate the generic Brauer calculation in ArithmeticGaloisDuality, the symmetric Witt quotient in GeometryOfNumbersAndQuadraticArithmetic, and the raw/adapted boundary comparison in GeneralAlgebraicKTheory and KTheoryFiniteLocalFields. The independent ordinary homology calculation of K(ℤ) belongs to this roadmap’s arithmetic rank-filtration argument; the board package already mentions the same H₃ value, and no different owner of that arithmetic input was found. No construction moves from a later supplier, no cycle is introduced, and no Lean declaration or fully qualified name is added.

The following facts correct the dependency-description claims for the worker without changing pull-request text:

| Supplier | Verified contract and ordering consequence |
| --- | --- |
| HomotopySpheres #1287, @kim-em, 0b90c9b | Stage 9, item 2 explicitly proves π₄^S=0; choose this head for the cited contract and place it before ArithmeticKTheory. |
| HomotopySpheres #284, @Paul-Lez, fb7c47e | Stage 9, item 2 contains the same fourth/fifth-stem target; it is an overlapping version, not a second independent fourth-stem prerequisite. This report does not decide which proposal humans merge. |
| AlgebraicKTheory #1142, @kim-em, e5df75b | A2/A4 supplies field determinant and commutative semilocal K₁; A5 supplies Matsumoto and finite-field K₂=0. It precedes the consuming local-field roadmap. |
| KTheoryFiniteLocalFields #1281, @CBirkbeck, afe02e8 | Its foundational supplier contract explicitly consumes those A2/A4/A5 results, hence #1142 is a transitive prerequisite of ArithmeticKTheory. |
| Main | Neither HomotopySpheres nor AlgebraicKTheory is present under `TauCetiRoadmap/` at eafdde4; both selected suppliers are other authors’ new roadmap proposals. The assertion that no other author’s open proposal is needed is false. |

ArithmeticGaloisDuality was read at 09ad340, GeometryOfNumbersAndQuadraticArithmetic at 465728d, GeneralAlgebraicKTheory at e0552fe, and StableHomotopyKTheory at 00bfbf7. Their relevant contracts respectively retain full support, define the metabolic quotient and integral normalizations, fix the raw right-module boundary, and fix coefficient triangles and their reduction maps. The citation resolver reports no missing cross-roadmap citation or Lean name; its automatic omission of pinned-library checks was supplemented by reading the actual pinned sources. The initially flagged `VanishingCycles.etaleTateTwists` is a planned supplier target at EtaleCohomologyFoundations F.0.3, `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:233`, not a claim of a pinned declaration.

| Source locator | Evidence used |
| --- | --- |
| kbook line 31287, (VI.8.1.1), p. 513 | All inverted finite places contribute local invariants; real places contribute only 2-torsion. |
| kbook line 31353, Example VI.8.3.1, p. 514 | The Picard contribution and the support-size-minus-one term must both be retained. |
| kbook line 16320 and line 16341, IV.2.5/IV.2.5.2, p. 280 | The ordinary coefficient boundary surjects onto m-torsion, providing the Bott lift of ζ₅ used in the Check. |
| kbook line 16551, Exercise IV.2.5, p. 284 | The integral/coefficient pairing is available independently of a coefficient-ring multiplication; the suspension swap gives its degree sign. |
| published rognes-k4 line 330, (8.4), p. 280 | The rank-four Steinberg input eliminates other potential degree-four contributions. |
| published rognes-k4 line 339, immediately after (8.4), p. 280 | The independent ordinary third spectrum homology forces the differential between the two order-three entries. |
| published rognes-k4 line 342 and line 347, Theorems 8.5–8.6, p. 280 | The spectrum homology and fourth-stem vanishing supply the odd-primary K₄ conclusion. |

The published author-hosted Rognes version was read under the existing key rognes-k4; its numbering differs from the 1993 manuscript in the package manifest. Updated version metadata is staged in scratch as `sources.toml` for the worker, preserving that key and all other entries; the package manifest is outside the two permitted repository edits. No additional cited work or second source key was added, no source passage was copied, and no reference request remains outstanding. Lee–Szczarba is used exactly as reported in the published Rognes argument, without claiming an independent reading of that separate paper.

## Computed adversarial pass

Each row records an added or changed mathematical claim, its defining conventions or a dependent interface, including all four retained Lean declarations. The computations test the repaired statements; the source and supplier locators above supply the deep inputs. Unchanged arithmetic tables, the Gaussian/golden presentation data and unrelated layers were searched for the repaired patterns, not represented as newly recomputed in full.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Full coefficient support and ring identification | F=ℚ, ℓ=3, S=∅ or {2} | T₃={3} or {2,3}; O[1/3]=ℤ[1/3] or ℤ[1/6] | Previously inverted 2 survives | Define T_ℓ in Conventions |
| No double counting in support | ℓ=3, S={3} | {3}∪{3}={3}, cardinality 1 | One local coordinate | Use a union of sets |
| Brauer invariant coordinates | ℓ^r=3,9 | 1/3↔1 mod 3 and 1/9↔1 mod 9; orders 3 and 9 | Normalization preserves order | Specify a/ℓ^r↔a |
| Full Brauer kernel | 1 or 2 coordinates mod 3; 2 mod 9; 3 mod 5 | Kernel orders 1,3,9,25, equal to (ℓ^r)^(number of places−1) | Matches invariant-sum formula | Retain all support coordinates |
| Sign in invariant sum | T₃={2,3} | (1/3,−1/3) has sum 0; (1/3,1/3) has sum 2/3≠0 | Difference map rejected | Add negative-control Check |
| Kummer exact sequence | ℤ[1/3], ℤ[1/6], m=3 | Pic/3=0 in both cases; H² has order 1 or 3, equal to the Brauer-kernel order | Picard alone fails in second case | Keep the Brauer quotient |
| Singleton-support vanishing | ℓ=3, r=1, T={3} | Sum map is id on ℤ/3, kernel 0, H²=0 | Valid singleton case | Correct the vanishing hypothesis |
| Higher coefficient exponent | ℓ=3, r=2, T={2,3} | (1/9,−1/9) has order 9; kernel order 9 | Exponent retained | Add r=2 Check |
| Real dyadic exclusion | ℚ, ℓ=2, finite T={2} | Finite and real invariants 1/2+1/2=0 mod ℤ; nonzero class has order 2 | Odd-prime hypothesis necessary | Add real-place negative control |
| Cyclotomic vanishing uses exact support | ℚ(ζ₃), S exactly above 3 | One inverted finite place; support term has rank 1−1=0 | Existing special case remains valid | No narrowing of later theorems |
| Inherited field K₁ comparison | 𝔽₂ and 𝔽₁₁ | Unit group orders 1 and 10; determinants of 1 and 3 are 1 and 3 | Same low-degree carrier | Name AlgebraicKTheory A2/A4 |
| Inherited finite-field K₂ | 𝔽₂ and 𝔽₁₁ | K₂=0 for each; no extra residue-even term | Consistent with supplied finite-field theorem | Name AlgebraicKTheory A5 |
| Coefficient localization triangle | Identity localization, m=3 | Support spectrum 0; remaining map id; both boundary composites 0 | Exact trivial triangle | Preserve all-modulus construction |
| Raw boundary normalization | ℤ_(5), π=5, unit 2 | B₁[5]=1; B₂{5,2}=2, B₂{2,5}=3=2⁻¹ mod 5 | Right-linear convention | Retain raw B |
| Raw right-module boundary | x=[π], y=2 and y=b of degree 2 | B([π]·2)=2; B([π]·b)=b̄ | No degree sign on the right | Preserve product convention |
| Degree-zero naturality and coefficient reduction | Identity map; coefficients ℤ/4→ℤ/2 | Classes 0↦0, 1↦1; boundary of red[π] is 1 mod 2 on both routes | Squares commute | Distinguish these from connecting maps |
| Bockstein domains and degree shift | n=2 and 3 | U degree n goes to n−1; both composites land in support degree 0 or 1 | Same source and target on both sides | State every boundary degree |
| Two connecting maps anticommute | m=5, n=3, residue 𝔽₁₁ | B₂δx=4; δB₅x=3 and −3=3⁻¹=4 in multiplicative notation | Signed equality, unsigned inequality | Replace unsigned claim |
| Suspension-coordinate interchange | Two degree-one suspension coordinates | Koszul sign (−1)^(1·1)=−1 | Explains the minus sign | Retain suspension sign |
| Mixed Bockstein law | Integral degrees j=0,1,2,3 | Signs 1,−1,1,−1; for j=1, δ([π]b)=−[π]ζ₅ | Correct degree dependence | State δ(a·b)=(−1)^j a·δb |
| Adapter commutes with Bockstein | n=2,3,4,5 | −(−1)^(n−2) and (−1)^(n−1) both give −1,1,−1,1 | Signed raw law gives unsigned adapted law | State exact adapter |
| Adapter changes right-module law | Right factor degree 0,1,2 | Signs 1,−1,1; for degree-one unit 2, ∂₂{π,2}=3 instead of raw value 2 | Degree factor cannot be omitted | State (−1)^degree(y) |
| Arithmetic residue witness exists | ζ₅↦3 mod 11 | Φ₅(3)=121≡0; powers of 3 are 3,9,5,4,1 | Residue root has exact order 5 | Add number-ring witness |
| Ordinary coefficient lift | m=5, K₁(R) class ζ₅ | ζ₅⁵=1, so coefficient boundary has ζ₅ in its 5-torsion target | A Bott lift b exists | Use coefficient exactness, not an invented lift |
| Adapted numerical witness | Same x=[π]res(b), n=3 | ∂₂δx=4⁻¹=3; δ∂₃x=3 | Commuting adapted square | Cross-check with local-field supplier |
| Unsafe moduli do not require a ring | m=2 or 3; residue order-two class −1 | (−1)⁻¹=−1; mixed integral/coefficient pairing still defined | Mod 2 cannot distinguish signs; mod 3 needs no associative product | Add the order-two limitation |
| Coefficient transition convention | p=2,r=1 | Quotient 1 mod 4↦1 mod 2; torsion transition multiplies by 2 | Different outer maps retained | Existing reduction Check remains consistent |
| Metabolic quotient and signature | ⟨1⟩,⟨−1⟩,diag(1,−1) over ℤ | Signatures 1,−1,0; Witt class of metabolic sum 0 | Correct quotient carrier | Cite ExactW0 §6.4.2 |
| Integral symmetric versus quadratic normalization | Positive E₈ | Ordinary signature 8; quadratic normalized signature 1 | Multiplication by 8 retained | Cite §6.10a |
| General number-ring signature rank | Golden units 1,ε; Gaussian field | Golden vectors (1,1),(1,−1) have determinant −2 and rank 2; Gaussian target ℤ⁰=0 | Does not assert surjectivity onto ℤ² | Keep general theorem in §3.5 |
| Fourth stable stem supplier | Stage 9, item 2 in both HomotopySpheres versions | π₄^S=0 in each; odd localization remains 0 | One shared input suffices | Select canonical supplier in report |
| Independent ordinary spectrum H₃ | K(ℤ), integral and 2 inverted | Integral ℤ/2; (ℤ/2)⊗ℤ[1/2]=0 | Required input precedes differential | Name integerSpectrumThirdHomology |
| Rank differential must be nonzero | Multiplication 0,1,2 on ℤ/3 | Kernel/cokernel orders (3,3),(1,1),(1,1) | Independent H₃=0 excludes multiplier 0 | State why d₁ is bijective |
| Low odd spectrum homology after differential | Total degrees 0 through 4 | H₀=ℤ[1/2]; H₁,H₂,H₃,H₄=0 after killing the two ℤ/3 terms | Matches published theorem | Preserve actual differential maps |
| K₄ primary assembly | ℤ, s=1,u=0; compare ℤ[1/2] | Odd K₄=0; dyadic 2-rank 1+0−1=0; K₄(ℤ[1/2])=ℤ/3 | Integral vanishing does not extend to every localization | Retain separate dyadic argument |
| Lean sUnitSubmonoid definition | R=ℤ, S=∅ or {(2)}; field R=ℚ | Allowed ±1 in first case; 2 and 1 allowed, 3 and 0 excluded in second; over ℚ all nonzero elements allowed | Native unit preimage has correct support | No definition change |
| Lean localization iff, both directions | R=ℤ,S={(2)}, M=⟨2⟩, {1}, ⟨6⟩ | ⟨2⟩ meets (2) and consists of allowed units, yielding ℤ[1/2]; {1} misses (2), yielding ℤ; ⟨6⟩ meets (2) but 6 is not a unit in ℤ[1/2], yielding larger ℤ[1/6] | Both conjuncts necessary | No theorem change |
| Lean localization iff, field/zero denominator | R=ℚ,S=∅; M={1} or containing 0 | First localization ℚ, RHS true; second localization zero ring, 0 fails unit test, RHS false | Both directions and junk denominator agree | No theorem change |
| Lean torsion class-group localization | ℤ; ℤ[√−5] with 𝔭=(2,1+√−5) | Class order 1 or 2; 𝔭²=(2), norms 4=4, so denominator 2 works although 𝔭 is nonprincipal | Torsion is sufficient without principality | No theorem change |
| Arbitrary S in retained Lean theorems | S=∅ or all primes of ℤ | Candidate monoid {±1} or ℤ∖{0}; rings ℤ or ℚ | No finite-S hypothesis may disappear | Signatures retain arbitrary S |
| Zero-ring exclusion in retained definitions | 0=1 in zero ring | IsDomain requires 0≠1, whereas zero ring gives 0=1 | Not an admitted instance | Native IsDedekindDomain hypothesis retained |
| Lean all-index divided Bernoulli | (p,k)=(3,1),(3,3),(5,2),(5,5),(7,7) | B_(2k)/k=1/6,1/126,−1/60,1/66,1/6; numerator residues 1,1,4,1,1 | Includes k divisible by p | No theorem change |
| Bernoulli excluded indices and irregularity | k=0; (p,k)=(37,16) | Lean B₀/0=0 with numerator 0; B₃₂/16=−7709321041217/8160 has numerator divisible by 37 | Positive-index and regularity hypotheses matter | No theorem change |

## Pinned signatures and final validation

The worktree and content Lake manifests agree: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a, Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The native S-integer carrier is {x∈F : v(x)≤1 for every v∉S} in `Mathlib/RingTheory/DedekindDomain/SInteger.lean:65`; it imposes no finiteness condition on S. `IsDedekindDomain` includes `IsDomain` at `Mathlib/RingTheory/DedekindDomain/Basic.lean:149`, and `IsDomain` includes nontriviality at `Mathlib/Algebra/Ring/Defs.lean:437`. The Bernoulli sign is fixed by `bernoulli` and `bernoulli_one` at `Mathlib/NumberTheory/Bernoulli.lean:194` and `Mathlib/NumberTheory/Bernoulli.lean:204`. Tau Ceti’s `ExactK0` at `TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean:163` is a presented degree-zero group, not a higher K-spectrum; the new spectrum-homology headline therefore remains explicitly unstatable at these pins.

A single scratch file containing `#check @name` for each of the four declarations was elaborated successfully after the final Lean edit and compared with README §1.1/§7.2. No binder was lost and no declaration type changed; only the module docstring changed.

| Declaration | Elaborated hypotheses retained and compared |
| --- | --- |
| sUnitSubmonoid | CommRing R, IsDedekindDomain R, arbitrary S, Field F, Algebra R F, IsFractionRing R F |
| integer_isLocalization_iff | All of those, M, both the unit-preimage inclusion and meeting every prime in S |
| integer_isLocalization_of_torsion_classGroup | All of those, plus ∀ c:ClassGroup R, IsOfFinOrder c; no finite-S condition |
| regularPrime_dividedBernoulli_num | p prime and odd, p not dividing the cyclotomic class number, k≥1 |

Repairs are committed as 8d6efc7. Only `TauCetiRoadmap/ArithmeticKTheory/README.md` and `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean` changed; the worktree is clean and nothing was pushed.

The final movable dependency check exited 0, with no UPWARD or CYCLE line:

```text
depcheck: 33 roadmaps, 306 edges, 0 problem(s)
```

`lake build TauCetiRoadmap.ArithmeticKTheory.Suggested` exited 0; its exact output was:

```text
⚠ [8976/8976] Built TauCetiRoadmap.ArithmeticKTheory.Suggested (4.1s)
warning: TauCetiRoadmap/ArithmeticKTheory/Suggested.lean:47:8: declaration uses `sorry`
warning: TauCetiRoadmap/ArithmeticKTheory/Suggested.lean:53:8: declaration uses `sorry`
warning: TauCetiRoadmap/ArithmeticKTheory/Suggested.lean:66:8: declaration uses `sorry`
Build completed successfully (8976 jobs).
```

The final clean-tree gate against origin/main exited 0:

```text
gate ArithmeticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

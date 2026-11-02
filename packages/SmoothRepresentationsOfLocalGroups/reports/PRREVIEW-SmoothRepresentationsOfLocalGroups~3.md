# Review of SmoothRepresentationsOfLocalGroups (pull request #1688 at 097023f)

**Verdict:** needs changes

## R01 (P1) — Clear the non-sorry build warning

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/Suggested.lean:1`: `import Mathlib`.

**Claim:** The acceptance module passes the required build gate.

**Witness:** The targeted build reports that Mathlib is designed for the module system and recommends a `module` header. The supplied gate records `build=1 FAIL`; direct Lean elaboration has no type errors.

**Repair:** Add `module` before the existing imports, retaining the permitted import list, and rerun the targeted build and gate. A scratch copy with this header elaborated with only admissions reported. P1 follows the mandated severity for a failed build gate; there is no Lean type error.

## R02 (P1) — Replace the unavailable logarithm supplier

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:4433`: “are Tau Ceti's own API in the module TauCeti.RingTheory.Nilpotent.Log”; line 4436: “newer than the Tau Ceti revision pinned here”.

**Claim:** The generic logarithm, inverse identities and functoriality are supplied, so this roadmap owns only their applications.

**Witness:** `TauCeti/RingTheory/Nilpotent/Log.lean` and the cited logarithm declarations are absent at pin a91d3aaf. `Mathlib/RingTheory/Nilpotent/Exp.lean:50` supplies the exponential only. No supplier gap is declared.

**Repair:** Give these inputs an allowed owner at these pins. Consume ReductiveGroups Layer 5P for its existing characteristic-zero matrix exp/log construction; for the additional arbitrary-ℚ-algebra core, state a precise supplier gap with that owner and matching plan/README slug, or explicitly own the genuinely additional generality here. Do not make implementation wait for an unpinned library revision or duplicate Layer 5P's geometric work. Require the supplied identities to give log(1+N)=N when N²=0 and log(1+J)=J−J²/2 when J³=0≠J²; a linear-only logarithm fails the second instance.

## R03 (P2) — Include the essentially AIG scalar theorem

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:3768`: “Prove that every equivariant endomorphism is scalar”; `Suggested.lean:194` defines `EssentiallyAIG` without that theorem.

**Claim:** This substantive endpoint is specified only in prose despite having all its statement carriers.

**Witness:** Native GL_n, the actual upper-unitriangular subgroup, `EssentiallyAIG`, and `Representation.IntertwiningMap` already occur in the file. A scratch scalar theorem using these carriers elaborated. EH line 905 states the result.

**Repair:** Add the GL_n theorem with n>0, local-field and coefficient-characteristic hypotheses, and an actual smooth nondegenerate character, asserting unique scalar endomorphisms of an essentially AIG representation. Use EH Lemma 3.2.3, printed p.18, rather than attributing this conclusion to Hel12 Lemma 3.4 alone. The scratch witness reused the concrete character formula of `CoWhittaker.scalars`, made the coefficient ring a field, and replaced the co-Whittaker hypothesis by `EssentiallyAIG`; no missing carrier prevented elaboration. Retain the full stated coefficient scope in the final signature. A generic line has End=κ; two copies have End=M₂(κ) and fail the AIG hypothesis. Do not assert the conclusion for arbitrary subgroup/character data.

## R04 (P2) — Supply the locally compact step of van Dantzig

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:276`: “the two halves of van Dantzig's theorem”; also 569–571.

**Claim:** The two named Mathlib results provide the compact-open basis theorem for a locally compact group.

**Witness:** `Mathlib/Topology/Algebra/OpenSubgroup.lean:603` requires `CompactSpace G`; `Mathlib/Topology/Separation/Profinite.lean:76` is also in the compact section. Neither directly applies to the noncompact additive group ℚ₂.

**Repair:** Keep the general theorem and explicitly own the missing locally compact argument with an exact source locator. Use the local clopen-basis result at `Mathlib/Topology/Separation/Profinite.lean:87`, obtain a compact clopen identity neighbourhood C, and prove its translation stabilizer is open, contained in C, and compact. Do not assume C is already a subgroup. For C=ℤ₂ and C=2ℤ₂ inside ℚ₂ the stabilizers are respectively ℤ₂ and 2ℤ₂; this repairs precisely the noncompact instance without adding `CompactSpace G` to the target.

## R05 (P3) — Fix the remaining TeX scanner failures

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:2601`, 2602, 2604 and twice at 2605: the unquoted expressions `δ_B^{1/2}` and `δ_B^{−1/2}`.

**Claim:** The prose meets the Unicode/code-span house style.

**Witness:** The supplied gate reports `tex=5`; the five exponent-brace expressions remain outside code spans.

**Repair:** Put these expressions inside code spans or use Unicode superscripts. Preserve the two different characters: at diag(3,1), their values are 1/√3 and √3. This is a spelling change, not an inversion of the induction normalization. Rerun the scanner.

## R06 (P3) — Remove the eight HTML anchor residues

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:4378`, 4408, 4416, 4449, 4478, 4479, 4527, 4555; for example `<a id="nilpotent-exp-log"></a>`.

**Claim:** The document passes the residue rule.

**Witness:** The supplied gate reports `residue=8`, exactly these eight standalone anchor tags.

**Repair:** Replace anchor-only tags by ordinary descriptive headings where a stable link is needed, and update links to their generated heading anchors. Delete redundant tags. Check both the raw-parameter and exp/log links resolve to their mathematical targets; exp/log still gives N for square-zero N. Rerun the residue scanner.

## R07 (P3) — Name the omitted Iwahori presentation headlines

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/Suggested.lean:26`: “The Bernstein decomposition and its centre formula require cuspidal data and inertial blocks”. The omitted-headline inventory at 26–36 does not mention either SR.1 presentation.

**Claim:** The module docstring identifies the headline results which cannot be stated at the pins.

**Witness:** README 1504 and 1534 retain the Iwahori–Matsumoto and Bernstein presentations. Neither is stated in Lean or named among its missing-carrier explanations; the earlier cardinality stand-in has correctly been deleted.

**Repair:** Name both presentations and their missing actual Iwahori convolution/affine-Weyl carriers in the module docstring. Do not restore a theorem taking the cell equivalence as a hypothesis. The intended rank-one relation at q=3 is T_s²=2T_s+3, with index 3 for s and 1 for the identity; an arbitrary finite set equivalence does not test it.

## Verified sound

The review read all 173 named README targets and the full acceptance file. The table below retains 61 computed adversarial rows covering all 15 seeded source targets, all 11 present Lean headlines, the remaining headline endpoints, and targets touched by findings. Per-target rows outside this selection are omitted for length. These are counterexample searches, not proofs of the general theorems. No additional false mathematical target was established. Four blocking issues remain: the gate, an unavailable supplier, a missing statable headline, and an incomplete advertised proof route.

### Previous findings, checked first

The previous report identifies itself as #792 at 6008aed. I checked its nine claims against this head. No supplied repair report marked them “not actionable in this package”.

| Previous finding | Current passage/evidence | Result |
|---|---|---|
| R01 K-flat owner | README 529: “DerivedModuleAlgebra … §0.2 supplies K-flat resolutions”; the same owner appears at 1701 and 1711. Main supplier 626–648 includes unbounded resolutions and derived tensor. | Repaired. |
| R02 Iwahori stand-in | README 1504 retains “The Iwahori–Matsumoto presentation”; the arbitrary `cell` theorem is absent from the 335-line file. | Partly repaired: stand-in removed; omitted-headline explanation still missing, now R07. |
| R03 AIG scalar endomorphisms | README 3768 still says “Prove that every equivariant endomorphism is scalar”; Lean 194 defines the predicate only. | Not repaired, now R03. |
| R04 van Dantzig route | README 276 still calls the compact lemmas “the two halves of van Dantzig's theorem”. | Not repaired, now R04. |
| R05 admitted constructions | Lean 65 gives `smoothVectors` a real span/subrepresentation body; Lean 82 states the Grothendieck existence result as a theorem. | Repaired: zero admitted definitions or instances. |
| R06 roadmap import | Lean 1–9 imports Mathlib and eight individual TauCeti modules; line 115 supplies the actual evaluation topology. | Import/topology repaired; inventory exception is R07. |
| R07 admitted examples | No `example` declarations remain. The module says “The statements here suggest Lean forms for headline milestones”. | Repaired: zero admitted examples. |
| R08 TeX | README 2601–2605 still contains the five exposed half-power expressions. | Partly repaired: 506 reduced to 5, now R05. |
| R09 padding | The old normalizer, involution and quartic-computation declarations are absent; retained `heckeAlgebra_finite_over_center` is a general finiteness statement. | Repaired for the previous witnesses; current one-tactic audit below. |

### Gate, elaboration and signatures

The exact head was verified. The worktree is unchanged; the diff outside this roadmap is empty. No admitted data, `set_option`, computational algorithm, forbidden roadmap import or admitted example was found. There is no existing main-branch folder of this name being replanned.

Gate: FAIL with `tex=5 residue=8 build=1`; every other reported rule is zero, including `stray-files`, `outside-folder`, `sorry-data`, `imports` and `depcheck`. The independent targeted build completed successfully but reproduced the non-sorry warning in R01. Direct `lake env lean` on the original file succeeded with exactly eleven `sorry` warnings. Scratch probes were elaborated sequentially and all have stopped.

The requested dependency command returned:

```text
depcheck: 205 roadmaps, 1504 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Reading the *Needs* edges agrees with the explicit build order SR.0 → SR.1 → SR.0d → SR.2 → SR.3a → SR.3 → SR.2a → SR.4 → SR.5 → SR.6. In particular the complex Bernstein-centre route precedes second adjointness; the integral GL_n route uses the earlier stable-operator/type-projective development. The logarithm's missing pinned supplier is not an order-cycle and is not detected by this check.

I reran `#check @name` for all 24 named declarations and additionally checked the local `pointsTopology` instance. The three suspected lost binders are false positives: `Points` is an algebraic carrier; `AbsolutelyIrreducible` and `IsGeneric` are algebraic predicates. They do not need the ambient topology in their types. Topology remains on the smoothness/admissibility predicates; the local `pointsTopology` retains `TopologicalSpace F`. The monodromy theorem retains completeness, finite dimension, module topology, continuity, and ℓ coprime to residue characteristic. Uniform admissibility has `∃ c` before the quantified representation, and also states finiteness, preventing junk `finrank=0` from satisfying the theorem. No signature changed in the PR.

All eleven admitted theorems were probed in a scratch copy with `simp`, `rfl`, and `infer_instance`, each required to close the goal. All eleven remained admitted. Reading the opened native carriers and object searches revealed no matching single-library-lemma proof for these headlines. This establishes no new padding finding; it does not claim an exhaustive search over every possible `exact` invocation.

### Headline inventory

Present and elaborated: the smooth category's Grothendieck property (`SmoothRep.grothendieck`); GL₂ Whittaker multiplicity one (`whittakerCoinvariants_one_dimensional`); reductive irreducible admissibility (`isAdmissible_of_isIrreducible`); uniform admissibility (`exists_finrank_invariants_le`); finite length (`isFiniteLength_of_isAdmissible`); Noetherianity (`isNoetherian_of_finite`); Hecke finiteness over its finite-type centre (`heckeAlgebra_finite_over_center`); co-Whittaker scalars and arbitrary-module tensor endomorphisms; raw Weil–Deligne Frobenius semisimplification; and Grothendieck monodromy with complete normed coefficients.

The README's remaining major endpoints are the Iwahori presentations, Bernstein decomposition/centre, Casselman criterion and Langlands standard quotients, complex and integral second adjointness, classical/derived Satake and explicit spherical formulas, integral Whittaker projectives/domination/reconstruction and LLC families, finite-wild representability/quotient finiteness/excursion comparison, and centre-finiteness/stable-operator results. The docstring identifies the missing cuspidal, parabolic/Jacquet, dual-torus/Satake, mirabolic/type/block/LLC, and finite-wild/excursion carriers. R07 records the presentation omission. The AIG scalar theorem already has its carriers and is R03. No substitute predicates were found standing for any of those missing constructions.

### Resolved library and roadmap ownership

The pins are Mathlib 6b7abb3c76 and Tau Ceti a91d3aaf. The following are concrete declarations opened at those pins, not conclusions from matching names alone:

| File and locator | What the declaration actually supplies |
|---|---|
| `Mathlib/Topology/Algebra/OpenSubgroup.lean:603`; `Mathlib/Topology/Separation/Profinite.lean:76,87` | Compact-group subgroup extraction; compact clopen basis; separate locally compact clopen basis. Compactness is not silently weakened. |
| `Mathlib/NumberTheory/LocalField/Basic.lean:45` | `IsNonarchimedeanLocalField` includes valuation-compatible topology, local compactness and a nontrivial valuation. It is not an arbitrary-topology carrier. |
| `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:70,78` | The reductive Hopf-algebra predicate and its smooth/geometrically connected/no-normal-unipotent characterization. The finiteness headlines really range over connected reductive groups. |
| `Mathlib/RingTheory/Nilpotent/Exp.lean:50,53,76,180,185` | Finite exponential, expansion at a vanishing power, commuting-addition formula, invertibility and functoriality. No logarithm inverse API at this pin. |
| `TauCeti/RepresentationTheory/CharacterTwist.lean:86,99,109` | Actual action χ(g)ρ(g), evaluation and multiplication of twists; the roadmap correctly adds smoothness rather than reconstructing algebraic twisting. |
| `TauCeti/RepresentationTheory/BaseChange.lean:97,105,188` | Base change of representations and the flat finite-group invariants comparison; no arbitrary nonflat invariants comparison is inferred. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/DiscreteGroup.lean:166` | A nonempty additive equivalence for finite discrete groups. Its docstring explicitly does not prove naturality; SR.4.5's coefficient-linear cup-compatible comparison is additional work. |
| `TauCeti/Algebra/Group/CrossedHom.lean:67` | Additive ring-valued crossed maps. It does not duplicate the noncommutative group-valued cocycle construction of SR.6. |

Object searches used the roadmap service, main, the supplied open-head files, packages, and both pinned libraries. The broad service output was truncated, so narrower searches and direct sibling reads were used for the relevant hits. The smooth algebraic category, ring-valued convolution, Whittaker families and raw WD applications have a distinct scope from finite-group algebraic representation theory and Hilbert/Banach smooth-vector density. The package `packages/SmoothRepresentationsOfLocalGroupsPartII/design/README.md:336` concerns Hilbert smooth vectors and at 338 imports SR.0; it does not own the algebraic category. The generic logarithm exception is R02.

Resolved supplier families (paths refer to main unless indicated):

- `TauCetiRoadmap/ReductiveGroupsPartII/README.md`: RG2.0 point topology (including the GL homeomorphism at 748); RG2.1 roots/valuation (1815); RG2.2.4 lattice chains (3411); RG2.3 connected parahoric index (5477); RG2.4 decompositions, positive index and determinant (6390,6450); RG2.5 pinned dual group. These resolve the scanner's `PointTopology`, `BruhatTits`, `NormTorus`, `LevelSubgroups`, and `LocalIntegration` leads. The parabolic index retains positivity and the Levi-normalization hypothesis.
- `TauCetiRoadmap/ProfiniteCohomology/README.md:583,630,1168,1549`: Layers 0,1,7,10 supply the discrete carrier/dictionary, coinduction/Shapiro, and continuous cohomology. `Completed/ProfiniteProPGroups/README.md:185` supplies supernatural order, not the new ring-unit pro-order predicate.
- `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:213,268,460`: transitivity/projection, finite-index representation model and Mackey. Algebraic induction is consumed; smooth closed-subgroup induction and orbit filtrations are additional.
- `TauCetiRoadmap/ModularForms/README.md`, Layer 2: Shimura double-coset multiplication and GL₂ polynomial/localization interfaces. SR compares convolution/permutation conventions instead of claiming that multiplication as a new owner.
- `TauCetiRoadmap/ReductiveGroups/README.md`, Layers 3,7,9 and Layer 5P at 460–464: algebraic subgroups, roots/Bruhat, pinned integral groups, and characteristic-zero polynomial exp/log geometry. The latter is relevant to repairing R02.
- `TauCetiRoadmap/ClassFieldTheory/README.md:1505`: local Weil topology, inertia and degree for all nonarchimedean local fields; reciprocity is only for finite extensions of ℚ_p. `Completed/LocalFieldsRamification/README.md:1154,1317` supplies tame inertia and the arithmetic Iwasawa relation. The WD carrier is not endowed with the absolute-Galois subspace topology.
- `TauCetiRoadmap/DGAInfinity/README.md:263,282,293`, `TauCetiRoadmap/DerivedModuleAlgebra/README.md:626`, and `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:534,538`: coefficient-linear Hom complexes, unbounded K-flat tensor, and replacement/dg comparison. The last explicitly ranges over Grothendieck abelian categories, so it is not confined to module sheaves.

Directly read supplied open-head ownership contracts: `TauCetiRoadmap/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:7,11,86` imports this smooth category and extends its compact-open comparison to a full-group/tower setting; `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/README.md:1257,1311` imports this Satake theory; `TauCetiRoadmap/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:41` imports the smooth representation inputs. These are consumers. No duplicate fully qualified acceptance declaration was found; R02 is the ownership drift.

### Seeded source verification

All 40 bibliography works were attempted through the sources service; 36 have readable legal text. The table distinguishes the version actually read from unverified published pagination. No target is marked as having an unverified locator in the README. Fetching alone is not counted as verification: the following passages were read and compared with the target hypotheses.

| Seeded target (README line) | Exact inspected source and outcome |
|---|---|
| Averaging projector (764) | Ber92 lines 239–253, 349–354: Ch.I §2.1 p.11 and Prop.6(1) p.14 give normalized Haar/projector over ℂ. Arbitrary-ring version is explicitly constructed by finite quotients with unit indices; it is not attributed verbatim to the complex source. |
| Hecke algebra (1094) | Ber92 lines 248–260,291–304: Definition 7, Proposition 5 and Theorem 2, pp.11–12, give compactly supported locally constant distributions, Haar identification and nondegenerate modules. The ring-valued extension uses the separately owned Haar hypotheses. BH06 corroborating locator remains uncertified. |
| Bernstein presentation (1534) | Lus89 lines 344–386,425–435: §§3.2–3.7, printed pp.607–609, give Laurent-parameter algebra, polynomial divided difference and basis. The source is over ℂ[v,v⁻¹]; README explicitly owns integral coefficient descent rather than pretending arbitrary-ring specialization is stated there. |
| Derived invariants (1658) | CG18 arXiv v2 lines 4149–4156,4191–4207: Lemma 9.14 and Remark 9.15 p.92 concern the specified locally admissible GL_n block. README separates that block application from the general compact-open cochain comparison it owns. |
| Central Ext separation (1777) | CG18 arXiv v2 lines 4153–4164: proof of Lemma 9.12 p.91 uses distinct torus characters in its coefficient setting. README's general argument requires a unit scalar difference; the ℤ/C₂ negative control below confirms why mere inequality is insufficient. |
| Hecke decomposition (2384) | Ber92 lines 1286–1290,1368–1389: Proposition 22 pp.39–40 and Theorem 13 p.42 retain the finite central-lattice index and finite-dimensional D factor. README does not replace all lattice classes by central lifts. |
| Finitely many cuspidals (2457) | Ber92 lines 1253–1276,1413–1420,1477 onward: Proposition 21 and Lemma 18 pp.38–39, Theorem 16 p.43 and splitting argument p.45. Conclusion is finiteness at fixed level modulo unramified variation, not finiteness of all twists. |
| Twisted Weyl action (3137) | TV published lines 403–427,1200–1257: §2.9 p.187 and §7.2 pp.206–207. The raw-transform/point-action discrepancy is real; README's explicitly inverted transport and GL₂ computation repair it. |
| Frobenius component (3189) | TV published lines 1258–1320: §7.3 pp.207–209 uses relative Weyl invariants and Frobenius-fixed dominant weights. It does not silently replace the relative Weyl group by the absolute one. |
| Polynomial genericity (3395) | LTXZZ arXiv v3 lines 1044–1060: Definition 3.1.5 and Remark 3.1.6, preprint pp.23–24, give exactly the evaluation/derivative-unit predicates. Published pp.139–140 were not accessible; content/numbering verified, published pages not certified. |
| Odd-rank unitary identities (3504) | LTXZZ arXiv v3 lines 8215–8227,8353–8360,8400–8421: Lemmas B.4.1–B.4.2 and Proposition B.4.3, preprint pp.158–159. Odd parity, q inversion and the two product factors agree. Published pp.344–346 remain unverified. |
| Derived Satake (3569) | Ven-arXiv v3 lines 969–1010: §3.2 p.21 and Theorem 3.3 p.22 require split G, S=ℤ/ℓ^r, r≥1, ℓ^r dividing q−1, and ℓ not dividing the Weyl order. README retains these, including the small-prime exclusions of this theorem. |
| Co-Whittaker families (4284) | Hel12 lines 498–520: Definition 6.1 and Proposition 6.2 p.12 require Noetherian W(k)-algebra, admissibility, rank-one derivative and essentially AIG dual fibers. README supplies the nondegenerate GL_n character and block setting. |
| Minimal-prime reconstruction (4338) | Hel12 lines 545–563: Lemma 6.4 p.13 gives diagonal-image reconstruction over a reduced Noetherian block algebra. README explicitly requires nonzero generic-cosocle quotients, correcting the source's missing exclusion. |
| Crossed cocycles (4799) | DHKM2 v3 lines 158–194,455–488: §1.2 pp.4–5 and §2.1 p.11 identify cocycles with semidirect-product sections and give gauge action g c(w) α_w(g)⁻¹. The README's inverse includes the action. |

Additional spot checks: EH lines 905–923 for R03; BZ76 lines 1647–1689 for the commutative-subalgebra exponent; FS lines 11116–11143 for the excursion comparison and its integral good-prime hypothesis; DHKM2 lines 479–490 for the actual tame relation and coordinate scheme.

### Computed adversarial table

Each row names one target, uses its README line as locator, gives actual values (or modules/rings and their dimensions), and states the review consequence. “Pass” means these instances do not refute the target; it is not a certification of the entire future proof. For definitions the rows include positive, negative and degenerate models where appropriate. Access limitations apply to rows using unavailable references.

| Statement (README line) | Instances tried | Values computed on the two sides / wrong model | Result and change |
|---|---|---|---|
| van-dantzig (561) | G=(ℚ₂,+), C=ℤ₂ or 2ℤ₂ | Stab(C)=C, open and compact; ambient G is noncompact. The advertised compact-group lemma cannot be applied. | R04 |
| averaging-projector (764) | C₂ sign/trivial over ℚ; quotient refinement C₄→C₂ | (1−1)/2=0; (1+1)/2=1; refined sign average (1−1+1−1)/4=0. | Pass; — |
| convolution-algebra (1094) | S₃ discrete, s=(12), t=(23) | δ_s*δ_t=δ_st, coefficient 1 at st and 0 at ts; reversal differs. Unit δ₁; zero convolution=0. | Pass; — |
| iwahori-matsumoto (1504) | GL₂, q=3, simple reflection s; length zero | T_s²=2T_s+3; identity has index 3⁰=1, s has index 3. At q=1, T_s²=1. | Pass; — |
| bernstein-presentation (1534) | Rank one, θ_λ=z, sλ=−λ, α∨=λ, q=3 | (z−z⁻¹)/(1−z⁻¹)=z+1; commutator=2(z+1). At q=1 RHS=0, with division interpreted polynomially. | Pass; — |
| grothendieck-abelian (1596) | G=1, arbitrary A | Smooth category=Mod(A), generator=A; filtered union of finitely supported free summands is A^(ℕ), and kernels are computed elementwise. | Pass; — |
| derived-invariants (1658) | ℤ_p with trivial 𝔽_p; finite C₂ with 𝔽₂ | First case H⁰=𝔽_p,H¹=𝔽_p,H²=0; second Hⁿ=𝔽₂ for all n≥0. Invertible-pro-order vanishing cannot include C₂/𝔽₂. | Pass; — |
| central-ext-vanishing (1777) | C₂, trivial/sign over ℚ versus ℤ | Central scalar difference=2; Extⁿ over ℚ=0. Over ℤ, Ext¹(trivial,sign)=ℤ/2, annihilated by 2 but nonzero. | Pass; — |
| whittaker-functionals (2188) | GL₂ Steinberg; trivial line; zero | Nondegenerate Whittaker dimensions=1,0,0. Infinite-dimensional irreducible hypothesis excludes the trivial-line counterexample to multiplicity-one existence. | Pass; — |
| admissibility-of-irreducibles (2337) | Split torus characters; zero | Compact-level invariant dimensions are 1 if character is trivial there, otherwise 0; zero fails irreducibility, so is not an illicit instance. | Pass; — |
| hecke-algebra-decomposition (2384) | Degree-2 division algebra D× | Valuation lattice ℤ, central image 2ℤ, two coset representatives; retaining only central shifts misses odd valuations. Split torus index=1. | Pass; — |
| uniform-admissibility (2441) | Torus, fixed compact open K | Supremum of irreducible invariant dimensions=1; a single c=1 works before choosing the character. | Pass; — |
| finitely-many-cuspidals (2457) | G=ℚ₃×, K=1+3ℤ₃ | G°/K=𝔽₃× has two characters, hence two inertial classes with K-fixed vectors; infinitely many unramified twists are not new components. | Pass; — |
| finite-length (2542) | Torus, C[t,t⁻¹]/(t−1)²; infinite trivial sum | First is finitely generated/admissible, length 2; infinite sum is not finitely generated and has infinite length. | Pass; — |
| principal-series-constituents (2586) | GL₂ normalized i_B(δ_B¹/²) | Length 2, quotient trivial, subrepresentation Steinberg; normalized Jacquet characters evaluate 1/√3 and √3. | Pass; — |
| bernstein-decomposition (2693) | Torus, direct sum of two characters with different O× restrictions | Each component is one line; sum is the full 2-dimensional module, and each vector has finite component support. | Pass; — |
| noetherian (2705) | Torus C[t,t⁻¹] regular module | Ascending ideals stabilize by Noetherianity; module is cyclic but infinite-dimensional over C, so finite-dimensionality is not required. | Pass; — |
| bernstein-centre-blocks (2716) | Unramified torus block | Centre=C[t,t⁻¹], regular functions on C×; evaluation at χ(ϖ)=2 sends t to 2, not 1/2. | Pass; — |
| finite-type-corners (2735) | Torus G/K≅ℤ | H=C[t,t⁻¹], finite of rank 1 over its centre; centre generated by t,t⁻¹ with relation tt⁻¹=1. | Pass; — |
| casselman-criterion (2818) | GL₂ Steinberg versus trivial at q=3 | Normalized Jacquet exponents have absolute values 1/√3<1 versus √3>1 in the contracting chamber. | Pass; — |
| langlands-classification (2856) | GL₂ standard module i_B(δ_B¹/²) | Unique irreducible quotient is 1, whereas Steinberg is its submodule; reversing chamber exchanges the embedding/quotient roles. | Pass; — |
| second-adjointness (3062) | P=G; GL₂ standard module→trivial | Identity case gives equal Hom spaces. Opposite normalized Jacquet character of 1 matches δ_B¹/², giving dimension 1 for the quotient map. | Pass; — |
| satake-transform (3110) | GL₂, q=3, first dominant coset | Raw S*=3X₁+X₂; δ_B¹/² rescales to √3(X₁+X₂). Unit coset maps to 1. | Pass; — |
| twisted-weyl-invariance (3137) | Same rank-one reflection | Correct twist fixes 3X₁+X₂; opposite twist yields X₁/3+9X₂. Inversion of lattice transports to the opposite convention. | Pass; — |
| satake-isomorphism (3169) | GL₁; GL₂ first generator | GL₁ sends δ_(ϖⁿ)↦Xⁿ bijectively; GL₂ normalized first generator is √q(X₁+X₂), a symmetric polynomial. | Pass; — |
| frobenius-component-invariants (3189) | Split GL₂, Fr acting trivially; torus with inversion | First invariants are symmetric Laurent polynomials, trace(a,b)=a+b. Inversion torus conjugation sends a↦h²a, so quotient over algebraic closure is a point. | Pass; — |
| pseudoroot (3205) | GL₂, q=4 | a₀=(1/2,2) squares to (1/4,4) and is twisted-fixed. Rescaling by 2 stays twisted-fixed but square becomes (1,16), excluded. | Pass; — |
| hall-littlewood (3287) | Two variables, λ=(0,0), (1,0) | Normalizer v_(0,0)=1+t, v_(1,0)=1; resulting polynomials 1 and X₁+X₂. At t=−1 normalization denominator vanishes but polynomial remains 1. | Pass; — |
| parabolic-descent (3339) | GL₂(E), q_F=3; partition (1,2) | δ_B(diag(ϖ,1))=1/9, half=1/3; extra ξ twist at coordinates (1,1,1) gives (1/9,1/3,1/3), not modulus half. | Pass; — |
| unitary-genericity (3395) | P=T−1; P=(T−1)², q=1 | Odd derivative P′(1)=1, P(−q)=−2; even P(q)=0 but P′(q)=0, hence not level-raising special. In 𝔽₂, odd intertwining value=0. | Pass; — |
| unitary-triangular-transform (3434) | N=3, q=3, δ=1 | Gaussian [3 choose 1]_(−3)=7; 9(μ+1)=S(T₁)+7, hence S(T₁)=9μ+2. | Pass; — |
| unitary-isotropic-counts (3451) | N=3, q=3 | Coefficient of T₀ in I is q³+1=28; I=T₁+28, so S(I)=9μ+30. | Pass; — |
| unitary-spherical-coefficients (3465) | Odd r=1, q=3; empty product | d₁=1−q−2q²=−20; d₀=1. T=T₁−20 gives S(T)=9μ−18. | Pass; — |
| unitary-even-formulas (3487) | N=2, q=3 | S(T₁)=3μ+2, S(I)=3μ+6, R=4,T=−3. 4R−I=10−3μ=−3(μ−3−1/3); R+4T=−8=−(q²−1). | Pass; — |
| unitary-odd-formulas (3504) | N=3,q=3; N=1 | S(I)=9μ+30=9(μ+3+1/3); S(T)=9μ−18=9(μ−2). For r=0 both empty products and transforms equal 1. | Pass; — |
| gsp4-spin-polynomial (3516) | q=2, T₀=1,T₁=2,T₂=3; q=1,T₀=1,T₁=4,T₂=4 | Coefficients are (1,−3,14,−24,64); second specialization is (1−X)⁴. At q=0 reciprocity degree assumptions fail. | Pass; — |
| derived-satake (3569) | Split G_m, q=11, ℓ=5,r=1 | H*=𝔽₅[ℤ]⊗H*(C₁₀,𝔽₅); H⁰ and H¹ each 𝔽₅[ℤ], and W=1. GL₂ at ℓ=2 is excluded by 2 dividing W. | Pass; — |
| essentially-aig (3759) | Generic line; two identical generic lines; zero | End rings κ, M₂(κ),0; AIG true,false,false. Scalar theorem is statable on native GL_n/Whittaker data but missing. | R03 |
| type-projective-construction (3870) | GL₁ with q=3 and ℓ=2 | Residue regular module W(k)[C₂] is projective, trivial quotient need not be; reduction has nonsemisimple group ring k[C₂]=k[ε]/ε². | Pass; — |
| stable-operator (3958) | diag(0,2) on ℚ²; product of A[t]/tʲ | Stable summand=ℚe₂, dual stable summand=(ℚe₂)*; tʲ kills factor j but no single exponent kills the whole product. | Pass; — |
| integral-second-adjointness (3980) | P=G over W(k); torsion coefficients | Induction and Jacquet both=id, two Hom modules agree for M=W(k)/ℓ and N=M, equal to k; no inversion of ℓ enters. | Pass; — |
| universal-whittaker (4223) | GL₁, fixed integral block | Top derivative is the representation itself; regular block module specializes to each character line, derivative rank 1 over the block centre. | Pass; — |
| co-whittaker (4284) | GL₁ over A, line A; rank-two trivial module; A=0 | Derivatives A,A²,0; co-Whittaker true,false,true respectively. Scalar End=A; zero ring has one scalar and one endomorphism. | Pass; — |
| universal-domination (4329) | GL₁ universal block, t↦a∈A× | Evaluation maps universal generator to 1∈A and is onto; derivative map is A→A,id. Zero map is not domination for A≠0. | Pass; — |
| reduced-family-reconstruction (4338) | A=k[x,y]/xy; nonreduced A=k[ε]/ε² | A→k(x)×k(y) has kernel 0; A→k has kernel (ε). Zero prescribed fiber has derivative 0, not rank 1, and is explicitly excluded. | Pass; — |
| wd-raw-parameters (4380) | q=3, r(Φ)=diag(3,1), N=E₁₂ | rNr⁻¹=3N; opposite diagonal gives N/3, rejected. Rank 1 forces N=0; rank 0 gives zero endomorphism. | Pass; — |
| nilpotent-exp-log (4418) | N²=0; J³=0,J²≠0 | exp N=1+N, log(1+N)=N, square root=1+N/2. log(1+J)=J−J²/2; cited pinned log supplier is absent. | R02 |
| wd-parameter-operations (4451) | Previous 2×2 parameter, q=3 | Dual N=−E₂₁ with r∨=diag(1/3,1), conjugacy again gives 3N∨; tensor monodromy N⊗1+1⊗N. Induced coset of degree 1 uses N/3. | Pass; — |
| wd-complete-coefficients (4481) | Unramified rank-one family over complete ℚ₃⟨T⟩ fraction completion | Frobenius value 1+3T gives inertia 1 and N=0; it need not lie in a finite extension of ℚ₃. At rank 0 exp sum and identity are both zero endomorphisms. | Pass; — |
| full-wd-construction (4529) | ρ on inertia exp(tN), N²=0 | ρ(σ)=1+t(σ)N; removing exp(tN) gives r(σ)=1. Replacing t by ct changes N to N/c, leaving tN fixed. | Pass; — |
| wd-frobenius-semisimplification (4557) | Unramified r(Φ)=I+E₁₂, N=0; Sp₂ | First becomes I with unchanged charpoly (T−1)²; Sp₂ retains nonzero N=E₁₂ and eigenvalues 3,1. | Pass; — |
| integral-llc-centre (4631) | GL₁ unramified family, parameter t | Centre generator maps to t; specializing t=2 gives 2 on the generic fiber. The inverse would give 1/2 and violate the normalization. | Pass; — |
| llc-family-conditional (4655) | Rank-one unramified family over reduced A | Family is A with character t, torsion-free, derivative=A; generic specialization is its character line, and zero family violates rank-one derivative. | Pass; — |
| tensor-endomorphisms (4697) | GL₁ co-Whittaker line V=A, M=A² or 0 | Both End_A(M) and End_G(M⊗A V) are M₂(A), or zero; pure tensor comparison sends E₁₂(m)⊗v to E₁₂(m⊗v). | Pass; — |
| crossed-cocycles (4799) | Γ=ℤ acting by inversion on H=ℚ×, trivial cocycle; h=2 | Gauge at generator=2·1·2=4, not 1. In semidirect product (2,1)⁻¹=(2,−1), whereas ignoring action gives (1/2,−1). | Pass; — |
| finite-wild-discretization (4835) | Trivial wild quotient, q=3 | Fr s Fr⁻¹=s³; conjugating s by Fr⁻¹ requires s^(1/3), so tame subgroup is ℤ[1/3], not merely ℤ. | Pass; — |
| finite-wild-representability (4849) | Ĥ=G_m, trivial action, q=3, no wild part | Coordinates a,b units with b²=1; ring R[a±1,b±1]/(b²−1), free rank 2 over R[a±1]. In char 2 fiber is nonreduced, still length 2. | Pass; — |
| frobenius-quotient-finite (4950) | G_m, trivial action, q=3 | Forget b in b²=1: coordinate algebra is free rank 2 over Frobenius algebra; char 2 retains rank 2 though geometric point count drops to 1. | Pass; — |
| excursion-invariant-comparison (4988) | Ĥ=1; free cyclic source with G_m | Both rings are base ring for Ĥ=1; cyclic G_m gives R[t±1] on each side. Kernel=0; no nonreduced inference is needed in these cases. | Pass; — |
| z-finite (5006) | Trivial line over A; infinite trivial sum over a field; zero | Z_V=A and invariant rank 1; Z_V=k but infinite invariant dimension; zero image ring and module both 0. Truth values true,false,true. | Pass; — |
| stable-contracting-hecke-operator (5093) | P=G,a=1; nilpotent stable operator | Hecke operator=id and Jacquet=V in first case; localized nilpotent part=0 in second. These match invertible/nilpotent summands. | Pass; — |

## Not verifiable

- **Mac:** *Symmetric Functions and Hall Polynomials*, III.2.1, needed for the Hall–Littlewood normalization. The sources service tried the OUP DOI landing pages and a clean bibliographic lookup; OUP returned HTTP 403. The request is recorded under the existing key Mac in `needs-references.toml`. The low-rank computations above are independently checked; they do not certify this locator.
- **BH06:** *The Local Langlands Conjecture for GL(2)*, including §§2.8, 3.2 and 4.1. The service resolved DOI 10.1007/3-540-31511-x as paywalled/uncertified. Ber92 supports the overlapping complex averaging/Hecke claims, but the BH06 passages were not read. No new access request was made for the settled paywall.
- **HM18:** the integral Bernstein-centre interpolation reference is paywalled/uncertified in the service result. Its precise integral interpolation theorem is not certified by this review. No new request was added.
- **Nak:** Lemma B.10, printed p.274, for coefficient-module tensor endomorphisms. The Springer URL was classified paywalled/uncertified. The all-rank extension in README 4697–4709 is an explicitly owned Schwartz-submodule argument; neither the unavailable source proof nor the full future argument is certified by a successful signature build.
- **LTXZZ published pagination:** the institutional published PDF timed out twice. The legal arXiv v3 text verifies the numbered definitions and lemmas in the seeded sample, but not the published page numbers. A version note or preprint pagination would make this distinction reproducible.

The source-fetch pass is complete. These access limitations do not suspend the review.

## Source issues

- **Misprint** in BCGP at §2.4.1, printed p.20 (BCGP line 1007): the source says the Iwahori and pro-Iwahori are kernels of maps to B(k) and U(k); it should be their inverse images under reduction to G(k); affects a stated result.
- **Error** in TV at (7.2.1), (7.2.5) and §7.4(a)(i), printed pp.206–209 (TV line 1204): the source says the raw-transform point twist uses the positive half-difference and the pseudoroot squares to Σ*(q); it should be the opposite half-difference and inverse square, or transport both transform and parameters by inversion; affects a stated result.
- **Misprint** in Les at the modulus display preceding Lemma 3.1, printed p.23 (Les line 978): the source says to use the F-absolute value for determinants of E-points; it should be the normalized E-absolute value, giving q⁻² on diag(ϖ,1) in GL₂(E); affects a stated result.
- **Error** in Hel12 at Lemma 6.4, printed p.13 (Hel12 line 545): the source says arbitrary quotients of the universal generic fibers admit co-Whittaker reconstruction; it should be nonzero generic-cosocle quotients, excluding the zero quotient whose top derivative vanishes; affects a stated result.
- **Misprint** in Pil at §5.1.5 after Proposition 5.1.5.1, printed p.22 (Pil line 951): the source says the parameter pairing is αβ=γδ; it should be αδ=βγ in the surrounding spin/Klingen convention; affects a stated result.
- **Misprint** in Ber92 at Lemma 18, printed p.39 (Ber92 line 1274): the source says the indexing objects of independent coefficient spaces are matrix coefficients themselves; it should be pairwise nonisomorphic irreducible representations, whose matrix-coefficient spaces are linearly independent; affects a stated result.
- **Misprint** in Ber92 at Proposition 23(2), printed p.40 (Ber92 line 1297): the source says every parabolic is conjugate to a minimal parabolic; it should be conjugate to a unique standard parabolic; affects a stated result.

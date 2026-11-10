# Review of SchemeAndStackFoundations (pull request #1276 at 01946c3)

**Verdict:** accepted

This is an incremental re-review of the 81 changed lines since `a5411fa` (46 insertions, 35 deletions, in `README.md` and `Suggested.lean` only). The change has no findings. Of the previous findings, R02–R05 are repaired. R01 is settled: the last repair report answered it (H01) as not actionable in this folder, and I checked that reason and found it correct (below). The gate passes, `Suggested.lean` elaborates, and nothing is padding.

## Previous findings

- R01 — not repaired; settled by the repair report's H01 and not re-raised: "**From JacobianChallenge**: C (coherence of `R^q f_* F` for `f` proper over a locally Noetherian base …), D (Picard functor …), E (abelian varieties), F (Abel–Jacobi)" (`README.md:544–548`). The reason holds at this head, for these reasons:
  - **The direction from this side is downward.** JacobianChallenge is line 1 of the merge order, so every citation of it from here goes downward. The upward half is JacobianChallenge's citation of §§0.9, 1.1, 2.2, 2.11, 4.9, 4.12 and 4.14 (`TauCetiRoadmap/JacobianChallenge/README.md:152`, `:196`, `:208`, `:229–230`, `:246`, `:277`, `:279` on main), and that text lives in JacobianChallenge's folder.
  - **Step 1 of the previous repair would create two owners.** JacobianChallenge on main owns 02O5–02O6 with its own Checks (`README.md:143–154`), so stating it in §2.6 would give it two owners on main. The pinned Tau Ceti has no substitute: `TauCeti/AlgebraicGeometry/Cohomology/` at `2fd255d9` has `HigherDirectImage/{Basic,Affine,ClosedImmersion,Restrict}.lean` (`R^q f_*` with no finiteness theorem), but no `Proper.lean` or `Pushforward.lean`.
  - **Step 2 would break other roadmaps' citations.** §§3.6–3.8 are cited from outside this folder: JacobianChallenge main `:286`; and, at the heads of their open pull requests, NeronModelsAndSemistableAbelianVarieties `README.md:1152`, `:2769`, `:2831`, `:4153` and AbelianSchemesAndArithmeticModuli `README.md:801`.
  - **JacobianChallenge's open revision keeps both directions.** It still cites §4.12 and §4.9 (`README.md:511`, `:695–697`, `:765–771`) and hands §§3.6–3.7 back here (`:44`, `:60`).
  - **What this head does.** It cites JacobianChallenge 31 times, against 44 times on main. §4.9 states the target order, which is acyclic target by target (`README.md:5749–5756`). The description now states the open point under "Direction of supply".
- R02 — repaired: "For integral `X`, with no Noetherian or dimension hypothesis, Cartier divisors modulo principal divisors are `LineBundleClass X` by Tau Ceti's `TauCeti.AlgebraicGeometry.Scheme.CartierDivisor.classGroupAddEquivLineBundleClass`" (`README.md:5022–5030`). `cartierClass_picard_equiv` is gone from the folder.
- R03 — repaired: "`letI : IsDominant f := IsAlteration.isDominant` / `letI := f.functionFieldMap.hom.toAlgebra`" (`Suggested.lean:943–944`), with `import TauCeti.AlgebraicGeometry.Morphisms.Dominant` (`:14`). §3.3 (`README.md:4944–4948`) and §4.16 (`:6354–6357`, `:6386`) cite the Tau Ceti map.
- R04 — repaired: "Part III, Propositions 2.1, 2.2, pp. 91–92" (`README.md:5249`).
- R05 — repaired: the description now says "It imports `Mathlib` and 23 `TauCeti.*` modules", "The branch is at main's pins, Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`", and that the two `abbrev` aliases are kept. All of these hold at the head (below).

## Verified sound

### Gate, dependency check, elaboration, probe, signatures

- **Gate.**
  - The worker's gate at `01946c3`: every counter is 0, including `build=0`; result OK.
  - My re-run of `gate … SchemeAndStackFoundations --base origin/main`: every counter is 0 (`depcheck=0`, `outside-folder=0`, `stray-files=0`, `readme-ids-missing=0`); result OK, exit 0.
- **Dependency check**, verbatim:

  ```text
  depcheck: 233 roadmaps, 2263 edges, 0 problem(s)
  ```

  It has no UPWARD, CYCLE or `moved:` line. It does not report edges between two roadmaps on main, which is why it is silent on R01.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 53 s. It gives 47 "declaration uses `sorry`" warnings and no other message.
- **One-tactic probe.**
  - **Setup.** A scratch copy replaces every `sorry` by `first | rfl | infer_instance | (simp; done) | trivial | decide`.
  - **Result.** It gives 47 errors at 47 distinct positions, including `vectorBundleDegree_pullback` (probe line 753). Nothing is padding.
  - **Counts.** The file has 47 theorems, all `sorry`, and the five instances have real bodies, which matches the description's "Its 47 theorems are each stated with sorry".
- **Signatures**, checked with `#check @` in one scratch file:
  - `Curve.vectorBundleDegree_pullback` carries `[IsIntegral X] [IsIntegral Y] [IsProper …] (hX hY : topologicalKrullDim = 1) [IsDominant f] (hf) [Algebra Y.functionField X.functionField] (hφ : CommRingCat.ofHom (algebraMap …) = Scheme.Hom.functionFieldMap f)`, the README statement of §3.3.
  - `Formal.IsAlteration.IsGenericallyEtale` has binders `f`, `[IsIntegral S]`, `[IsIntegral S']`, `[IsAlteration f]`.
  - In the same file, `example … : (CommRingCat.ofHom (algebraMap …) = f.functionFieldMap) ↔ (Spec.map (CommRingCat.ofHom (algebraMap …)) ≫ Y.fromSpecStalk (genericPoint Y) = X.fromSpecStalk (genericPoint X) ≫ f) := f.eq_functionFieldMap_iff _` elaborates. So the new hypothesis is equivalent to the `Spec` square it replaces, and the theorem is unchanged in content.
  - `scratch/signatures.md` reports 0 of 101 declarations with a lost binder.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dropped names.** `cartierClass_picard_equiv` and `IsAlteration.functionFieldMap` occur nowhere at this head. On main and at the open heads (`roadmaps grep`), they appear only in copies of this folder (main, and the heads of the four pull requests that also change this folder). The only Lean importers of this module, AdicEtaleGeometry and EnhancedDerivedSheaves, use neither name, and both are in the worker's targeted build.

### Library declarations opened at the pins (Tau Ceti `2fd255d9`)

- `CartierDivisor/ClassGroup.lean`:
  - `:61` `principalSubgroup_eq_ker : principalSubgroup X = toLineBundleClassHom.ker`.
  - `:68` `abbrev ClassGroup X := CartierDivisor X ⧸ principalSubgroup X`.
  - `:123` `classGroupAddEquivLineBundleClass (X) [IsIntegral X] : ClassGroup X ≃+ Additive (LineBundleClass X)`. It has no Noetherian or dimension binder, as `README.md:5023` says. Both declarations elaborate in a scratch file importing that module.
- `WeilDivisor/Scheme/Picard.lean:252`: `SchemeWeilDivisor.classGroupAddEquivLineBundleClass`, which needs `[IsNoetherian X]`, DVR stalks at codimension-one points and `[Fact (∀ y, coheight y ≤ 1)]` (`:246`). This supports "only for Noetherian regular integral curves, where the pinned coheight-at-most-one hypothesis holds" (`README.md:5036–5037`). `SchemeWeilDivisor.classGroupToLineBundleClass` elaborates with the same hypotheses.
- `Morphisms/Dominant.lean`:
  - `:87` variables `[IrreducibleSpace X] [IrreducibleSpace Y]`.
  - `:151` `Scheme.Hom.functionFieldMap (f) [IsDominant f] : Y.functionField ⟶ X.functionField`, defined as `stalkSpecializes ≫ stalkMap (genericPoint X)`.
  - `:160` `SpecMap_functionFieldMap_fromSpecStalk`.
  - `:170` `eq_functionFieldMap_iff` (uniqueness).

  This matches the supplier-contract wording "dominant morphism `X → Y` of irreducible schemes, the unique one compatible with the canonical morphisms" (`README.md:491–495`).
- **Sign of the rewritten §3.4 Check.**
  - `CartierDivisor/Sheaf.lean:28` gives `O_X(D) = f⁻¹ O_X` locally, for `f` a local equation.
  - `Effective/Basic.lean:94` gives `isEffective_iff_one_mem_sections`.
  - So a hyperplane `H ⊂ ℙ²` has a section `1` of `O(H)` vanishing exactly on `H`, and `O(H) ≅ O(1)`, not `O(−1)`.
- **The §3.4 *Needs:* line.** Its one unnamed item, "codimension-one valuations of rational sections", is the construction of the target `picardToClassGroup` itself. Tau Ceti's `WeilDivisor.OrderSystem.ofScheme` / `SchemeWeilDivisor.orderAt` (`WeilDivisor/Scheme/Principal.lean:111`) needs `[IsNoetherian X]`, whereas the target is for locally Noetherian `X`. So the README is not omitting a citation it could make.
- **No pinned morphism predicate for generically étale.** A search for `GenericallyEtale`, `GenericallySeparable` and `IsAlteration` in Mathlib and Tau Ceti finds only separable-transcendence hypotheses on function fields over `k` (`Differentials/Canonical.lean:61`, `WeilRegularity.lean:113`, `Rational.lean:273`), not a predicate on morphisms. `IsGenericallyEtale` is not a duplicate.

### Sources checked in the changed passages

The Stacks book text is cached, with page markers equal to printed pages.

| Target | Locator | Text | Result |
|---|---|---|---|
| §3.3 `vectorBundleDegree_pullback` (seeded) | Lemma 33.44.11 (0AYZ) | book line 138457, p. 2915: a nonconstant morphism of proper curves over `k`, `E` locally free on `Y`, `deg f^*E = deg(X/Y)·deg E`, with `deg(X/Y)` the generic rank of `f_*O_X` | supports the README and Lean as stated |
| §3.3 degree | Definition 33.44.1 (0AYR) | line 138304, p. 2912: `deg E = χ(E) − n χ(O_X)` on a proper `X` of dimension `≤ 1` | matches the docstring at `Suggested.lean:736` |
| §3.4 `picardToClassGroup` | 0BE4, 0BE6 | lines 129454 (p. 2726), 129506 (pp. 2727–2728): `Cl(X)` and `div_L(s)` on a locally Noetherian integral scheme | sound |
| §3.4 `classGroup_picard_locallyFactorial` | Lemmas 31.28.6–31.28.7 (0BE8, 0BE9) | lines 129535, 129549, p. 2728: injective for normal `X`; bijective iff the local rings are UFDs | sound |
| §3.8 | Milne 2008, III, 2.1 and 2.2 | `milne-av` line 3702 under the running head of p. 91 (line 3686); line 3737 after the running head of p. 92 (line 3726) | pp. 91–92 correct |

The README flags no locator as unverified. The other seeded targets (§§0.4, 0.11, 1.6, 1.11, 2.1, 2.3, 2.6, 2.7, 2.16, 3.5, 4.7, 4.11, 4.13, 5.3) are outside the changed passages. None of them cites a name the change removed, so per the incremental rules they were not re-read.

### Adversarial table

Rows for changed statements were computed this round. Carried rows cite the review of `a5411fa`.

| Statement | Instances | Values computed (each side) | Result |
|---|---|---|---|
| `vectorBundleDegree_pullback`, new `hφ` (changed) | `z ↦ z²` on `ℙ¹_k`, `char k ≠ 2`, `E = O(1)` | left `χ(O(2)) − χ(O) = 3 − 1 = 2` / right `[k(z):k(z²)]·(χ(O(1)) − χ(O)) = 2·(2 − 1) = 2` | Pass |
| same | Frobenius of `ℙ¹_{𝔽_p}`, `E = O(1)` | `χ(O(p)) − 1 = p` / `[𝔽_p(t):𝔽_p(t^p)]·1 = p` | Pass |
| same | `z ↦ z³`, `E = O ⊕ O(−1)` (`r = 2`) | `χ(O ⊕ O(−3)) − 2 = (1 − 2) − 2 = −3` / `3·(χ(O ⊕ O(−1)) − 2) = 3·(1 + 0 − 2) = −3` | Pass |
| same, `r = 0` and `f = 𝟙` | `E = 0`; identity | `0 = finrank·0` / `deg E = 1·deg E` | Pass |
| same, the wrong algebra | an abstract embedding `k(z) → k(z)`, `z ↦ z³`, against `f : z ↦ z²` | without `hφ` the right side is `3·1 = 3 ≠ 2`; `hφ` forces the algebra to be `f.functionFieldMap = (z ↦ z²)`, so it is excluded | Pass: `hφ` pins the instance |
| `Formal.IsAlteration.IsGenericallyEtale` on `f.functionFieldMap` (changed) | Frobenius of `𝔸¹_{𝔽_p}`; `Spec ℤ[i] → Spec ℤ`; identity | `X^p − t^p = (X − t)^p`, inseparable, false / `X² + 1` over `ℚ`, separable, true (the §4.16 Check) / `K = K`, true | Pass |
| same, characteristic split | `t ↦ t²` on `𝔸¹_{𝔽_3}` and on `𝔸¹_{𝔽_2}` | `X² − t² = (X − t)(X + t)`, `t ≠ −t`, separable, true / `X² − t² = (X − t)²`, false | Pass |
| §3.4 pinned Cartier equivalence (changed) | `ℙ²_k`; nodal cubic; non-Noetherian integral `X` | hyperplane ↦ `[O(H)] = O(1)` (sign from `Sheaf.lean:28`, `Effective/Basic.lean:94`) / not normal, yet the pinned equivalence applies (binder `[IsIntegral X]` only), while `picardToClassGroup` is scoped to normal `X` / covered by the pin, as the README says | Pass |
| §3.4 Checks (first changed) | `ℙ²`; quadric cone `k[x,y,z]/(xy − z²)` | `div(x₀) =` a line, `Cl = Pic = CaCl = ℤ` / integral, so `CaCl ≅ Pic = 0`, while `Cl = ℤ/2` (ruling): `0 → ℤ/2` injective, not surjective; the vertex is not a UFD (0BE9) | Pass |
| §3.8 locator (changed) | Milne AV III 2.1, 2.2 | p. 91 / p. 92 | Pass |
| Supplier rows `README.md:486–495` (changed) | the four declarations | names, files, lines and binders as listed above | Pass |
| §1.8 negative control (04QY) | carried | review of `a5411fa` | Pass |
| `isPseudoCoherentSheaf_iff_affineOpens` | carried | review of `a5411fa` | Pass |
| `flat_over_dedekind` | carried | review of `a5411fa` | Pass |
| `Ring.IsJapanese.of_complete_local` | carried | review of `a5411fa` | Pass |
| `smooth_iff_formallySmooth` | carried | review of `a5411fa` | Pass |
| `genus_of_finite_etale` | carried | review of `a5411fa` | Pass |
| `hodge_index` (`ℙ¹ × ℙ¹`: `(a,b)·(c,d) = ad + bc`, `D = (1,−1)`: `D² = −2`) | carried | review of `a5411fa` | Pass |
| `weil_bound` (`y² + y = x³`/`𝔽_2`: `|3 − 3| ≤ 2√2`; Hermitian `q³ + 1`) | carried | review of `a5411fa` | Pass |
| §5.11 (iv) and the Hermitian Check | carried | review of `a5411fa` | Pass |
| `alteration_theorem` degenerate (`X = Spec k`) | carried; the class `IsAlteration` is unchanged | review of `a5411fa` | Pass |
| `CH_coprod` | carried | review of `a5411fa` | Pass |
| §0.8, §0.12, §0.27, §0.28, §1.7, §2.15, §2.19, §3.3 (nodal cubic), §4.6, §5.3 Checks | carried | review of `a5411fa` | Pass |

### Headline theorems

These are unchanged since `a5411fa`.

- **Stated:**
  - `Groups.artinBootstrap` (§1.17);
  - `derivedObject_gluing` (§2.18);
  - `Formal.grothendieck_existence`, `_fullyFaithful` and `algebraize_hom` (§4.10);
  - `alteration_theorem` and `semistable_alteration_theorem` (§§4.19–4.20);
  - `hodge_index` (§5.10);
  - `weil_bound` (§5.11).
- **Named as not statable in the module docstring, each with its missing carrier:**
  - Keel–Mori (§1.23);
  - coherent duality (§§2.19–2.20);
  - the Brauer class (§2.22);
  - Picard torsors (§3.6);
  - Schlessinger (§4.4);
  - `K_0 → G_0` (§5.7);
  - GRR (§5.8).

### Description, overlaps, ownership

- **Pull-request description.** Every factual sentence I tested holds at the head:
  - 23 `TauCeti.*` imports (`Suggested.lean:2–24`).
  - 47 `sorry` theorems.
  - 89 Tau Ceti files named, 88 present at `2fd255d9`; the missing one is `Cohomology/FormalFunctions.lean`, named as §4.9's destination (`README.md:128`, `:5742`).
  - The only heading removed against main is `### Other supplier contracts` (heading diff).
  - AbundanceStatement and CommRingFactorizationSystems are cited 0 times.
  - JacobianChallenge on main cites §§0.9, 1.1, 2.2, 2.11, 4.9, 4.12, 4.14.
- **Overlaps** (`scratch/overlaps.md`).
  - No id is dropped in either direction, and no id is defined only by an open revision.
  - Four open pull requests change this folder and conflict with it. The generated merge-order block orders them: #1656 → this pull request → #1807 → #1808 → #1854.
  - The change adds no owned object: it deletes one target and one definition and cites Tau Ceti for both. So no new ownership question arises against the open roadmaps closest in vocabulary.
- **Declared gaps.** None: there is no readable `design/plan.json` and no `What <Supplier> must provide` contract.

## Not verifiable

- These are carried from the review of `a5411fa`; they concern untouched text, and the change does not cite them anew:
  - Fulton 1998 (§§3.4, 5.3): no legal copy.
  - Hartshorne 1977 and de Jong 1996: settled as uncertified.
  - Deligne–Mumford 1969, Nayak, Block–Holstein–Wei, and Bhatt–Scholze 2017: not read.
- Hartshorne II.6.15, cited by Tau Ceti's `ClassGroup.lean` docstring rather than by this README: not needed, because the README cites the pinned declaration.

## Source issues

- none

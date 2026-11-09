# Review of AlgebraicModuliForArithmeticGeometry (pull request #853 at 69cc13f)

**Verdict:** needs changes

Incremental re-review of the 55 lines changed since `9dcc97f` (README only; `Suggested.lean` is byte-identical to the head the previous review read). The gate passes, the plain dependency check reports no problem, and `Suggested.lean` elaborates with exactly five `sorry` warnings at the pins Mathlib `1b1ccf4b0` and Tau Ceti `2fd255d99`. One blocking finding is new: the change set adds a supplier contract with a roadmap that is an open pull request of another author, not in the merge order, that consumes this roadmap's §§3.2–3.3 and from which nothing here is consumed. Three P3 findings of the previous review are not repaired and are carried; one repair introduced a stale citation.

Locations are relative to `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/` unless another roadmap or library is named. Source ids are the keys under which this review fetched the texts (`kleiman_picard`, `stacks_descent`).

## R01 (P2) — FiniteEquivalenceRelations §4.2 is named as a supplier of nothing, and the two roadmaps now cite each other

**Location:** `README.md:276` (table row “Module descent along pure ring maps | FiniteEquivalenceRelations §4.2 / `nonempty_comonadicLeftAdjoint_iff`, `full_faithful_comparison_iff`”), `README.md:278–283` (“### From TauCetiRoadmap.FiniteEquivalenceRelations … This roadmap states no pure-map version.”), `README.md:1880` (Layer 3 Dependencies: “FiniteEquivalenceRelations §4.2 (module descent along pure ring maps)”), `README.md:1212` (“Effective descent of modules along an arbitrary pure ring map, the Joyal–Tierney theorem, is FiniteEquivalenceRelations §4.2”), `README.md:129` (“FiniteEquivalenceRelations supplies effective descent of modules along pure ring maps (§4.2)”).

**Claim:** FiniteEquivalenceRelations is not on main and not in the merge order; it is the open pull request #1929 of another author, under review. No target of this roadmap uses anything from it: §3.1's `affineModuleDescentEquivalence` is proved from Mathlib's `comonadicExtendScalars` (its `*Needs:*` line at `README.md:1220` names no FiniteEquivalenceRelations item), and the contract subsection itself says “This roadmap states no pure-map version.” Meanwhile FiniteEquivalenceRelations at its head makes this roadmap its supplier: its Scope says AlgebraicModuliForArithmeticGeometry §§3.1–3.3 own the descent-data/coalgebra dictionary it reads its theorem through, its Conventions take the comonad “by AlgebraicModuliForArithmeticGeometry §3.2 (`overlapCoalgebraEquivalence`)”, its §4.2 statement is phrased via “AlgebraicModuliForArithmeticGeometry §3.3, `moduleCanonicalComparison`”, and it lists this roadmap's §3.1 under its Downstream consumers. Two roadmaps citing each other as suppliers is a cycle; and a supplier contract that supplies nothing makes this roadmap wait for an unmerged pull request for no mathematical reason. The gate's dependency check is blind to it because the edge to a roadmap it cannot resolve is dropped.

**Witness:** FiniteEquivalenceRelations at the head of #1929, `README.md:70–76`, `:119`, `:628`, `:758–760`. Dependency check with FiniteEquivalenceRelations inserted after this roadmap in a scratch copy of the merge order, without `--movable`:

```text
UPWARD: AlgebraicModuliForArithmeticGeometry (#34) -> FiniteEquivalenceRelations (#35) at README lines [129, 276, 278, 1880]
depcheck: 236 roadmaps, 2263 edges, 1 problem(s)
```

The plain run reports `2262 edges, 0 problem(s)`: one edge fewer, the dropped one.

**Repair:** Delete the table row at line 276, the subsection at lines 278–283 and the clause at line 1880. At line 1212 cite the general theorem by its source only: “this target is the faithfully flat case of the theorem that a ring map is an effective descent morphism for modules iff it is universally injective (Stacks, Theorem 35.4.22, Tag 08XA; faithfully flat maps are universally injective by Lemma 35.4.8, Tag 08WP)”. Move the sentence at line 129 to `## Downstream consumers` in the direction FiniteEquivalenceRelations itself states: “FiniteEquivalenceRelations §4.2 states the pure-map (Joyal–Tierney) form of module descent and reads its descent data through §§3.2–3.3; §3.1 is its faithfully flat case.” Test: the dependency check with FiniteEquivalenceRelations inserted after this roadmap returns `0 problem(s)`; the mathematics of §3.1 is unchanged (for ℤ → ℤ[1/2] × ℤ[1/3], faithfully flat, the equalizer is ℤ[1/2] ∩ ℤ[1/3] = ℤ either way).

## R02 (P3) — The affine descent target still states the special case of the imported theorem

Carried from the previous report (its R01), not repaired.

**Location:** `README.md:1222`, “Prove `affineFpqcQuasicoherentDescent`. For a finite standard fpqc covering {Ui→S} of an affine scheme S, the canonical functor from QCoh(S) to descent data for the cover is an equivalence.” The new paragraph at `README.md:1212` anchors the §3.1 form on it (“as `affineFpqcQuasicoherentDescent` requires”).

**Claim:** As written this is the affine, finite-covering case of SchemeAndStackFoundations §1.1's `qcoh_fpqc_descent`, which `README.md:1151` says this roadmap will not restate; the new content (compatibility of the module descent equivalence with the sheaf one through `tildeEquiv`) is not what the target asserts.

**Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2074` on main; Mathlib `CategoryTheory/Sites/Descent/IsStack.lean` (`isEquivalence_toDescentData`) gives the displayed equivalence for every covering family of a stack.

**Repair:** As in the previous report: state the target as the commutation, up to the specified natural isomorphism, of the square formed by `tildeEquiv`, `affineModuleDescentEquivalence` and the imported equivalence, on objects and module maps; keep the three Checks. Test: for Spec ℤ covered by D(2), D(3) both routes return ℤ as the equalizer of ℤ[1/2] × ℤ[1/3] ⇉ ℤ[1/6] and the comparison is the identity; for ℝ → ℂ with conjugation both return ℝ.

## R03 (P3) — Generic-law Check blocks in §§4.7, 4.9–4.18

Carried from the previous report (its R03), not repaired.

**Location:** `README.md:3385–3388` (coverCenter: “the identity local sections give the identity centre unit”, “the actual centre unit constructed from inverse local sections is the inverse”), and the sentence “The principal sheaf morphism followed by its inverse is the identity on the action sheaf” at `README.md:4941`, `:4959`, `:5011`, `:5028`, `:5058`.

**Claim:** These Checks restate the definitions' laws without an instance, so a wrong definition that satisfies the same laws passes them; three of this kind do not meet the three-discriminating-Checks requirement. The repaired §4.8 blocks (`README.md:3904` onward in the previous head's numbering) show the intended shape.

**Witness:** `grep -c 'The principal sheaf morphism followed by its inverse is the identity on the action sheaf' README.md` returns 5.

**Repair:** As in the previous report: computed instances on the fixtures already in the file (on the point-site B(C₃), coverCenter of the constant family z = 1 is the unit with component 1 and inverse 2; on the C₄ → C₂ → C₂ chain coverCenterAt along the reduction sends 1 ↦ 1 and 2 ↦ 0; for principalSheafIso on B(C₃) the section (1,2) goes to (1,0) and back).

## R04 (P3) — Repeated standing-hypothesis paragraphs

Carried from the previous report (its R06), not repaired.

**Location:** the paragraph beginning “Here Commutative rings R,A in the universe, an arbitrary homomorphism `f:R→A` …” at `README.md:1461, 1481, 1491, 1501, 1521, 1541, 1551, 1561, 1571, 1581, 1591` (eleven times in §3.3, whose opening at `README.md:1439` already fixes the setting); the paragraph beginning “Here C is a small category …” 82 times from `README.md:3051` on, after every target of §4.7 whose opening at `README.md:3281` states the same hypotheses.

**Claim:** House style states standing hypotheses once per subsection; the repeats carry no information and roughly double these subsections.

**Witness:** `grep -c '^Here Commutative rings R,A in the universe' README.md` returns 11; `grep -c '^Here C is a' README.md` returns 82.

**Repair:** Delete the per-target repeats where the subsection's opening paragraph states the same hypotheses; keep a per-target “Here …” line only where it differs. (The previous report's suggestion to split §§4.9–4.18 into a Part II is a design option, not required for this finding.)

## R05 (P3) — The relative-Spec citations now point at a file that no longer declares those names

New: introduced by the repair of the previous report's R05.

**Location:** `README.md:8878` and `README.md:8898`, “AlgebraicVectorBundles L1A–L1B (`relativeSpecUniversalProperty`, `relativeSpecPushforwardIso`, `relativeSpecBaseChangeIso` and `relativeSpecEquiv` in its `Suggested.lean`)”.

**Claim:** On the current main, AlgebraicVectorBundles' `Suggested.lean` declares none of the four names: its L1A–L1B are completed in Tau Ceti, and three of the names are Tau Ceti declarations at the pin, while `relativeSpecUniversalProperty` exists nowhere (the universal property is `relativeSpecHomEquiv`). A citation must resolve where it points.

**Witness:** `grep -n relativeSpec TauCetiRoadmap/AlgebraicVectorBundles/Suggested.lean` on main (`a94a93cf`) returns nothing; `TauCetiRoadmap/AlgebraicVectorBundles/README.md:359–362` on main says L1A is Tau Ceti's `RelativeSpec/AffineFunctions.lean`, `RelativeSpec/PullbackAlgebra.lean`, `RelativeSpec/UniversalProperty.lean` and L1B is `RelativeSpec/Equivalence.lean`, `RelativeSpec/BaseChange.lean`. At Tau Ceti `2fd255d99`: `relativeSpecEquiv` (`TauCeti/AlgebraicGeometry/RelativeSpec/Equivalence.lean:114`), `relativeSpecBaseChangeIso` (`RelativeSpec/BaseChange.lean:272`), `relativeSpecPushforwardIso` (`RelativeSpec/Unit.lean:179`), `relativeSpecHomEquiv` (`RelativeSpec/UniversalProperty.lean:349`); no declaration named `relativeSpecUniversalProperty`.

**Repair:** In both parentheses write “AlgebraicVectorBundles L1A–L1B, in Tau Ceti as `relativeSpecHomEquiv`, `relativeSpecPushforwardIso`, `relativeSpecBaseChangeIso` and `relativeSpecEquiv` (`TauCeti/AlgebraicGeometry/RelativeSpec/`)”, and add the four declarations to `## Exact supplier contracts` under From Tau Ceti. Test: the proof routes at `README.md:8880` and `:8900` (chartwise relative Spec of the descended algebra, compatible with base change) use exactly these four facts; `#check` of the four names at the pin elaborates.

## Previous findings

- R01 — not repaired: `README.md:1222` still reads “Prove `affineFpqcQuasicoherentDescent`. For a finite standard fpqc covering {Ui→S} of an affine scheme S, the canonical functor from QCoh(S) to descent data for the cover is an equivalence.” (R02 above.)
- R02 — repaired: `README.md:1893–1897` keep the five structural API bullets of `IsGerbe` and `README.md:1901–1903` the three discriminating Checks (BA, the two-object discrete groupoid, the n-th root gerbe of O(1)); the eight duplicated theorem sentences are deleted from both lists.
- R03 — not repaired: the generic-law blocks at `README.md:3385–3388` and the sentence at `:4941, :4959, :5011, :5028, :5058` are unchanged. (R03 above.)
- R04 — repaired: `README.md:493` reads `def cmRegularity`, `:1623` `quasicoherentPseudofunctor`; the six “Throughout this topic,” lines at `:1316, :1884, :5062, :8803, :9661, :9726` are sentences; `:9728` reads “`Pic_{X/B}(T) ≅ ker σ_T^*`, naturally in T”.
- R05 — partly repaired: `README.md:9745` cites “Kleiman, Theorem 9.4.8, for projective flat families with geometrically integral fibres” and names no later roadmap; the relative-Spec sentence at `:8878`, `:8898` now names declarations that AlgebraicVectorBundles' `Suggested.lean` on main no longer contains (R05 above).
- R06 — not repaired: eleven “Here Commutative rings R,A in the universe …” and 82 “Here C is a …” paragraphs remain. (R04 above.)

## Verified sound

**Head, gate, diff.** The worktree is at `69cc13fbeaaa0f574ff27410c484b37f0a652583`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry'` is empty (the long list of files in the change summary is the merge of main into the branch, not a change of the pull request). The gate run by this review:

```text
gate AlgebraicModuliForArithmeticGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

**Dependency check (plain, as the brief gives it):**

```text
depcheck: 236 roadmaps, 2262 edges, 0 problem(s)
```

No UPWARD or CYCLE line. With FiniteEquivalenceRelations inserted into a scratch copy of the merge order before this roadmap the count is `2263 edges, 0 problem(s)`; inserted after it, the UPWARD line quoted in R01. FiniteEquivalenceRelations' own `*Needs:*` lines name only its targets, Mathlib, Tau Ceti and ModularCurves, so the tool would place it early; its citations of this roadmap are in its Scope, Conventions and the statement of its §4.2, which is why the direction is settled by text, not by the tool.

**Elaboration.** `lake env lean` on `Suggested.lean` (unchanged since `9dcc97f`, `git diff` empty) produced exactly five `sorry` warnings (lines 48, 73, 87, 119, 131) and nothing else, in 8 seconds, at Mathlib `1b1ccf4b0` and Tau Ceti `2fd255d99`. The worker's signature file shows the seven elaborated types with every binder the README states (`IsArtinianRing`, `Fintype σ`, `IsScalarTower`, `Module.Finite`, `DirectSum.Decomposition`; `IsNoetherian X` and `IsFinitePresentation` on all three terms; `Field k`, both `HopfAlgebra` instances and injectivity; `IsNoetherianRing A` with the formal-fibre predicate; `HenselianLocalRing A`); none lost a section binder. The one-tactic probe and the padding audit of the previous report stand, since the file did not change.

**Headline inventory.** Unchanged from the previous report: Hilbert–Serre over Artinian coefficients, coherent dévissage, faithful flatness of commutative Hopf inclusions, Artin approximation in pointed-étale and henselian forms are stated; the headlines of Layers 1–5 and 7–9 that need projective bundles of modules, gerbes, rigidification, Artin's criteria, Picard spaces, formal effectivity or SNC compactification are named in the module docstring as not statable, with no stand-in.

**Pinned declarations opened this round** (Mathlib `1b1ccf4b0`, Tau Ceti `2fd255d99`):

| File and line at the pin | What it provides |
| --- | --- |
| Mathlib `Algebra/Category/ModuleCat/Descent.lean:62` | `comonadicExtendScalars (hf : f.FaithfullyFlat)`: comonadicity needs faithful flatness, as `README.md:1212` and `:282` say. No pure-map descent exists in Mathlib at the pin. |
| Tau Ceti `AlgebraicGeometry/RelativeSpec/Equivalence.lean:114` | `relativeSpecEquiv : (QuasicoherentAlgebra X)ᵒᵖ ≌ AffineSchemeOver X` (R05). |
| Tau Ceti `AlgebraicGeometry/RelativeSpec/BaseChange.lean:272`, `Unit.lean:179`, `UniversalProperty.lean:349` | `relativeSpecBaseChangeIso`, `relativeSpecPushforwardIso`, `relativeSpecHomEquiv` (R05). |

**Cross-roadmap citations in the changed passages, resolved at their current text:**

| Citation | Where it resolves |
| --- | --- |
| FiniteEquivalenceRelations §4.2, `nonempty_comonadicLeftAdjoint_iff`, `full_faithful_comparison_iff` | Head of open pull request #1929: `README.md:622–661` states both names with the stated content (comparison functor fully faithful iff pure; extension of scalars comonadic iff pure); not on main, not in the merge order (R01). |
| AlgebraicVectorBundles L1A–L1B | `README.md:359–362` on main: both completed in Tau Ceti (R05). |
| Kleiman, Theorem 9.4.8 (`README.md:9745`) | `kleiman_picard` lines 1309–1312 (arXiv Theorem 4.8, printed p. 27): X → S projective Zariski-locally over S, flat with integral geometric fibres gives Pic_{X/S} existing, separated and locally of finite type over S; the README's hypothesis sentence matches. |
| SchemeAndStackFoundations §1.1, §1.21, §1.22, §3.4; ModularCurves §§0C, 0E, 0F, 4C; ReductiveGroupsPartII RG2.0a.1 (unchanged citations in the changed lines) | As in the previous report; the headings are unchanged on main (`a94a93cf`). |
| ComplexComparisonPartII at `README.md:145`, `:1140`, `:1149`, `:9420`, `:10605` | Untouched text; each names that roadmap as owner or consumer, none as a supplier. |

**Sources read for the changed passages:**

| Target | Source evidence and result |
| --- | --- |
| 3.1 pure-map paragraph | `stacks_descent` line 486: Definition 35.4.5 (08WL), universally injective ring map; line 495: Lemma 35.4.8 (08WP), faithfully flat ⇒ universally injective; lines 674–677: Theorem 35.4.22 (08XA), descent morphism ⇔ effective descent morphism ⇔ universally injective. The mathematics of `README.md:1212` is right; only the ownership edge is wrong (R01). |
| 7.6.3 Kleiman locator | `kleiman_picard` lines 1309–1312, as above. |
| 3.2, 7.6.1 (seeded sample targets whose standing-hypothesis lines changed) | Only the sentences changed; the statements and their locators are those the previous report verified (Stacks Lemma 35.3.2 displays; Stacks Lemma 99.11.4). |

The other seeded sample targets (1.7a, 3.5, 4.2, 4.3, 4.8a, 4.21, 6.1, 7.1, 7.3, 7.8, 7.10.2, 8.1, 9.2a) are outside the change set; the previous report's verification of them stands.

**Adversarial table.** Rows for the statements the change set leaves untouched (every declaration of `Suggested.lean` and the README targets of the previous report's table) are carried from the previous report, r5 at `9dcc97f`, whose table has one row per statement with its values; they are not repeated here since neither the Lean file nor those passages changed. Rows for the changed statements, computed this round (Cₙ additive):

| Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- |
| §3.1 pure versus faithfully flat (`README.md:1212`) | ℤ → ℤ × ℤ/2; ℤ → ℚ; ℤ → ℤ[1/2] × ℤ[1/3] | split by the first projection, so pure; ℤ/2 not flat, so `comonadicExtendScalars` inapplicable while descent is effective. ℤ/2 ⊗ ℚ = 0, so not pure; identity and zero of ℤ/2 agree after extension, comparison not faithful. Faithfully flat, hence pure; equalizer ℤ[1/2] ∩ ℤ[1/3] = ℤ | Statement correct; the supplier edge is the defect (R01). |
| `affineFpqcQuasicoherentDescent` (R02) | Spec ℤ by D(2), D(3); ℝ → ℂ with conjugation | equalizer ℤ; equalizer ℝ, ℂ ⊗_ℝ ℝ = ℂ | Same values from the imported theorem; restate as the comparison. |
| `cmRegularity` (renamed, `README.md:493`) | O(a) on P¹_k, i = 1 | H¹(O(a + m − 1)) = 0 iff a + m ≥ 0; O(−2) is 2-regular, not 1-regular | Signature and README agree; none. |
| `quasicoherentPseudofunctor` (renamed, `README.md:1623`) | Spec R; identity morphism | fibre ModuleCat R; identity functor with identity transition | none. |
| `IsGerbe` Checks (`README.md:1901–1903`) | B(C₃) on the point site; discrete groupoid on {false,true}, maximal sieve only; n-th root gerbe of O(1) on P¹, n = 2 | Isom(x,x) = C₃ nonempty; Isom(false,true) = ∅ on the only cover, so not locally isomorphic; 2·deg M = 1 impossible | Three discriminating Checks; the five API bullets are structural; none. |
| §3.2 standing hypotheses (`README.md:1316`) | f = id_R; f : ℤ → ℤ/2, N = ℤ/2 | coalgebras of the identity comonad are the modules; θ = id is a coaction | No flatness needed, as stated; none. |
| §4.10 standing hypotheses (`README.md:5062`) | η the identity transformation; B(C₃) with a ↦ −a | component equation a = a; 1 ↦ 2 ≠ 1, so not band-preserving | Band preservation material; none. |
| §5.2 standing hypotheses (`README.md:8803`) | E with full level-2 structure, 2 invertible | [−1] fixes E[2] pointwise, so Aut(E, level 2) ⊇ {±1} and the level does not rigidify | Consistent with “trivial level-preserving automorphisms” being a hypothesis; none. |
| `FiniteCorrespondence.fpqc_descent`, `tame_finite_flat_descent` (citation changed, `README.md:8878`, `:8898`) | Spec(k × k) over k, descended along k → k′ Galois of degree 2 | legs of degree 2; the two points are swapped by the Galois datum and descend to one k-point of degree 2 | Statements unchanged; the cited file does not declare the names (R05). |
| §7.6.1 `relativePicardSheaf` (standing hypotheses rewritten) | id : P¹ → P¹ | raw presheaf Pic(P¹_T)/Pic(T) ∋ O(1), sheaf 0 since every class is pulled back from T locally | none. |
| `sectionPicardSplit` (formula retyped, `README.md:9728`) | α_i = 2, α_j = 3, φ = 5 over ℚ; X = P¹_B with σ the ∞-section | u = α_j⁻¹φα_i = 10/3, φ′ = (3/10)·5 = 3/2, α_j⁻¹φ′α_i = 1; Pic(P¹_T) = Pic(T) ⊕ H⁰(T,ℤ), σ_T^* O(1) trivial, ker σ_T^* = H⁰(T,ℤ) = Pic_{P¹_B/B}(T) | Kernel identification holds under O_T ≅ f_*O; none. |
| `sectionPicardSplit` negative control | X = B ⊔ B, σ the first inclusion | f_*O = O², hypothesis fails; Pic(X_T) = Pic(T)², ker σ_T^* = Pic(T) ≠ 0 for Pic(T) ≠ 0 while the sheaf quotient is also Pic(T) | Hypothesis needed for the split, not for the kernel formula here; none. |
| `polarisedIsomScheme` (Kleiman locator) | X = Y = P¹_k, L = M = O(1); (E, O(p)) | Pic_{P¹/k} = ℤ_k separated; every element of PGL₂ preserves the class, dimension 3; Isom = Aut(E, p), order 2, 4 or 6 | Kleiman 9.4.8 applies (projective, flat, geometrically integral); none. |

**Suggested.lean form.** Unchanged: single `import Mathlib` plus one existing `TauCeti.*` module, one module docstring, `theorem` only, no `set_option`, `#eval`, `#print`, `lemma`, placeholder or sorried data; every Lean name appears in the README.

**Remarks on untouched text (no change requested).** `README.md:8876` (“Here the endpoint hypotheses of finite-correspondence; An actual fpqc descent datum …”) and the five lines ending in a doubled full stop (`README.md:4962`, `:4966`, `:5869`, `:5933`, `:5973`) have the shape the previous R04 fixed elsewhere.

## Not verifiable

- The open pull request #1929 (FiniteEquivalenceRelations) was read at its head through the roadmaps tool; its future position in the merge order is not decided, which is why R01 settles the direction by the two READMEs' text and the scratch-order dependency check rather than by `ORDER.txt`.
- Not re-fetched this round and taken from the previous review's verification: every source of the seeded sample targets outside the change set (listed under *Verified sound*), Stacks Lemma 99.11.4 (0D28) and Lemma 35.3.2 (023H), whose target statements did not change.
- The published FGA Explained pagination of Kleiman Theorem 9.4.8 was not checked (the arXiv text was read; the README gives both numberings).

## Source issues

- none

# Review of AlgebraicModuliForArithmeticGeometryPartII (pull request #1754 at 3460198)

**Verdict:** needs changes

## R01 (P3) — The description credits a roadmap the head neither cites nor extends

**Location:** Pull-request description, summary block (`roadmap-summary`), "Why Tau Ceti wants it": "The theory extends the smooth-surface and characteristic-zero quotients of SchemeAndStackFoundations and AbundanceStatement."

**Claim:** The head neither names nor extends AbundanceStatement, and this roadmap may not cite it. Since 7db093c the README owns the numerical theory that this sentence attributes to AbundanceStatement.

**Witness:** The README has 0 occurrences of "AbundanceStatement". Line 11 makes this roadmap the owner of §§0.7, 1.1–1.5, 1.7 and 3.3. Line 279 extends only SchemeAndStackFoundations §5.10 (smooth projective surfaces over algebraically closed fields).

**Repair:** Replace the sentence with: "The theory extends the numerical quotient of smooth projective surfaces over algebraically closed fields (SchemeAndStackFoundations §5.10) to proper schemes over arbitrary fields and Noetherian bases. It owns the curve pairing of Cartier divisors, the numerical spaces, cones and nefness, Kleiman's criterion and semiampleness (§§0.7, 1.1–1.5, 1.7, 3.3)."

## R02 (P3) — The AI-assistance line omits the models that wrote the repairs

**Location:** Pull-request description: "AI assistance: codex (gpt-6.1-sol) ported the package after 4 independent review rounds and 2 red-team rounds on the job board (Fable and Astra); this draft awaits human review."

**Claim:** Seven commits after the port changed the README and `Suggested.lean`, and they were co-authored by models the line does not name as authors. CONTRIBUTING.md requires the description to name every model used.

**Witness:** In `git log origin/main..HEAD`, commits bba32f3, eaed48f, 7db093c, 36adfc3 and 3460198 carry `Co-Authored-By: Claude Opus 5.5`, and commits a39a04a and 73c57df carry `Co-Authored-By: Claude Fable 5.1`. The requirement is at CONTRIBUTING.md lines 54–56.

**Repair:** Replace the line with: "AI assistance: codex (gpt-6.1-sol) ported the package after 4 independent review rounds and 2 red-team rounds on the job board (Fable and Astra). The repairs made after review of this pull request were written with Claude Opus 5.5 and Claude Fable 5.1, including taking over the numerical theory formerly cited from AbundanceStatement. This draft awaits human review."

## Previous findings

- None: the review of 36adfc3 raised no findings.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `contraction_descends_purelyInseparable` (cited by the changed §3.6 text) | K = k | pr is an isomorphism; take Y = Y′, v = id, f = pr⁻¹ ≫ f′; both squares commute | holds | none |
| same | k = 𝔽_p(t), K = k(t^{1/p}), X = P¹_k, f′ = structure map | Γ(P¹_K, O) = K, so f′ is a contraction; Y = Spec k with Γ(P¹_k, O) = k and Y_K = Spec K | descends | none |
| same | X = Spec K over k, same K | X_K = Spec K[w]/(w^p), with Γ of K-dimension p, so X_K → Spec K is not a contraction. The identity of X_K descends to the identity of X | consistent on both sides | none |
| same (negative control) | ℂ/ℝ; X = P¹_ℂ over ℝ; contract one component of X_ℂ = P¹ ⊔ P¹ | `IsPurelyInseparable ℝ ℂ` fails (separable, degree 2); Galois swaps the components, so the contraction does not descend | hypothesis decisive | none |
| §3.6 proof route (changed text) | X = P¹_k × P¹_k with f′ = pr₁ over K; X = ∅ | U′ = 𝔸¹_K × P¹_K, Γ = K[s] = k[s] ⊗_k K; V′ = 𝔸¹_K → V = 𝔸¹_k is a homeomorphism; Y = P¹_k. For ∅: f′_*O = 0 forces Y′ = ∅ = Y | every step holds | none |
| §3.6 locator (seeded sample) | SCH23 lines 289 and 310 | Page-7 marker at line 274, page-8 at 320. Line 289 opens the purely inseparable case; line 310 drops the Num hypothesis. Properness: EGA IV 2.7.1 there, SchemeAndStackFoundations §0.11 here | as cited | none |
| Description: "Brauer obstruction lands in Br(X^aff)" against §2.4 | P¹_ℂ over ℝ; the pointless real conic | X^aff = Spec ℂ with Br = 0 although Br(ℝ) = ℤ/2, and Pic = `Pic_{X/ℝ}(ℝ)` = ℤ. Conic: H⁰ = ℝ, cokernel ℤ/2 = Br(ℝ) | agrees with head | none |
| Description: "Kummer bound with étale finiteness" against §1.2 | Spec k̄; P¹_k̄; E × E | dim H²(μ_ℓ) = 0, 1, 6 against ρ = 0, 1, and 3, 4 or 6 | bound holds; agrees | none |
| Description: "extends … AbundanceStatement" (R01) | the README; AbundanceStatement at its head (#545) | 0 README mentions; README line 11 owns §§0.7, 1.1–1.5, 1.7, 3.3; AbundanceStatement Layers 4B–4D plan N¹, NE, the nef cone and Kleiman | contradicted | R01 |

The rows for the untouched statements stand as in the previous review, of 36adfc3.

- **Gate** (re-run on 3460198): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run on the same head also reports `build=0`.
- **Dependency check:** `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. The merge order lists this roadmap at line 266. The open suppliers AlgebraicModuliForArithmeticGeometry (36) and ComplexComparisonPartII (41) come earlier. EtaleCohomologyFoundations and ResolutionOfSingularitiesCharacteristicZero are now on main (3cf7342).
- **Elaboration:** `lake env lean` gives 16 `declaration uses sorry` warnings (lines 93, 106, 128, 137, 154, 201, 216, 250, 275, 297, 330, 368, 385, 405, 427, 447) and nothing else. `git diff --stat 36adfc3 HEAD` lists only README.md, so the signatures, the binder check and the one-tactic probe of 36adfc3 stand.
- **Supplier citations in the changed passage**, resolved on main: SchemeAndStackFoundations §0.11 (line 1370: proper descends along a field extension, which is an fpqc covering) and §0.23 (line 2163: `IsUniversalHomeomorphism.SpecMap_iff` and stability under base change) support the two claims of the rewritten §3.6 route. §0.9 is at line 1262.
- **Pull-request text against the head:**
  - The validation sentence matches the gate.
  - The three files named are the folder's files.
  - The consumers named in the summary match README line 1187.
  - The remaining summary claims (specialization, Kummer, Br(X^aff), the reused Tau Ceti APIs) match §§0.3, 1.2 and 2.4 and lines 37–43.
  - The title correctly names a new roadmap.
- **Overlap check:** read AbundanceStatement (#545), K3SurfacesAndSymplecticBoundedness (#1375), EnriquesSurfacesAndIntegralNonexistence (#1488) and SchemeAndStackFoundations (main). The diff adds no construction.
  - AbundanceStatement also plans N¹, NE, nefness, Kleiman's criterion and semiampleness. It is on the never-cite list and absent from the merge order, so this roadmap is the owner, as settled at 36adfc3.
  - SchemeAndStackFoundations owns §§0.11, 0.23 and 5.10, and this roadmap cites them.
  - The other two are consumers.
- **Remark (no change asked):** AdicCoefficientsAndComparisonsPartII (§4.6) and AlgebraicGromovWittenTheory (§§1.1–1.4, 1.7(iii)) also cite this roadmap, and every section they cite exists at this head. Board manifest `sources.toml` line 238 still reads "p. 3"; that point was settled at 36adfc3 and is outside the pull request.
- **Source independence:** changed passages only. One passage, the §3.6 proof route, was compared with one source, SCH23 lines 289–309.
  - The longest shared run is 7 words, all of them the formula "Y′ = Y⊗k′ and f′ = f⊗k′". Apart from that, the longest run is 6 words, "U′ → V′ is the affine hull".
  - The passage places properness first, unlike the source.
  - Largest share: SCH23, 62 of 204 source-id mentions.
  - No layer was added, removed or reordered, so the contents were not compared again.

## Not verifiable

- None for the changed passage. LAZ04, KLE66 and HAR77 remain settled as `uncertified` and are cited by locator only; none of them is cited by the changed text.

## Source issues

- **Misprint** in SCH23 at the proof of Theorem 1.3, purely inseparable case, p. 7 (SCH23 line 300): the preimage under f′ is taken of V, which is not yet defined at that point; it should be the preimage of the affine open V′; affects nothing.
- **Misprint** in SCH23 at the proof of Theorem 1.3, p. 7 (SCH23 line 293): the continuous map of the given contraction is called f, although the contraction is the pair (f′, ϕ′); it should be f′; affects nothing.

## For the human reviewers

- AbundanceStatement (#545, open, another author), Layers 4B–4D, plans N¹, NE, the nef cone and Kleiman's criterion for projective varieties. This roadmap owns the same objects over arbitrary fields (README line 11), and the never-cite list bars citing AbundanceStatement.

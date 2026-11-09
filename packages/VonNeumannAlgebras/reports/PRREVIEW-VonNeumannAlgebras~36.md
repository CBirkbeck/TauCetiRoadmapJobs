# Review of VonNeumannAlgebras (pull request #1041 at 7d10de2)

**Verdict:** needs changes

Incremental re-review of the 67 lines changed since 9c3f832 (all in `README.md`; `Suggested.lean` is byte-identical). Of the three previous findings, R02 (the Pedersen–Takesaki locator and the nonfaithful extension) and R03 (the ownership note in References) are repaired, and the repairs introduce no new problem. R01 (the branch at the old pins, in add/add conflict with the roadmap on main) is not repaired and is carried as the sole finding; it is a P3 and a worker step. The gate passes, the dependency check is clean, and `Suggested.lean` elaborates at the branch pins with exactly its 24 `sorry` warnings.

## R01 (P3) — The branch is still at the old pins and conflicts with the roadmap now on main

**Location:**
- `TauCetiRoadmap/VonNeumannAlgebras/README.md:226–321` (the "From Tau Ceti" contract), ending "Each is used as stated at the pin."; the new sentence at `:120–124` cites `LinearMap.existsUnique_trace_mul_eq` as well.
- `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:17–18`: "written out so that the file imports only Mathlib".

**Claim:** At the branch's own Tau Ceti pin most of the contract does not exist, so "at the pin" holds only at main's pin, and the branch still conflicts with main's copy of this roadmap (on main with `PROGRESS.md`, `STATUS.md` and `metadata.toml`).

**Witness:**
- `lake-manifest.json` on the branch pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`; main pins `2fd255d9` and `1b1ccf4b`.
- `git grep existsUnique_trace_mul_eq a91d3aaf -- TauCeti` is empty; at `2fd255d9` it is `TauCeti/LinearAlgebra/Matrix/Trace/Duality.lean:31`.
- `git merge-tree --write-tree origin/main HEAD` (origin/main `1bea8354`) lists stage-2 and stage-3 entries for both `README.md` and `Suggested.lean`: an add/add conflict in each.

**Repair:** unchanged from the previous review. Rebase onto main or merge main, resolving both conflicts in favour of this head's `README.md` and `Suggested.lean` and keeping main's other files and `lake-manifest.json`. Then state the Layer 0 nondegeneracy clause as `π.IsNondegenerate`, add `import TauCeti.Analysis.CStarAlgebra.Representation.Nondegenerate`, and delete `Suggested.lean:17–18`. The previous rounds elaborated that six-line variant at main's pins with exactly 24 `sorry` warnings; it fails at the branch pin because the module does not exist there, so it is applied only after the merge. This does not change the folder's mathematics.

## Previous findings (review of 9c3f832)

- R01 — not repaired: `lake-manifest.json` still pins `a91d3aaf`/`6b7abb3c`; `git merge-tree` still shows add/add conflicts on both files; `Suggested.lean:17–18` still reads "written out so that the file imports only Mathlib". Carried as R01.
- R02 — repaired: `README.md:3550–3566` now cites "Hiai, Proposition 9.3, p. 83" for φ_h, "Theorem 9.4, p. 84" for σ^(φ_h) and the cocycle, "Theorem 9.7, p. 87" for the faithful theorem, says Hiai states it for faithful weights only, and proves the nonfaithful extension by the support-corner route with three Checks; References `:4985–4987` agree.
- R03 — repaired: the bullets formerly at `:5024–5030` and `:5055` and the Zulip link at `:865` are gone (`grep -i zulip`, "Supply the required", "Hilbert–Schmidt norm is" all empty); the trace-density convention now sits under `## Conventions` at `:120–124` and names Tau Ceti's trace duality, with positivity, invertibility and unit trace left to V10.KMS.

## Verified sound

**Gate and dependency check.**
- The worker's gate at 7d10de2: every check 0, `build=0`, `OK`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty.
- The dependency check printed, exit 0:

```text
depcheck: 235 roadmaps, 2259 edges, 0 problem(s)
```

- No UPWARD, CYCLE or `moved:` line. VonNeumannAlgebras is at line 5 of the merge order.

**Lean, at the branch pins.**
- `lake env lean` on `Suggested.lean` exits 0 in 39 s with exactly 24 `declaration uses sorry` warnings and nothing else.
- `git diff 9c3f832..HEAD -- Suggested.lean` is empty, so the previous round's `#check @name` pass (41 declarations, every binder kept) and one-tactic probe (24 sites, none closes) stand. The worker's `signatures.md` lists a 42nd item `and : Bool → Bool → Bool` at "line 62": that line is prose inside the module docstring, so the entry is an artefact of the signature extractor, not a declaration of the file.

**The changed passages.**
- *Conventions, `:120–124`.* Tau Ceti at `2fd255d9`, `TauCeti/LinearAlgebra/Matrix/Trace/Duality.lean:31`: `existsUnique_trace_mul_eq (f : Matrix n n R →ₗ[R] R) : ∃! ρ, ∀ x, f x = (ρ * x).trace` over a commutative semiring, so the functional is `x ↦ Tr(ρx)` with ρ on the left, as the README writes `Tr_M(hx)`. Blockwise application to a direct sum of matrix blocks gives the unique h∈M. V10.KMS at `:2960–2962` writes faithful states the same way with h invertible, positive, `Tr_M(h)=1`, as the new sentence says.
- *Pedersen–Takesaki, `:3550–3566`.* hiai-lectures line 4061: the centralizer of a weight is the fixed-point algebra of σ^φ. Line 4170–4176: φ_A defined by `A_ε = A(1+εA)⁻¹` and `φ_A = sup_ε φ_(A_ε)`, with `φ_a(x) = φ(a^(1/2) x a^(1/2))` (line 4071). Line 4177, Proposition 9.3 (p. 83, marker at line 4144): (1) semifinite normal, (2) faithful iff A nonsingular, (3) `A ≤ B ⟺ φ_A ≤ φ_B`. Line 4223, Theorem 9.4 (p. 84, marker 4190): for nonsingular A, `σ^(φ_A)_t = A^(it) σ^φ_t(·) A^(−it)` and `(Dφ_A:Dφ)_t = A^(it)`. Line 4416, Theorem 9.7 (p. 87, marker 4415), for φ, ψ ∈ P(M) (faithful semifinite normal weights, line 3535): (i) ψ σ^φ-invariant, (ii) φ σ^ψ-invariant, (v) the cocycle is a strongly continuous one-parameter unitary group, (vi) ψ = φ_A with A nonsingular, unique. The README restates (i), (ii), (v), (vi) and the uniqueness; (iii)–(iv) are omitted, which is a choice, not an error.
- Line 4148, Lemma 9.2 (3): for a projection e in the centralizer, φ|eMe is faithful semifinite normal with modular group σ^φ restricted and `(eMe)^(φ|e) = e M^φ e` (line 4150). This is the CentralizerCornerRestriction target of `:3327–3329` that the route invokes.
- Hiai's own remark, lines 4452–4455 (p. 88): the cocycle and the conditions other than (ii) extend to a not necessarily faithful semifinite normal ψ. The README's extension is therefore consistent with the source; it proves it rather than citing it, which is fine since Hiai gives no proof there.
- References `:4985–4987`: the Hiai entry's pages 83, 84, 87 agree with the page markers above; the title "Concise lectures on selected topics of von Neumann algebras" is the title of the cached arXiv v1 (hiai-lectures lines 6–7) and of the manifest entry.
- Convention consistency: the new Check's `σ_t^φ = Ad(k^(it))` for `φ = Tr(k·)` agrees with the CentralizerCornerRestriction Check at `:3349` (`σ^φ_t = Ad(h^(it))∘σ^Tr_t`, `(Dφ:DTr)_t = h^(it)`), with V10.KMS at `:3002` (`Ad(h^(it))`) and with Theorem 9.4 (1)–(2) at base weight Tr.

**Seeded sample (13.1, 13.2).** Untouched by the diff; spot-checked again: hiai-lectures line 2666 (Theorem 6.5, Tomiyama); anantharaman-popa lines 7191 and 7198 (Definition 10.2.1, Proposition 10.2.2, printed p. 161 = pdf page 167, marker at line 7178) and line 8294 (Theorem 11.2.2, printed p. 186 = pdf page 192, marker at line 8264). The full sample record is in the previous report.

**Adversarial pass.** The rows for the changed statements were computed this round; the other rows are carried from the review of 9c3f832 (r35), whose values were recomputed there.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Conventions density `x↦Tr_M(hx)` (new) | M₂: `x↦x₁₁`; `tr/2`; ℂ⊕M₂ block sum | `Tr(e₁₁x) = x₁₁ + 0`; `Tr((1/2)x) = (x₁₁+x₂₂)/2 = tr(x)/2`; for (a,x)↦2a+x₂₂, h = (2, e₂₂), unique blockwise since Tr on each block is nondegenerate | holds, left density matches the Tau Ceti statement |
| Prop 9.3 restatement: faithful ⟺ nonsingular; `h≤k ⟺ φ_h≤φ_k` (new) | φ = Tr(k·), k = diag(2/3,1/3); h = diag(3/2,0); h′ = diag(1,0), k′ = diag(0,1); h″ = 1 | φ_h(e₂₂) = 0 with e₂₂ ≠ 0: not faithful, h singular; φ_(h′)(e₁₁) = 2/3 > 0 = φ_(k′)(e₁₁) and φ_(k′)(e₂₂) = 1/3 > 0 = φ_(h′)(e₂₂): neither order, as h′, k′ are incomparable; h′ ≤ 1 and φ_(h′) ≤ φ_1 = φ | holds both ways |
| Thm 9.4 restatement: `σ^(φ_h) = Ad(h^(it))∘σ^φ`, cocycle `h^(it)` (new) | φ = Tr(k·), h = diag(a,b) nonsingular diagonal | φ_h = Tr(kh·), so σ^(φ_h)_t = Ad((kh)^(it)) = Ad(h^(it))∘Ad(k^(it)) since k, h commute; (Dφ_h:Dφ)_t = (kh)^(it)k^(−it) = h^(it) | holds |
| Thm 9.7 restatement on faithful ψ (new) | φ = Tr(k·); ψ = Tr(m·), m = diag(1/2,1/2); ψ′ = Tr(m′·), m′ = [[1/2,1/4],[1/4,1/2]] | m commutes with k: ψ∘Ad(k^(it)) = ψ, φ∘Ad(m^(it)) = φ, (Dψ:Dφ)_t = (mk⁻¹)^(it) = diag((3/4)^(it),(3/2)^(it)) a unitary group, h = mk⁻¹ nonsingular; m′ faithful (det 3/16) but ψ′(σ_t^φ(e₁₂)) = 2^(it)·(1/4) = −1/4 ≠ 1/4 at t = π/log 2: not invariant, and m′k⁻¹ is not self-adjoint, so no φ_h | (i)⟺(v)⟺(vi) on both instances |
| Support formula `s(ψ∘σ_t^φ) = σ_(−t)^φ(s(ψ))` (new route step) | ψ_v, v = (1,1)/√2, σ_t = Ad(k^(it)) | ψ_v∘σ_t = ω_w with w = k^(−it)v; its support is the projection onto ℂw = k^(−it) p_v k^(it) = σ_(−t)(p_v) | holds |
| Nonfaithful extension, Check 1 (new) | ψ(x) = x₁₁, h = diag(3/2,0) | (k^(it)xk^(−it))₁₁ = x₁₁: invariant; ψ(e₂₂) = 0: not faithful; s(ψ) = e₁₁ diagonal, in the centralizer; h^(1/2)xh^(1/2) has (1,1)-entry (3/2)x₁₁, Tr(k·) of it = (2/3)(3/2)x₁₁ = x₁₁; on the corner e₁₁Me₁₁ = ℂ, φ_e = 2/3·id and h_e = 3/2 = ψ(e₁₁)/φ(e₁₁) | ψ = φ_h with h singular, outside Thm 9.7(vi), inside the extension |
| Nonfaithful extension, negative control (new) | ψ_v, v = (1,1)/√2 | ψ_v(e₁₂) = 1/2; ψ_v(2^(it)e₁₂) = 2^(it)/2 = −1/2 at t = π/log 2; support p_v = [[1/2,1/2],[1/2,1/2]] not diagonal | not invariant, no φ_h: the support argument is necessary, not vacuous |
| Nonfaithful extension, Check 3 and uniqueness (new) | φ = Tr on M_n; two densities h, h′ with Tr(hx) = Tr(h′x) | σ^Tr = id, centralizer M_n; Tr((h−h′)x) = 0 for all x gives h = h′ by nondegeneracy; s(φ_h) = s(h) since φ_h(x) = φ_h(s(h)xs(h)) and h restricted to s(h)H is nonsingular | reduces to trace duality; h unique |
| Converse `φ_h∘σ_t^φ = φ_h` (new) | h_ε in the centralizer | φ(h_ε^(1/2)σ_t(x)h_ε^(1/2)) = φ(σ_t(h_ε^(1/2)xh_ε^(1/2))) = φ(h_ε^(1/2)xh_ε^(1/2)) by σ^φ-invariance of φ; sup over ε | holds for every positive h, singular or not |
| `tomiyama` (13.1) | r35 | r35 values | holds, nonunital form needed |
| Arveson Checks (13.1) | r35 | r35 values | holds; existence only |
| `IsInjective`, `IsHyperfinite`, `isInjective_iff_isHyperfinite` | r35 | r35 values (H = 0, B(ℓ²), ℓ∞, L(F₂)) | both sides agree |
| Følner operator and projection forms (13.2) | r35 | r35 values (ℂ², τ = (a+2b)/3) | projection form needs a II₁ factor; operator form holds |
| Semidiscreteness Checks | r35 | r35 values | point-ultraweak, not norm |
| V13b.SpatialNorm Checks | r35 | r35 values | holds |
| Bicentralizer Checks (13.2) | r35 | r35 values | holds |
| CFW Checks | r35 | r35 values | holds |
| II₁ and II∞ uniqueness (13.2) | r35 | r35 values | hypotheses select exactly the intended factors |
| `exists_faithful_nondegenerate_representation` | r35 | r35 values | holds |
| `exists_injective_nondegenerate_representation_lp` | r35 | r35 values | holds; `[Nontrivial A]` needed |
| `double_commutant_iff_isClosed_image_ofCLM` | r35 | r35 values | iff holds both ways |
| `closure_unitBall_eq_unitBall_double_centralizer` | r35 | r35 values | SOT, not norm, density |
| `closure_isStarProjection_eq_positive_contractions` | r35 | r35 values | holds; infinite dimension needed |
| `exists_predual`, Sakai | r35 | r35 values | holds |
| `IsNormalFunctional`, `isNormalFunctional_iff_exists_tsum_inner` | r35 | r35 values | both directions |
| `isCyclic_iff_isSeparating_commutant` | r35 | r35 values | holds |
| `equivalent_of_subequivalent` | r35 | r35 values | equivalence, not equality |
| `tracialState_unique` | r35 | r35 values | holds |
| `exists_faithful_tracialState`, `isSimpleRing_of_isTypeIIOne` | r35 | r35 values | holds; hypothesis used |
| `exists_isNormalSemifiniteTrace_of_isFactor` | r35 | r35 values | holds |
| `exists_conj_commutant_eq_of_isCyclic` | r35 | r35 values | holds |
| `existsUnique_typeDecomposition` | r35 | r35 values | unique |
| `ergodicSMul_dense_subgroup` | r35 | r35 values | density needed |
| `existsUnique_isKMS_flow` | r35 | r35 values (M₂, h = diag(2/3,1/3)) | exists, unique |
| `HasTypeITwoSummand`, `exists_unique_extension_of_finitelyAdditive` | r35 | r35 values | holds; I₂ exclusion needed |
| `dye` | r35 | r35 values | holds |
| Affine-group involution, V8.RegularL2, V10.Hecke, V10.FiniteComplexPowers, V9, V11, V12, V7 Checks | r35 | r35 values | hold |

**Cross-roadmap citations and ownership.** The diff adds no cross-roadmap citation. `roadmaps resolve` and `roadmaps overlaps` found nothing (the worker's `citations.md` and `overlaps.md`); no other open pull request changes this roadmap and no cited id is dropped. Ownership against the open pull requests was checked only through those tools and the previous round's grep.

## Not verifiable

- **Wassermann III (wassermann-1988):** image-only scan, no OCR on this worker (`needs-references.toml`); untouched by the diff.
- **Uncertified, settled:** Arveson 1969, Haagerup 1985, Haagerup 1987, Connes–Størmer 1978.
- **Not in the manifest or the cache:** Takesaki II (Theorems VIII.2.6, IX.4.2, Chapter VIII §3), Sakai Theorem 4.1.6, cited by locator in the passage around the change; and the rest of the list in the previous report.

## Source issues

- none

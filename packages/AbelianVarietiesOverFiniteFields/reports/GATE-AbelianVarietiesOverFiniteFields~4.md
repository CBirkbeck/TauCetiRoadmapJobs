# GATE-AbelianVarietiesOverFiniteFields~4: answers to human review

One unanswered comment, one point (H01). Commit `15405958` on top of `079b61f`; only
`TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md` changed (Provenance section);
`Suggested.lean` is unchanged.

## H01 (mycaule) — applied

The observation holds at commit `27cdb20` of AxiomMath/Weil: the 30 files of
`Weil/AlgebraicGeometry/EtaleCohomology/Trace/` prove the Weil conjectures for schemes over a finite
field. `Weil.satisfiesWeilEstimate` (`DeligneWeilConjecture.lean`, line 367, for smooth proper `S`
over a finite `k`) is the abelian-variety case only at `X = A`, `ν = 1`, and only after a comparison
`H¹(A_{K̄}, ℚ_ℓ) ≅ (V_ℓ A)^∨` that the repository does not contain. Its own files have no Tate module
and no characteristic polynomial of an endomorphism of an abelian variety. Their one mention of an
abelian variety is the divisibility of `Pic⁰` of a curve in `Curves/RootsOfUnityAffineCurveRank.lean`.

The Provenance section said the overlap was only in "scheme-level inputs … and in the Weil-number
predicate", which leaves this out. README line 2441–2444, old: "…steps of 1.2 and 7.2) and in the
Weil-number predicate consumed from CurvesOverFiniteFields 1.1." New: "…steps of 1.2 and 7.2), in the
Weil-number predicate consumed from CurvesOverFiniteFields 1.1, and in the Weil estimate consumed from
DWP.1 §1.4, for which the second has only the Riemann hypothesis for all smooth proper schemes."

The AxiomMath/Weil entry (lines 2489–2499) gains two sentences:
- **The `Trace` directory (linked).** Its `DeligneWeilConjecture.lean` proves that geometric
  Frobenius on `H^ν(X_{K̄}, ℚ_ℓ)` is pure of weight `ν`, and DWP's own Provenance maps that file to
  DWP.4 §4.3. At `X = A`, `ν = 1` it gives the Weil estimate of DWP.1 §1.4 only through the
  `H¹`/`(V_ℓ A)^∨` comparison, which the repository lacks, so nothing in its own files is specific to
  abelian varieties.
- **The same gap elsewhere in the entry.** `Curves/RootsOfUnityAlgClosed.lean`
  (`rootsOfUnityH1AddEquivPicardTorsion`, line 257: `H¹(C, μ_n) ≅ Pic(C)[n]` for a smooth projective
  curve over an algebraically closed field, `n` invertible) is the first step of 1.5's Kummer
  isomorphism. The entry did not name it either.

This roadmap consumes the Weil estimate from DWP.1 §1.4, which proves it through Rosati positivity.
DWP's Provenance states that DWP.1 has no counterpart in AxiomMath/Weil, so no milestone or *Needs:*
line here changes.

Not added to the README, for the reviewer's information: the repository's Lake dependency,
AxiomMath/Stacks (`StacksFrontier/AlgebraicGeometry/GroupScheme/AbelianVariety/`), does have
general-field abelian-variety material:
- the characteristic polynomial of an endomorphism, with `deg α = det(T_ℓ α)`;
- Tate modules;
- degree polynomials.

That is prior art for the suppliers' A4.1 and A6.10–A6.11, not for a milestone of this roadmap, and
that copy was read at `f8e70c5`, not at the `012108f` that AxiomMath/Weil pins.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `Trace/` proves RH for smooth proper `X` over `𝔽_q` | `Weil.satisfiesWeilEstimate` hypotheses; variable block of `DeligneWeilConjecture.lean` line 54 | `[Field k] [Fintype k]`, `[IsProper f] [Smooth f]`, `ℓ ≠ ringChar k`; conclusion `‖ι μ‖ = (#k)^(ν/2)` for every root `μ` of the charpoly of `F_ν` (`Definitions.lean` line 161) | holds; "smooth proper" (not "projective") matches | none |
| Frobenius in that theorem is geometric | the source's own statement of `P_ν = det(1 − tF_ν \| H^ν)` and the module docstring of `CanonicalFrobeniusIso.lean` | both call `F_ν` the geometric Frobenius | holds | wrote "geometric" |
| `X = A`, `ν = 1` gives the Weil estimate through `H¹ ≅ (V_ℓ A)^∨`, geometric Frobenius ↦ transpose of `π_A` | `E/𝔽_5`, trace 2, `P = T² − 2T + 5` | transpose of `π` has roots `1 ± 2i`, `\|1 ± 2i\| = √5 = 5^(1/2) = q^(ν/2)` ✓. Wrong model `H¹ ≅ V_ℓ A` with geometric Frobenius `π⁻¹`: roots `(1 ∓ 2i)/5`, modulus `5^(−1/2)`, weight −1 ≠ 1 ✗. So the dual is needed, as in DWP.1 §1.4 and the 1.5 Checks | holds; the dual is forced | none |
| Same, degenerate cases | `g = 0`; `ℓ = p` | `A = Spec K`: `H¹ = 0 = V_ℓ A`, vacuous on both sides; `ℓ = p` is excluded by `Fact (ℓ ≠ ringChar k)` there and by the Conventions here | consistent | none |
| The repository's own files have nothing specific to abelian varieties | search of `Weil/` for Tate modules, abelian varieties, Rosati, polarizations | no Tate-module identifier; one abelian-variety mention (`RootsOfUnityAffineCurveRank.lean`, divisibility of `Pic⁰` of a curve, through StacksFrontier); no Rosati or polarization | holds for the repository's own files; scoped to "the repository's own files" because AxiomMath/Stacks has abelian-variety material | scoped wording |
| DWP's Provenance maps `DeligneWeilConjecture.lean` to DWP.4 §4.3 | DWP README at its open head | Provenance bullet "4.3, 4.4 and 7.15(i)–(ii) … (`DeligneWeilConjecture.lean`, …)"; heading "### 4.3. The Weil theorem for smooth projective varieties" exists; DWP.1 §1.4 heading exists | holds | none |
| `H¹(C, μ_n) ≅ Pic(C)[n]`, the first step of 1.5's Kummer isomorphism | `rootsOfUnityH1AddEquivPicardTorsion (hn : IsUnit (n : k))` under `[IsAlgClosed k] [IsProjectiveVariety k f]`; 1.5 over `K^sep = K̄` (1.2) with `n = ℓⁿ`, `ℓ ≠ p` | `n = 1`: `H¹(C, μ_1) = 0 = Pic(C)[1]`. `ℓ = p` is excluded on both sides (1.5's sixth Check: `H¹(C, μ_5) = 0` while `J[5] ≅ ℤ/5` for the ordinary curve over `𝔽_5`). 1.5 then composes with `Pic[ℓⁿ] = Pic⁰[ℓⁿ] = J[ℓⁿ](K^sep)`, which the file does not claim | holds | none |
| Overlap sentence (line 2441–2444) agrees with the bullet | read together | the sentence says "only the Riemann hypothesis for all smooth proper schemes"; the bullet says "only through a comparison … which they do not contain" | consistent | first draft "contains only as a case" made more precise |

No Check, target or *Needs:* line was added or changed. The Provenance section stays secondary and
prescribes nothing.

## Signatures

`Suggested.lean` is unchanged at this commit, so the elaborated types in the job's `signatures.md`,
taken from this file, are current. The four definitions flagged for a dropped `[Algebra ℚ E]` are
`colon`, `multiplierRing`, `IsInvertible` and `WeakEquiv`. Each has a real body that never uses the
`ℚ`-algebra structure. The theorems that use them all carry `[Algebra ℚ E]`, `[Module.Finite ℚ E]`,
`[IsReduced E]` and `IsOrder E Λ` in their elaborated types:
- `weakEquiv_iff_one_mem`;
- `isGorenstein_iff_forall_invertible`;
- `finite_pic`.

So no statement loses a hypothesis, and nothing changed.

## Ownership and citations

The repair adds no construction or target. Its only new cross-roadmap citation is *Deligne weights,
purity and the Weil bounds* DWP.4 §4.3 and its Provenance, checked at that roadmap's open head. That
roadmap is already a supplier and is earlier in the merge order. Every AxiomMath file the README
names exists at `27cdb20`; the local copy was confirmed to be that commit. The comment contains no
instructions, and nothing in it is suspicious.

## Build and gate

- `lake build TauCetiRoadmap.AbelianVarietiesOverFiniteFields.Suggested`: `Build completed
  successfully (18244 jobs).` There are four `declaration uses 'sorry'` warnings, at lines 38, 89, 115
  and 148 (the four headline theorems).
- Gate, after the commit: `gate AbelianVarietiesOverFiniteFields: set_option=0 blob=0 latex=0 tex=0
  prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0
  no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0
  empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0
  stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The run before the commit reported
  only `dirty=1` (the uncommitted README).
- Dependency check: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`. There are no UPWARD, CYCLE
  or `moved:` lines.

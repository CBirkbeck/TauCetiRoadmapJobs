# GATE-SchemeAndStackFoundationsPartII~2: answer to human review at e4fc200

One review, by kim-em: a follow-up recommending approval, with four separate points (H01–H04). Three are answered with evidence and need no change. One (H03) led to a one-clause correction in the Conventions. New head: `7fca6d30` (one commit on top of `e4fc200`, not pushed).

## H01 (kim-em) — answered

The reviewer's check is correct. Frobenius sends Σaᵢtⁱ to Σaᵢᵖt^(ip) = Σaᵢt^(ip), so its image is 𝔽_p[t^p]. The cokernel has basis {tⁱ : p∤i} (for p=2 that is t, t³, t⁵, …), and it contains the nonzero class of t, which is the torsor x^p=t. Over 𝔽_p[[t]] the image is 𝔽_p[[t^p]], and over 𝔽_p it is all of 𝔽_p because a^p=a. The notation now appears at `TauCetiRoadmap/SchemeAndStackFoundationsPartII/README.md` lines 3, 194, 234 and 349. A search finds no `𝔽_p[t]^p` or `𝔽_p[[t]]^p` left. The remaining `(R^×)^p` and `(ℤ_p^×)^p` (lines 135 and 195) mean the subgroup of p-th powers in a multiplicative group, which is the correct reading there.

## H02 (kim-em) — answered

`README.md` line 155 names `flatCohomology` as the primary carrier and §2.2 as the single proof of henselian invariance. Two bullets of §2.0 under *Flat cohomology* carry the comparisons:
- line 188 compares with the animated groups of gap:animated-flat-cohomology;
- line 189 compares with SchemeAndStackFoundations §2.9a through its `fppfCohomology_algSpec`. At the head of the revision that adds §2.9a, that section proves *fppfCohomology_algSpec* on the dense subsite `algSpec`, using `TauCeti.CommAlgCat.isCoverDense_algSpec`, which is at the pin in `TauCeti/Algebra/Category/CommAlgCat/Fppf.lean:99`.

The *Needs:* lines of §2.5 (line 281) and §2.6 (line 294) cite those two bullets.

## H03 (kim-em) — applied

The reviewer's split is right: SchemeAndStackFoundations §2.9a constructs the groups, and PurityForFlatCohomology §0.2 owns the complex RΓ_Z with its comparisons. The Conventions credited the wrong section, so `README.md` line 27 changes:

- **old:** "… as constructed in PurityForFlatCohomology §3.2, and for ordinary schemes in SchemeAndStackFoundations §2.9a; RΓ_I(A,G) denotes support in V(I)."
- **new:** "… as constructed in PurityForFlatCohomology §3.2; for an ordinary scheme X the groups with supports H^i_Z(X,G) are those of SchemeAndStackFoundations §2.9a. RΓ_I(A,G) denotes support in V(I)."

Evidence:
- At the head of the SchemeAndStackFoundations revision (#2531, `cea30e1`), §2.9a defines *Scheme.fppfCohomologyWithSupport* as relative `Ext` groups (`relativeH'`). With them it gives H⁰_Z = ker(F(T)→F(U)), the long exact sequence, the triple sequence and excision. It defines no fibre complex.
- At the PurityForFlatCohomology head (#1840, `ea95fba`), §0.2 defines RΓ_Z(X,−) as a right derived functor with the fibre triangle, and identifies its cohomology groups with §2.9a's.
- This README writes RΓ_Z and RΓ_I only for animated A (lines 13, 27, 322, 475), which is PurityForFlatCohomology §3.2. For schemes it uses only the groups (§2.6; the contract at line 424).

So the README now credits each object to its owner. It adds no new supplier item: §0.2 stays consumed only for étale excision and the étale comparison (line 475).

## H04 (kim-em) — answered

The README cites two things that main does not have:
- SchemeAndStackFoundations §2.9a, which only #2531 defines (per `roadmaps overlaps`);
- PurityForFlatCohomology, a new roadmap in #1840.

It cites nothing that #2489 adds: there is no §1.22a and no cohomologically affine or linearly reductive material, and PurityForFlatCohomology at its head does not cite §1.22a either. #2489 is in the chain because `roadmaps overlaps SchemeAndStackFoundations` reports that #2489 and #2531 conflict in `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, so one is rebased on the other. The order #2489, #2531, #1840, then this pull request is therefore consistent. The dependency check reports 0 problems (below).

## Adversarial pass on the changed sentence and on the values checked above

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| line 27: supported groups on an ordinary scheme are §2.9a's H^i_Z(X,G) | Z=∅; Z=X; X=Spec 𝔽_p[t]/(t^p) with Z=X and G=μ_p | Z=∅ gives 0 (§2.9a *fppfCohomologyWithSupport_empty*), matching the Conventions Check "I=(1) gives 0". Z=X gives H^i_fppf(X,G) (*…_univ*), matching "I=(0) gives full". H⁰_Z(X,μ_p)=1+(t), of order p^(p−1), the same as μ_p(A)=1+(t) at README line 180 | consistent | clause corrected |
| line 27: animated RΓ_Z for discrete A against the scheme groups | A=Spec of an ordinary ring | PurityForFlatCohomology §3.2: for discrete A the construction agrees with §0.2. §0.2: its groups are §2.9a's H^i_Z | consistent; line 27 asserts nothing beyond this | none |
| H¹_fppf(𝔽_p[t],α_p)=𝔽_p[t]/𝔽_p[t^p] (lines 3, 194, 349) | p=2, p=3; class of t | F(Σaᵢtⁱ)=Σaᵢt^(ip). Cokernel basis for p=2: t, t³, …; for p=3: t, t², t⁴, t⁵, …. The class of t is not 0 | true | none |
| §2.2 Check: H¹(𝔽_p[[t]],α_p)≠0 maps onto H¹(𝔽_p,α_p)=0; H²=0 on both sides | p=2; target 𝔽_p | Image of F on 𝔽_p[[t]] is 𝔽_p[[t^p]], and t is outside it. On 𝔽_p, F is the identity, so the cokernel is 0. H²(α_p)=coker(F on H¹(𝔾_a))=coker(0→0)=0 on affines | true; surjective but not injective in degree 1, which agrees with §2.2 (bijective only for n≥2) | none |
| étale cohomology of α_p is 0 (lines 3, 194) | étale 𝔽_p[t]-algebras | these are reduced, so α_p(A′)={a : a^p=0}=0 and the étale restriction is the zero sheaf, so H¹_et=0 | true | none |

## Other checks

- **Suggested.lean** is unchanged in this round. I compared the elaborated types of its six declarations (the job's signature file, generated at `e4fc200`) with README §2.0, §2.2 (`flatCohomology_henselian_invariance`: `HenselianRing R I`; surjective for 1≤n, bijective for 2≤n) and §2.3 (`flatCohomology_algebraization`: open B′, `IsHenselianNonunitalSubring`, basis of open B′-ideals, bijective for 2≤n into `UniformSpace.Completion B`). Every hypothesis is in the signature, the `HasExt` instance included, and no binder is lost. I did not re-elaborate `#check` lines because the file did not change.
- **Ownership:** the repair adds no construction; it only narrows an attribution to the owners named in Scope and ownership (lines 357 and 363).
- **Sources:** no new citation; nothing is missing, and no `needs-references.toml` was written.
- **Untrusted text:** the review contains no instructions beyond the mathematics; nothing is suspicious.

## Build and gate

- `lake build TauCetiRoadmap.SchemeAndStackFoundationsPartII.Suggested`: `Build completed successfully (18288 jobs).` The only warnings are `declaration uses 'sorry'` at `Suggested.lean:102:8` and `Suggested.lean:130:8`, the two headline theorems.
- Gate, after the commit: `gate SchemeAndStackFoundationsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable --pr 2272`): `depcheck: 110 roadmaps, 1269 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- Commit: `7fca6d30 SchemeAndStackFoundationsPartII: review repairs (supported groups on schemes are SchemeAndStackFoundations §2.9a's, not a fibre complex)`.
